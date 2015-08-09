var express = require('express');
var DB=require("../db/connect");
var session = require('express-session');
var router = express.Router();
var fake_datas=require('./fake-data');
var viewPath='actions/secret/';
var formidable = require("formidable");
var fs = require("fs");


var fake_mine_datas=[];
var fake_ta_datas=[];
var fake_sell_datas=[];
var fake_offser_datas=[];

DB.test();
for(var i=0;i<fake_datas.length;i++)
{
    var tmp=fake_datas[i];
    if(tmp.secretType=="我的秘密")
    {
        fake_mine_datas.push(tmp);
    }
    else if(tmp.secretType=="TA的秘密")
    {
        fake_ta_datas.push(tmp);
    }
    else if(tmp.secretType=="出售秘密")
    {
        fake_sell_datas.push(tmp);
    }
    else if(tmp.secretType=="秘密悬赏")
    {
        fake_offser_datas.push(tmp);
    }
}


/* GET home page. */
router.get('/', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    DB.query("select * from files",render,indexLogic);
});

function indexLogic(data){
       data['newest_choosen']=true;
       data['secretDatas']=data;
       return data; 
}
//我的秘密
router.get('/secret/mine', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'index',{'wo_choosen':true,'secretDatas':fake_mine_datas});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});

//我的秘密
router.get('/secret/write', function(req, res) {
    render.res=res;
    render.req=req;
    render.view='sendSecret';
    DB.query("",render,sendSecretLogic);
});

function sendSecretLogic(data){
    return data;
}



//他的秘密
router.get('/secret/ta', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'index',{'ta_choosen':true,'secretDatas':fake_ta_datas});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});


//出售秘密
router.get('/secret/sell', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'index',{'sell_choosen':true,'secretDatas':fake_sell_datas});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});


//秘密悬赏
router.get('/secret/offer', function(req, res) {
    render.res=res;
    render.req=req;
    render.view='index';
    //res.render(viewPath+'index',{'offer_choosen':true,'secretDatas':fake_offser_datas});
    DB.query("select * from files",render,offerLogic);
});

function offerLogic(data){
    data['offer_choosen']=true;
    data['secretDatas']=data;
    return data;
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
                (req.body.secretLimitTime||"");
    datas=splitString.split(',');
    datas[4]=getInt(datas[4]);
    datas[14]=getInt(datas[14]);
    datas[18]=getInt(datas[18]);
    if(currentSession!==null)
    {
        datas.push(currentSession.username);
    }
    else
    {
        gotoHome();
        return;
    }
    
    //console.log(datas);
    var sql="insert into files set secretMainType=?,secretType=?,secretSubType=?,secretGrandSubType=?,secretLimit=?,"+
            "secretHope=?,secretCity=?,secretDate=?,secretKeyWord=?,secretTitle=?,secretBackground=?,"+
            "secretContent=?,secretKnown=?,othername=?,othersex=?,otherage=?,otherBuildName=?,otheraddress=?,"+
            "secretPrice=?,owner=?";
    DB.execute(sql,datas);
    res.render(viewPath+'index',{newest_choosen:true});
});



function gotoHome(){
    DB.query("select * from files",render,indexLogic);
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
    render.view='sendFloater';
    res.render(viewPath+'sendFloater',{'floater_choosen':true});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});

//定制
router.get('/secret/order', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'mysecret',{'order_choosen':true});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});

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



router.get('/login2', function(req, res) {
  render(res,'main',{});
});

function render(fields,logic){
    var result=logic(this);
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