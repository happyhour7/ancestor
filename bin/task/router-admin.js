var express = require('express');
var DB=require("../db/connect");
var router = express.Router();
var viewPath='actions/admin/';
var sqlCode=require("./sql");
var personalAvgGetSQL=sqlCode.personalAvgGetSQL;
var Queue=require("../queue");
var filter = require('./admin-filter');

/* GET home page. */
router.post('/admin/login', function(req, res) {
    DB.exec('select * from admin where userid=? and password=?', [req.body.userid, req.body.password], function(error, data) {
        if(error) {
            console.log(error);
        }

        console.log(data);
        if(data.length>0)
        {
            req.session.userid=data[0].userid;
            req.session.user=data[0];
            res.redirect('/admin/adminUserManager');
        }
        else
        {
            res.render(viewPath+"login",{error:"用户名或密码错误，请重新登录"});
        }
    });
});
var currentQueue=null;

router.get('/admin/systemNotice', filter.authorize, function(req,res){
    render.req=req;
    render.res=res;
    render.view='systemNotice';
    currentQueue=new Queue("systemNotice");
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='rank'",bindData,systemNoticeLogic,'secretDatas');
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


router.get('/admin/delAdvUser', filter.authorize,function(req, res){
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
router.get('/admin/adminUserManagerAdd', filter.authorize,function(req,res){
    res.render(viewPath+"adminUserManagerAdd",{});
});

/*修改管理员*/
router.get('/admin/adminUserManagerMod',function(req,res){
    render.res=res;
    render.req=req;
    var userid=req.query.userid;
    render.view="adminUserManagerMod";
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
router.get('/admin/adminUserManagerDel', filter.authorize,function(req,res){
    var username=req.query.username;
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

router.get('/admin/delUsers', filter.authorize,function(req,res){
    var userid=req.query.userid;

    DB.exec('select username from users where Id=?', [userid], function(err, rest) {
        if(err)
            console.log(err);

        DB.update("delete from users where Id="+userid,function(){
            // 删除好友关系
            DB.update("delete from friends where friendname='"+rest[0]['username']+"'",function(){
                DB.update("delete from friends where username='"+rest[0]['username']+"'", function() {
                    res.json({status: true});
                });
            });
            
        });
    });
});
router.get('/admin/getRegistryUser', filter.authorize,function(req, res){
    render.res=res;
    render.req=req;
    var userid=req.query.userid;
    render.view="advUserManagerMod"
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select users.*, f.secretNum as secretNum,fr.friendNum as friendNum from users "+"left join (select owner,count(files.Id) as secretNum from files group by owner) f on users.username=f.owner "+"left join (select username,count(friends.Id) as friendNum from friends group by username) fr on users.username=fr.username "+"group by users.username order by Id desc",bindData,getUserLogic,'secretDatas');
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
        res.json(data[0]);
        currentQueue.end();
        currentQueue=null;
    }});

    currentQueue.start();
});


router.get('/admin/advUserManager', filter.authorize,function(req, res){
    res.render(viewPath+"advUserManager",{});
});

router.get('/admin/advUserManagerAdd', filter.authorize,function(req, res){
    res.render(viewPath+"advUserManagerAdd",{});
});

router.get('/admin/advUserManagerMod', filter.authorize,function(req, res){
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
router.get('/admin/adminUserManager', filter.authorize,function(req, res){
    res.render(viewPath+"adminUserManager",{});
});

router.get('/admin/userManager', filter.authorize,function(req, res){
    res.render(viewPath+"userManager",{loginUser: req.session.user.Id});
});

router.get('/admin/surveyManager', filter.authorize,function(req, res){
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
router.get('/admin/index', filter.authorize, function(req, res) {
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

router.get('/admin/getAdmins', filter.authorize,function(req, res){
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

router.get('/admin/getAdvUser', filter.authorize,function(req, res){
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
router.get('/admin/secretManager', filter.authorize,function(req, res){
    res.render(viewPath+"secretManager",{});
});

router.get('/admin/getSecrets', filter.authorize,function(req, res){
    ajaxRender.res=res;
    currentQueue=new Queue("getSecrets");
    currentQueue.push({exec:function(){
        DB.query("select * from files order by createTime desc",bindData,getSecretsLogic,'secretDatas');
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

router.get('/admin/delSecret', filter.authorize,function(req, res){
    var id=req.query.id;
    DB.update("delete from files where Id='"+id+"'",function(){
        res.json({status:"success"});
    });
});
/* 秘密管理结束 */


/* 回复管理开始 */
router.get('/admin/replyManager', filter.authorize,function(req, res){
    res.render(viewPath+"replyManager",{});
});

router.get('/admin/getReplies', filter.authorize,function(req, res){
    ajaxRender.res=res;
    currentQueue=new Queue("getReplies");
    currentQueue.push({exec:function(){
        DB.query("select replay.*,secretTitle from replay left join files on files.Id=replay.fileid;",bindData,getRepliesLogic,'secretDatas');
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

router.get('/admin/delReply', filter.authorize,function(req, res){
    var id=req.query.id;
    DB.update("delete from replay where replayId='"+id+"'",function(){
        res.json({status:"success"});
    });
});
/* 回复管理结束 */

// 管理员给用户发送消息
router.post('/admin/addUsermsg',function(req, res){
    var userid=req.body.userid,
        msg = req.body.msg;

    var result=[userid];
    result.push(msg);
    result.push("未读");
    result.push("等待用户阅读");
    result.push('管理员发送消息');
    result.push(req.session.userid);
    DB.exec("insert into systemmsg set username=?,msg=?,isreaded=?,isOk=?,msgtype=?,comefrom=?", result, function(err, data){
        if (err) {
            console.log('管理员给用户发送消息出错');
        }
        if (data.insertId) {
            res.json({status: 'success'});
        } else {
            res.json({status: 'fail'});
        }
    });
});

// 设置昨日蟋蟀腿增长最多位数奖励的蟋蟀腿数
router.get('/admin/rankpay', filter.authorize, function(req,res){
    render.req=req;
    render.res=res;
    render.view='rankpay';
    currentQueue=new Queue("rankpay");
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='rankpay'",bindData,rankpayLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});
    currentQueue.start();
});
function rankpayLogic(data){
    return data[0];
}

router.post('/admin/saveRankpay',function(req,res){
    var paynum=req.body.paynum;
    DB.update("delete from config where system='rankpay'",function(){
        var sql="insert into config set notice=? ,system=?";
        DB.execute(sql,[paynum,'rankpay']);
        res.redirect('/admin/rankpay');
    });
});

// 发送奖励
router.post('/admin/sendrankpay',function(req,res){
    // 奖励后台设置数量的蟋蟀腿
    DB.exec('select receiver, sum(xishuaitui) as total from xishuaituideal where date(created_at)=date_sub(curdate(),interval 1 day) group by receiver order by total desc limit 100', function(err, result) {
        if (err)
            console.log(err);
        
        if (result.length > 0) {
            DB.exec("select notice from config where system='rankpay'", [], function(error, resu) {
                if (error)
                    console.log(error);

                var paynum = (resu && resu[0]['notice']) ? resu[0]['notice'] : 0;

                var usernames = [];
                for (var i = 0; i < result.length; i++) {
                    usernames.push('"' + result[i]['receiver'] + '"');
                }

                DB.update("update users set xishuaitui=xishuaitui+"+paynum+" where username in ("+usernames.join(',')+")",function(){
                    res.json({status: 'success'});
                });
            });
        } else {
            res.json({status: 'fail'});
        }
    });
    
});


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
