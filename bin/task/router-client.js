var express = require('express');
var DB=require("../db/connect");
var session = require('express-session');
var router = express.Router();
var fake_datas=require('./fake-data');
var viewPath='actions/secret/';



var fake_mine_datas=[];
var fake_ta_datas=[];
var fake_sell_datas=[];
var fake_offser_datas=[];


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
    DB.query("",render,indexLogic);
});

function indexLogic(data){
       data['newest_choosen']=true;
       data['secretDatas']=fake_datas;
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
    render.view='sendSecret';
    res.render(viewPath+'sendSecret.html',{});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});





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
    render.view='mysecret';
    res.render(viewPath+'index',{'offer_choosen':true,'secretDatas':fake_offser_datas});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});

router.post('/secret/saveSecret',function(req, res){
    var datas=[];
    datas.push(req.body.secretType);
    datas.push(req.body.secretSubType);
    datas.push(req.body.secretGrandSubType);
    datas.push(req.body.secretLimit);
    datas.push(req.body.secretCity);
    datas.push(req.body.secretKeyWord);
    datas.push(req.body.secretTitle);
    datas.push(req.body.secretDate);
    datas.push(req.body.secretBackground);
    datas.push(req.body.secretKnown);
    datas.push(req.body.secretContent);
    datas.push(req.body.othername);
    datas.push(req.body.othersex);
    datas.push(req.body.otherage);
    datas.push(req.body.otherBuildName);
    datas.push(req.body.otheraddress);
    datas.push(req.body.secretPrice);

    var sql="insert into files set secretType=?,secretSubType=?,secretGrandSubType=?,secretLimit=?,"+
            "secretHope=?,secretCity=?,secretDate=?,secretKeyWord=?,secretTitle=?,secretBackground=?,"+
            "secretContent=?,secretKnown=?,othername=?,othersex=?,otherage=?,otherBuildName=?,otheraddress=?,"+
            "secretPrice=?";
    DB.execute(sql,datas);
    res.render('/',{newest_choosen:true});
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
})
router.get('/secret/permsg',function(req,res){
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        render.view="personal";
        var sql="select * from users where username='"+username+"'";
        DB.query(sql,render,personalLogic);
    }
    else
    {
        render.view="index";
        DB.query("",render,indexLogic);
    }
    
    
});

function personalLogic(data){
    if(data.length>0)
    {
        return data[0];
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
	if(currentSession&&currentSession.username)
	{
		return currentSession.username;
	}
	return false;
}
module.exports = router;