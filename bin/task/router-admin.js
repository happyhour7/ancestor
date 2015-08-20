var express = require('express');
var DB=require("../db/connect");
var router = express.Router();
var viewPath='actions/admin/';
var Queue=require("../queue");
/* GET home page. */
router.post('/admin/login', function(req, res) {
    render.res=res;
    render.view='index';
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
        render.res.render(viewPath+"index",{error:"用户名或密码错误，请重新登录"});
    }
}
router.get('/admin/systemNotice',function(req,res){
    res.render(viewPath+'systemNotice',{});
})

router.get('/admin/advUserManager',function(req, res){
    res.render(viewPath+"advUserManager",{});
});

router.get('/admin/adminUserManager',function(req, res){
    res.render(viewPath+"adminUserManager",{});
});

router.get('/admin/userManager',function(req, res){
    res.render(viewPath+"userManager",{});
});

router.get('/admin/surveyManager',function(req, res){
    res.render(viewPath+"surveyManager",{});
});

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
    result.push(req.body.location.join(","));
    console.log(req.body.location.join(","));
    DB.execute(sql,result);
    res.json({status:"success"});
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