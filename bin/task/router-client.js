var express = require('express');
var DB=require("../db/connect");
var session = require('express-session');
var router = express.Router();
var viewPath='actions/secret/';
/* GET home page. */
router.get('/', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    DB.query("",render,indexLogic);
});

function indexLogic(data){
       data['newest_choosen']=true;
       return data; 
}
//我的秘密
router.get('/secret/mine', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'mysecret.html',{'wo_choosen':true});
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
    res.render(viewPath+'mysecret.html',{'ta_choosen':true});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});


//出售秘密
router.get('/secret/sell', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'mysecret.html',{'sell_choosen':true});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});


//秘密悬赏
router.get('/secret/offer', function(req, res) {
    render.res=res;
    render.view='mysecret';
    res.render(viewPath+'mysecret.html',{'offer_choosen':true});
    //DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});



//漂流瓶
router.get('/secret/floater', function(req, res) {
    render.res=res;
    render.view='sendFloater';
    res.render(viewPath+'mysecret.html',{'floater_choosen':true});
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