var express = require('express');
var DB=require("../db/connect");
var router = express.Router();
var viewPath='actions/admin/';
var sqlCode=require("./sql");
var personalAvgGetSQL=sqlCode.personalAvgGetSQL;
var Queue=require("../queue");
/* GET home page. */
router.post('/admin/login', function(req, res) {
    render.res=res;
    render.view='adminUserManager';
    DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});
var currentQueue=null;
function loginLogic(data){
    if(data.length>0)
    {
        return data[0];
    }
    else
    {
        render.res.render(viewPath+"login",{error:"用户名或密码错误，请重新登录"});
    }
}

router.get('/admin/systemNotice',function(req,res){
    render.req=req;
    render.res=res;
    render.view='systemNotice';
    currentQueue=new Queue("systemNotice");
    currentQueue.push({exec:function(data){
        DB.query("select * from config",bindData,systemNoticeLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});
    currentQueue.start();
});
function systemNoticeLogic(data){
    return data[0];
}

router.post('/admin/saveNotice',function(req,res){
    var content=req.body.content;
    DB.update("delete from config where system='system'",function(){
        var sql="insert into config set notice=? ,system=?";
        DB.execute(sql,[content,'system']);
        res.json({status:"success"});
    });
});


router.get('/admin/delAdvUser',function(req, res){
	var username=req.query.username;
	DB.update("delete from advuser where username='"+username+"'",function(){
		res.json({status:"success"});
	});
});


router.post('/admin/addAdmin',function(req,res){
    var sql="insert into admin set userid=?,username=?,password=?"
    var result=[];
    result.push(req.body.userid);
    result.push(req.body.username);
    result.push(req.body.password);
    DB.execute(sql,result);
    //res.json({status:"success"});
    res.redirect('/admin/adminUserManager');
});


/*增加管理员*/
router.get('/admin/adminUserManagerAdd',function(req,res){
    res.render(viewPath+"adminUserManagerAdd",{});
});

/*修改管理员*/
router.get('/admin/adminUserManagerMod',function(req,res){
    render.res=res;
    render.req=req;
    var userid=req.query.userid;
    render.view="adminUserManagerMod"
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select * from admin where userid='"+userid+"'",bindData,advUserManagerModLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});

    currentQueue.start();
});


/*删除管理员*/
router.get('/admin/adminUserManagerDel',function(req,res){
    var username=req.query.username;
    console.log("delete from admin where userid='"+username+"'");
    DB.update("delete from admin where userid='"+username+"'",function(){
        //res.json({status:"success"});
        res.redirect('/admin/adminUserManager');
    });
});


/*router.get('/admin/userManagerDetail',function(req, res){
    var userid=req.query.userid;
    render.res=res;
    render.req=req;
    var userid=req.query.userid;
    render.view="userManagerDetail"
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select * from users where Id="+userid,bindData,advUserManagerModLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        //render.apply(data[0],['',function(data){return data;}]);
        res.json(data[0]);
        currentQueue.end();
        currentQueue=null;
    }});

    currentQueue.start();
});*/

router.get('/admin/delUsers',function(req,res){
    var userid=req.query.userid;
    DB.update("delete from users where Id="+userid,function(){
        res.json({status: true});
    });
});
router.get('/admin/getRegistryUser',function(req, res){
    render.res=res;
    render.req=req;
    var userid=req.query.userid;
    render.view="advUserManagerMod"
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select users.*, f.secretNum as secretNum,fr.friendNum as friendNum from users "+"left join (select owner,count(files.Id) as secretNum from files group by owner) f on users.username=f.owner "+"left join (select username,count(friends.Id) as friendNum from friends group by username) fr on users.username=fr.username "+"group by users.username",bindData,getUserLogic,'secretDatas');
    }});

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';
        if(_tmpData.length > 0){
            var owners = [];
            for(var o in _tmpData){
                owners.push('"'+_tmpData[o].username+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }
        
        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData.length; k++) {
                    var secret = _tmpData[k];
                    secret['personal_score'] = avgDatas[secret['username']];
                };
            }

            return _tmpData;
        });
    }});

    currentQueue.push({exec:function(data){
        //render.apply(data[0],['',function(data){return data;}]);
        res.json(data[0]);
        currentQueue.end();
        currentQueue=null;
    }});

    currentQueue.start();
});


