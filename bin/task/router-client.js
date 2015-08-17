var express = require('express');
var DB=require("../db/connect");
var session = require('express-session');
var router = express.Router();
var fake_datas=require('./fake-data');
var viewPath='actions/secret/';
var formidable = require("formidable");
var fs = require("fs");
var sqlCode=require("./sql");
var Queue=require("../queue");
var fake_mine_datas=[];
var fake_ta_datas=[];
var fake_sell_datas=[];
var fake_offser_datas=[];
var write=require("./toFile");
var homeSQL=sqlCode.homeSQL;
var loginHomeSQL=sqlCode.loginHomeSQL;

var longStoreSQL=sqlCode.longStoreSQL;
var loginLongStoreSQL=sqlCode.loginLongStoreSQL;





function getHomeSQL(){
    var otherWhere=arguments[0]||"";
    if(currentSession){
        return loginHomeSQL.replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<where>",otherWhere);
    }
    else{
        var tmp=homeSQL.replace("<where>",otherWhere);
        console.log(tmp);
        return tmp;
    }
}

/*返回给客户端的数据*/
var returnData={};
var currentQueue=null;
/* GET home page. */
router.get('/', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(),bindData,indexLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
    }});
    currentQueue.start();
});
function bindData(keyname,logic){
    var data=logic(this);
    if(currentQueue.next()){
        currentQueue.exec(data);
    }
}
function indexLogic(data){
    var result={};
        if(data.length>0)
        {
            for(var i=0;i<data.length;i++)
            {
                if(currentSession)
                {
                    if(data[i].owner==currentSession.username)
                    {
                        data[i]["mine"]=true;
                    }
                }
            }
        }
       result['newest_choosen']=true;
       result['secretDatas']=data;
       return result; 
}


router.get('/secret/longstore',function(req,res){
    render.res=res;
    render.req=req;
    render.view="index";
    if(currentSession==null)
    {
        
        DB.query(longStoreSQL,render,longsStoryLogic);
    }
    else
    {
        DB.query(loginLongStoreSQL.replace("<username>",currentSession.username)
            .replace("<username>",currentSession.username)
            .replace("<username>",currentSession.username)
            ,render,longsStoryLogic);
    }
});

function longsStoryLogic(data){
    data["longstore_choosen"]=true;
    data["secretDatas"]=data;
    return data;
}


//我的秘密
router.get('/secret/mine', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("mine");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and secretMainType='WO的秘密' "),bindData,woLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
    }});
    currentQueue.start();
});
function woLogic(data){
    var result={};
        if(data.length>0)
        {
            for(var i=0;i<data.length;i++)
            {
                if(currentSession)
                {
                    if(data[i].owner==currentSession.username)
                    {
                        data[i]["mine"]=true;
                    }
                }
            }
        }
       result['wo_choosen']=true;
       result['secretDatas']=data;
       return result; 
}
var orderSQL="";
//我的秘密
router.get('/secret/order', function(req, res) {
    render.res=res;
    render.req=req;
    render.view='order';
    DB.query(orderSQL,render,function(){return {};});
    //res.render(viewPath+'index',{'wo_choosen':true,'secretDatas':fake_mine_datas});
    
});



//我的秘密
router.get('/secret/write', function(req, res) {
    render.res=res;
    render.req=req;
    render.view='sendSecret';
    DB.query('',render,orderLogic);
});


//我的秘密
router.post('/secret/orderdealsave', function(req, res) {
    render.res=res;
    render.req=req;
    render.view='order';
    if(currentSession==null)
    {
        render.view="index";
        DB.query(getHomeSQL(),render,indexLogic);
        return false;
    }
    else
    {
        var splitString="";
        splitString=req.body.secretMainType+","+
                req.body.secretType+","+
                req.body.secretSubType+","+
                (req.body.secretGrandSubType||"")+","+

                (req.body.secretCity||"")+","+

                (req.body.secretSex||"")+","+
                (req.body.secretAge||"");
        var results=splitString.split(",");
        results.push(currentSession.username);
        DB.update("delete from orderdeal where owner='"+currentSession.username+"'",function(){
            DB.execute("insert into orderdeal set maintype=?,type=?,subtype=?,grandsubtype=?,"+
                "cityname=?,sex=?,age=?,owner=?",results);

            DB.query(orderSQL,render,orderLogic);

        });
    }
    
});
function orderLogic(data){
    return data;
}
function sendSecretLogic(data){
    return data;
}

