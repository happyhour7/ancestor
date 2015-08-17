var express = require('express');
var DB=require("../db/connect");
var router = express.Router();
var viewPath='actions/adv/';
var Queue=require("../queue");
var fs=require("fs");
var formidable = require("formidable");
/* GET home page. */
var currentSession=null;
router.post('/adv/login', function(req, res) {
    render.res=res;
    render.req=req;
    currentSession=req.session;
    currentSession.username=req.body.userid;
    render.view='index';
    DB.query("select * from advuser where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
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
        return false;
    }
}


router.get('/adv/advUserManager',function(req, res){
    res.render(viewPath+"advUserManager",{});
});

router.get('/adv/adminUserManager',function(req, res){
    res.render(viewPath+"adminUserManager",{});
});

router.get('/adv/userManager',function(req, res){
    res.render(viewPath+"userManager",{});
});

router.get('/adv/surveyManager',function(req, res){
    res.render(viewPath+"surveyManager",{});
});

router.get('/adv/index', function(req, res) {
    res.render(viewPath+"index",{});
});
console.log("注册广告用户登录");
router.get('/adv/login', function(req, res) {
    res.render(viewPath+"login",{});
});


router.post('/adv/addAdvUser',function(req, res){
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
router.post('/adv/save',function(req,res){
    
});

router.post('/adv/saveImage',function(req, res){
    var form = new formidable.IncomingForm(); //创建上传表单
    form.encoding = "utf-8"; //设置编辑
    form.uploadDir = "public/avatar/"; //设置上传目录
    form.keepExtensions = true; //保留后缀
    form.maxFieldsSize = 2 * 1024 * 1024; //文件大小
    var uploadName="";

    form.parse(req, function(err, fields, files) {
        var location=req.body.location;
        var href=req.body.href;
        if (err) {
          res.locals.error = err;
            console.log("出错了！");
          res.json({title:'出错了'});
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
              console.log("出错了的发的发的发的发的！");
              res.json({title:'只支持png和jpg格式图片'});
              return; 
        }
        
        var avatarName =  Math.random() + '.' + extName;
        var results=[currentSession.username];
        results.push(location);
        results.push(avatarName);
        results.push(href);

        //DB.update("update users set userPhoto='"+avatarName+"' where username='"+currentSession.username+"'",function(){});
        console.log("delete from advs where owner='"+currentSession.username+"' and location='"+location+"'");
        DB.update("delete from advs where owner='"+currentSession.username+"' and location='"+location+"'",function(){
            //console.log("执行到此");
            DB.execute("insert into advs set owner=?,location=?,images=?,href",results);
        });
        var newPath = form.uploadDir + avatarName;
        fs.renameSync(files.fulAvatar.path, newPath); //重命名
    });
    
    //res.locals.success = '上传成功';
    res.json({title:'上传成功！' }); 
});













































router.get('/adv/getAdvUser',function(req, res){
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