router.get('/admin/advUserManager',function(req, res){
    res.render(viewPath+"advUserManager",{});
});

router.get('/admin/advUserManagerAdd',function(req, res){
    res.render(viewPath+"advUserManagerAdd",{});
});

router.get('/admin/advUserManagerMod',function(req, res){
	render.res=res;
	render.req=req;
	var username=req.query.userid;
	render.view="advUserManagerMod"
	currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select * from advuser where username='"+username+"'",bindData,advUserManagerModLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});

    currentQueue.start();
});
function getUserLogic(data){return data;}
function advUserManagerModLogic(data){
	return data[0];
}
router.get('/admin/adminUserManager',function(req, res){
    res.render(viewPath+"adminUserManager",{});
});

router.get('/admin/userManager',function(req, res){
    res.render(viewPath+"userManager",{});
});

router.get('/admin/surveyManager',function(req, res){
    currentQueue=new Queue();
    currentQueue.push({exec:function(){
        DB.query("select * from survey",bindData,getUserLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        console.log(data[0][0]);
        res.render(viewPath+"surveyManager",data[0][0]);
    }});
    currentQueue.start();
    
});
function surveyLogic(data){
    return data;
}
router.get('/admin/index', function(req, res) {
    res.render(viewPath+"index",{});
});
router.get('/admin/login', function(req, res) {
    res.render(viewPath+"login",{});
});


router.post('/admin/addAdvUser',function(req, res){
    var sql="insert into advuser set userid=?,username=?,password=?,location=?"
    var result=[];
    result.push(req.body.userid);
    result.push(req.body.username);
    result.push(req.body.password);

    var loca = req.body.location,
        locations = '',
        advLoca = req.body.location;
    if(loca instanceof Array){
        locations = loca.join(",");
    }else if(typeof loca == 'string'){
        locations = loca;
        advLoca = [loca];
    }else{
        locations = '';
    }
    result.push(locations);
    DB.exec(sql, result, function(err, result) {
        if(err)
            throw err;
        console.log(result);

        if(result.insertId > 0) {
            res.redirect('/admin/advUserManager');
        } else {
            res.redirect('/admin/advUserManagerAdd');
        }
    })

    /*// 插入选择的广告
    var params = [];
    var advSql = 'insert into advs(owner, location) values';
    if(advLoca){ 
        for(var l in advLoca){
            if(l == advLoca.length - 1){
                advSql += '(?,?)';
            }else{
                advSql += '(?,?), ';
            }
            params.push(req.body.username)
            params.push(advLoca[l]);
        }

        DB.execute(advSql, params);
    }*/

});

router.post('/admin/updateAdvUser',function(req, res){
	var password=req.body.password||"";
	var sql="";

    var loca = req.body.location,
        locations = '',
        advLoca = req.body.location;
    if(loca instanceof Array){
        locations = loca.join(",");
    }else if(typeof loca == 'string'){
        locations = loca;
        advLoca = [loca];
    }else{
        locations = '';
    }

    /*// 更新选择的广告
    DB.update('delete from advs where owner="'+req.body.username+'"',function(){
        var params = [];
        var advSql = 'insert into advs(owner, location) values';
        if(advLoca){ 
            for(var l in advLoca){
                if(l == advLoca.length - 1){
                    advSql += '(?,?)';
                }else{
                    advSql += '(?,?), ';
                }
                params.push(req.body.username)
                params.push(advLoca[l]);
            }

            DB.execute(advSql, params);
        }
    });*/

	if(password!="")
	{
		sql="update advuser set username='"+req.body.username+"',password='"+password+"',location='"+locations+"' where userid='"+req.body.userid+"'";
	}
	else{
		sql="update advuser set username='"+req.body.username+"',location='"+locations+"' where userid='"+req.body.userid+"'";
	}
    
    DB.update(sql,function(){
    	res.redirect('/admin/advUserManager');
    });
    
});


router.post('/admin/postSurvey',function(req,res){
    var question=req.body.question;
    var answer1=req.body.answer1;
    var answer2=req.body.answer2;
    var answer3=req.body.answer3;
    var answer4=req.body.answer4;
    var answer5=req.body.answer5;
    var answer6=req.body.answer6;

    var sql="insert into survey set question=?,answer1=?,answer2=?,answer3=?,answer4=?,answer5=?,answer6=?";
    var results=[question];
    results.push(answer1);
    results.push(answer2);
    results.push(answer3);
    results.push(answer4);
    results.push(answer5);
    results.push(answer6);
    DB.update("delete from survey",function(){
        DB.execute(sql,results);
        res.redirect("/admin/surveyManager");
    });
});

router.get('/admin/getAdmins',function(req, res){
    ajaxRender.res=res;
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select * from admin",bindData,getUserLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        ajaxRender.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
    }});
    currentQueue.start();
});