router.post('/secret/replaysave',function(req,res){
    render.req=req;
    render.res=res;
    var sql="insert into replay set replayer=?,content=?,fileid=?,replayTime=?";
    var result=[];
    result.push(currentSession.username);
    result.push(req.body.content);
    result.push(parseInt(req.body.filedid));
    result.push(req.body.replayTime)
    DB.execute(sql,result);
    DB.query(getHomeSQL(),render,indexLogic);
});

//他的秘密
router.get('/secret/ta', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=null;
    
    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){

        DB.query(getHomeSQL(" and secretMainType='TA的秘密' "),bindData,taLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});

    currentQueue.start();
});


function taLogic(data){
    var result={};
        if(data.length>0)
        {
            for(var i=0;i<data.length;i++)
            {
                if(currentSession)
                {
                    if(data[i].owner==currentSession.username)
                    {
                        data[i]["mine"]=true;
                    }
                }
            }
        }
       result['ta_choosen']=true;
       result['secretDatas']=data;
       return result; 
}


//出售秘密
router.get('/secret/sell', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("sell");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and secretMainType='出售秘密' "),bindData,sellLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});
    currentQueue.start();
    console.log(currentQueue._datas);
});

function sellLogic(data){
    var result={};
        if(data.length>0)
        {
            for(var i=0;i<data.length;i++)
            {
                if(currentSession)
                {
                    if(data[i].owner==currentSession.username)
                    {
                        data[i]["mine"]=true;
                    }
                }
            }
        }
       result['sell_choosen']=true;
       result['secretDatas']=data;
       write("myjson.txt",result);
       return result; 
}
//秘密悬赏
router.get('/secret/offer', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("offer");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and secretMainType='悬赏秘密' "),bindData,offerLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});
    currentQueue.start();
    console.log(currentQueue._datas);
});

function offerLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            if(currentSession)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
            }
        }
    }
   result['offer_choosen']=true;
   result['secretDatas']=data;
   write("myjson.txt",data);
   return result; 
}



router.post('/secret/saveSecret',function(req, res){
    var datas=[];
    var splitString="";
    splitString=req.body.secretMainType+","+
                req.body.secretType+","+
                req.body.secretSubType+","+
                (req.body.secretGrandSubType||"")+","+
                (req.body.secretLimit||1)+","+
                (req.body.secretHope||"")+","+
                (req.body.secretCity||"")+","+
                (req.body.secretDate||"")+","+
                (req.body.secretKeyWord||"")+","+
                (req.body.secretTitle||"")+","+
                (req.body.secretBackground||"")+","+
                (req.body.secretContent||"")+","+
                (req.body.secretKnown||"")+","+
                (req.body.othername||"")+","+
                (req.body.othersex||"")+","+
                (req.body.otherage||"")+","+
                (req.body.otherBuildName||"")+","+
                (req.body.otheraddress||"")+","+
                (req.body.secretPrice||"")+","+
                (req.body.secretLimitTime||"")+","+
                (req.body.islongstory||0)+","+
                (req.body.longstory||"");
    datas=splitString.split(',');
    datas[4]=getInt(datas[4]);
    datas[14]=getInt(datas[14]);
    datas[18]=getInt(datas[18]);
    if(currentSession!==null)
    {
        datas.push(currentSession.username);
    
    
    //console.log(datas);
    var sql="insert into files set secretMainType=?,secretType=?,secretSubType=?,secretGrandSubType=?,secretLimit=?,"+
            "secretHope=?,secretCity=?,secretDate=?,secretKeyWord=?,secretTitle=?,secretBackground=?,"+
            "secretContent=?,secretKnown=?,othername=?,othersex=?,otherage=?,otherBuildName=?,otheraddress=?,"+
            "secretPrice=?,secretLimitTime=?,islongstory=?,longstory=?,owner=?";
    DB.execute(sql,datas);
    render.req=req;
    render.res=res;
    render.view="index";
    DB.query(getHomeSQL()
            ,render,indexLogic);
    }
        else
    {
        render.req=req;
        render.res=res;
        render.view="index";
        DB.query(getHomeSQL(),render,indexLogic);
        return false;
    }
});