router.get('/admin/getAdvUser',function(req, res){
    ajaxRender.res=res;
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select * from advuser",bindData,getUserLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        ajaxRender.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
    }});
    currentQueue.start();
});

function getUserLogic(data){
    var result=[];
    if(data.length>0)
    {
        result=data;
    }
    return result;
}
function bindData(keyname,logic){
    var data=logic(this);
    if(currentQueue.next()){
        currentQueue.exec(data);
    }
}

/* 秘密管理开始 */
router.get('/admin/secretManager',function(req, res){
    res.render(viewPath+"secretManager",{});
});

router.get('/admin/getSecrets',function(req, res){
    ajaxRender.res=res;
    currentQueue=new Queue("getSecrets");
    currentQueue.push({exec:function(){
        DB.query("select * from files",bindData,getSecretsLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        ajaxRender.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
    }});
    currentQueue.start();
});
function getSecretsLogic(data){
    var result=[];
    if(data.length>0)
    {
        result=data;
    }
    return result;
}

router.post('/admin/setNoReply',function(req, res){
    var id=req.body.id,
        noReply = req.body.noReply == 0 ? 1 : 0;
    DB.update("update files set noReply = "+noReply+ " where Id='"+id+"'",function(){
        res.json({status:"success"});
    });
});

router.get('/admin/delSecret',function(req, res){
    var id=req.query.id;
    DB.update("delete from files where Id='"+id+"'",function(){
        res.json({status:"success"});
    });
});
/* 秘密管理结束 */


/* 回复管理开始 */
router.get('/admin/replyManager',function(req, res){
    res.render(viewPath+"replyManager",{});
});

router.get('/admin/getReplies',function(req, res){
    ajaxRender.res=res;
    currentQueue=new Queue("getReplies");
    currentQueue.push({exec:function(){
        DB.query("select * from replay",bindData,getRepliesLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        ajaxRender.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
    }});
    currentQueue.start();
});
function getRepliesLogic(data){
    var result=[];
    if(data.length>0)
    {
        result=data;
    }
    return result;
}

router.get('/admin/delReply',function(req, res){
    var id=req.query.id;
    DB.update("delete from replay where replayId='"+id+"'",function(){
        res.json({status:"success"});
    });
});
/* 回复管理结束 */


function ajaxRender(keyname,logic){
    var data=logic(this);
    ajaxRender.res.json(data)
}
function render(fields,logic){
    var result=logic(this);
    if(result!==false)
    {
        render.res.render(viewPath+render.view, result);
    }
    
}
module.exports = router;