function gotoHome(){
    DB.query(getHomeSQL(),render,indexLogic);
}




router.get('/secret/permsg-score',function(req,res){
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;
        
        render.view="personal_score";
        render.apply([user],['',personalScoreLogic]);
        //var sql="select * from users where username='"+username+"'";
        //DB.query(sql,render,personalLogic);
    }
    else
    {
        render.view="index";
        DB.query("",render,indexLogic);
    }
});

function personalScoreLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_score"]=true;
        return result;
    }
    else
    {
        return false;
    }

}

router.get('/secret/permsg-friend',function(req,res){
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;
        
        render.view="personal_friend";
        render.apply([user],['',personalFriendLogic]);
        //var sql="select * from users where username='"+username+"'";
        //DB.query(sql,render,personalLogic);
    }
    else
    {
        render.view="index";
        DB.query("",render,indexLogic);
    }
});

function personalFriendLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_friend"]=true;
        return result;
    }
    else
    {
        return false;
    }
}
router.get('/secret/permsg-mysecret',function(req,res){
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {

        var username=currentSession.username;
        var user=currentSession.user;
        render.view="personal_mysecret";
        
        render.apply([user],['',personalSecretLogic]);
        //var sql="select * from users where username='"+username+"'";
        //DB.query(sql,render,personalLogic);
    }
    else
    {
        render.view="index";
        DB.query("",render,indexLogic);
    }
});
function personalSecretLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_mysecret"]=true;
        return result;
    }
    else
    {
        return false;
    }
}

router.get('/secret/permsg-msg',function(req,res){
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;
        render.view="personal_msg";
        render.apply([user],['',personalMsgLogic]);
    }
    else
    {
        render.view="index";
        DB.query("",render,indexLogic);
    }
});

function personalMsgLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_msg_msg"]=true;
        return result;
    }
    else
    {
        return false;
    }
    
}




router.post('/secret/uploadImage',function(req, res){
    var form = new formidable.IncomingForm(); //创建上传表单
    form.encoding = "utf-8"; //设置编辑
    form.uploadDir = "public/avatar/"; //设置上传目录
    form.keepExtensions = true; //保留后缀
    form.maxFieldsSize = 2 * 1024 * 1024; //文件大小
    var uploadName="";
    form.parse(req, function(err, fields, files) {

        if (err) {
          res.locals.error = err;
          res.render(index, { title: TITLE });
          return; 
        } 
       
        var extName = ''; //后缀名
        switch (files.fulAvatar.type) {
            case "image/pjpeg":
                extName = "jpg";
                break;
            case "image/jpeg":
                extName = "jpg";
                break; 
            case "image/png":
                extName = "png";
                break;
            case "image/x-png":
                extName = "png";
                break; 
        }

        if(extName.length == 0){
              res.locals.error = "只支持png和jpg格式图片";
              res.render(index, { title: TITLE });
              return; 
        }

        var avatarName =  Math.random() + '.' + extName;
        DB.update("update users set userPhoto='"+avatarName+"' where username='"+currentSession.username+"'",function(){});
        currentSession.user.userPhoto=avatarName;
        var newPath = form.uploadDir + avatarName;
        fs.renameSync(files.fulAvatar.path, newPath); //重命名
    });
    
    res.locals.success = '上传成功';
    res.json({title:'上传成功！' }); 
});














//漂流瓶
router.get('/secret/floater', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="sendFloater";
    currentQueue=new Queue("sell");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and secretMainType='出售秘密' "),bindData,floaterInitLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        currentQueue.end();
        currentQueue=null;
    }});
    currentQueue.start();
    console.log(currentQueue._datas);




    
});

function floaterInitLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            data[i]["secretTitle"]="漂流瓶";
            data[i]["secretMainType"]="漂流瓶";
            if(currentSession)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
            }
        }
    }
   result['floater_choosen']=true;
   result['secretDatas']=data;
   write("myjson.txt",data);
   return result; 
}




var currentSession=null;
router.post("/client/login",function(req,res){
	render.res=res;
	currentSession=req.session;
    render.view='mysecret';
    var sql="select * from users where username='"+req.body.username+"' and password='"+req.body.password+"'";
    DB.query(sql,render,loginLogic);
});


router.get('/secret/permsg',function(req,res){
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;
        render.view="personal";
        render.apply([user],['',personalLogic]);
    }
    else
    {
        render.view="index";
        DB.query("",render,indexLogic);
    }
    
    
});

router.post('/secret/personalUpdate',function(req,res){
    var _pwd=req.body.password||"";
    var insertPassword="";
    if(_pwd!=="")
    {
        insertPassword=" password='"+_pwd+"',";
    }
    DB.update("update users set "
                +insertPassword
                +" sex="+req.body.sex+","
                +" email='"+req.body.email+"',"
                +" qq='"+req.body.qq+"',"
                +" phone='"+req.body.phone+"',"
                +" address='"+req.body.address+"',"
                +" mark='"+req.body.mark+"'"
                +" where username='"+currentSession.username+"'",
        function(){});

    var username=currentSession.username;
    var user=currentSession.user;
    user.sex=parseInt(req.body.sex);
    user.email=req.body.email;
    user.qq=req.body.qq;
    user.phone=req.body.phone;
    user.address=req.body.address;
    user.mark=req.body.mark;
    if(_pwd!="")
    {
        user.password=req.body.password;
    }
    currentSession.user=user;
    res.json({title:"更新成功！"});
});
router.get('/secret/getAllComments',function(req,res){
    var id=req.query.id;

    DB.query("select * from replay where fileid="+id,
        function(fields,logic){
            var data=logic(this);
            if(data.length==0)
            {
                res.json({});
            }
            else
            {
                res.json({replays:data});
            }
            
        },
        function(data){
            return data;
        });
});
router.get('/secret/setScore',function(req,res){
    var id=req.query.id;
    var score=req.query.score;
    DB.update('delete from score where username="'+currentSession.username+'" and fileid='+id,function(){
        var sql="insert into score set username=?,fileid=?,score=?";
        var results=[currentSession.username];
        results.push(id);
        results.push(score);
        DB.execute(sql,results);
        res.json({status:"success"});
    });
});
function getInt(obj){
    if(isNaN(parseInt(obj)))
    {
        return 0;
    }
    else
    {
        return parseInt(obj);
    }
}

function personalLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_msg"]=true;
        return result;
    }
    else
    {
        //render.res.render({error:"用户名或密码错误，请重新登录"});
        DB.query("",render,indexLogic);
        return false;
    }
}

function loginLogic(data){
    if(data.length>0)
    {
    	currentSession.username=data[0].username;
        currentSession.user=data[0];
        if(data[0].sex==1)
        {
            data[0].man=true;
        }
        else
        {
            data[0].woman=true;
        }
        render.res.json(data[0]);
    }
    else
    {
        render.res.json({error:"用户名或密码错误，请重新登录"});
    }
    return false;
}

router.get('/secret/func',function(req,res){
    var type=req.query.type;
    var deal=req.query.deal;
    var id=req.query.fileid;
    console.log("操作数为："+deal);
    var result=[currentSession.username];
    var tablename="isbad";
    if(type=="good")
    {
        tablename="isgood";
        
    }
    result.push(1);
        result.push(parseInt(id));
    var sql="insert into "+tablename+" set username=?, "+type+"=? , fileid=?";
    console.log(sql);
    DB.update("delete from "+tablename+" where username='"+currentSession.username+"' and fileid="+id,function(){
        if(deal=="add")
        {
            console.log(result);
            DB.execute(sql,result);
        }
        res.json({status:"success"});
    });
});

router.get('/login2', function(req, res) {
  render(res,'main',{});
});

function render(fields,logic){

    var result;
    if(logic)
    {
        result=logic(this);
    }
    else
    {
        result=this;
    }
    
    var hasLogin=false;
    if(result!==false)
    {
    	hasLogin=getUserLoginStatues(render.req.session);
    	result["hasLogin"]=hasLogin;
        render.res.render(viewPath+render.view, result);
    }
    
}

function getUserLoginStatues(session){
	if(session&&session.username)
	{
		return session.username;
	}
	return false;
}




function clone(obj){  
    function Clone(){}  
    Clone.prototype = obj;  
    var o = new Clone();  
    for(var a in o){  
        if(typeof o[a] == "object") {  
            o[a] = clone3(o[a]);  
        }  
    }  
    return o;  
} 




module.exports = router;