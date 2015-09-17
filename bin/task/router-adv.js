var express = require('express');
var DB=require("../db/connect");
var router = express.Router();
var viewPath='actions/adv/';
var Queue=require("../queue");
var fs=require("fs");
var cache=require("../cache");
var formidable = require("formidable");
/* GET home page. */
var currentSession={};
router.post('/adv/login', function(req, res) {
    render.res=res;
    render.req=req;
    // render.view='index';

    currentQueue=new Queue("login");
    currentQueue.push({exec:function(){
        DB.query("select * from advuser where userid='"+req.body.userid+"' and password='"+req.body.password+"'",bindData,loginLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        if(data[0]['error']){
            render.view="login";
            render.apply(data[0],['',function(_data){return _data;}]);
        }else{
            res.cookie["username"]=req.body.userid;

            res.redirect('/adv/index');
        }
        
        currentQueue.end();
    }});
    currentQueue.start();
});
var currentQueue=null;
function advuserLogic(data){
    
    var result={};
    for(var i=0;i<data.length;i++)
    {
        var tmp=data[i];
        if(tmp.location=="firstpage-top"&&
            render.res.cookie["location"].indexOf("firstpage-top")>=0)
        {
            result["firstpageTop"]=tmp;
             result["firstpageTop"]["replay"]=global.cache["firstpage-top"];
        }
        else if(render.res.cookie["location"].indexOf("firstpage-top")>=0&&
            typeof result["firstpageTop"]=='undefined'){
            result["firstpageTop"]=true;
        }

        if(tmp.location=="firstpage-left-top"&&
            render.res.cookie["location"].indexOf("firstpage-left-top")>=0){
            result["firstpageLeftTop"]=tmp;
            result["firstpageLeftTop"]["replay"]=global.cache["firstpage-left-top"];
        }else if(render.res.cookie["location"].indexOf("firstpage-left-top")>=0&&
            typeof result["firstpageLeftTop"]=='undefined'){
            result["firstpageLeftTop"]=true;
        }

        if(tmp.location=="firstpage-left-mid"&&
            render.res.cookie["location"].indexOf("firstpage-left-mid")>=0){
            result["firstpageLeftMid"]=tmp;
            result["firstpageLeftMid"]["replay"]=global.cache["firstpage-left-mid"];
        }else if(render.res.cookie["location"].indexOf("firstpage-left-mid")>=0&&
            typeof result["firstpageLeftMid"]=='undefined'){
            result["firstpageLeftMid"]=true;
        }

        if(tmp.location=="firstpage-left-bottom"&&
            render.res.cookie["location"].indexOf("firstpage-left-bottom")>=0){
            result["firstpageLeftBottom"]=tmp;
            result["firstpageLeftBottom"]["replay"]=global.cache["firstpage-left-bottom"];
        }
        else if(render.res.cookie["location"].indexOf("firstpage-left-bottom")>=0&&
            typeof result["firstpageLeftBottom"]=='undefined'){
            result["firstpageLeftBottom"]=true;
        }

        if(tmp.location=="innerpage-left-top"&&
            render.res.cookie["location"].indexOf("innerpage-left-top")>=0){
            result["innerpageLeftTop"]=tmp;
            result["innerpageLeftTop"]["replay"]=global.cache["innerpage-left-top"];
        }else if(render.res.cookie["location"].indexOf("innerpage-left-top")>=0&&
            typeof result["innerpageLeftTop"]=='undefined'){
            result["innerpageLeftTop"]=true;
        }


        if(tmp.location=="innerpage-left-bottom"&&
            render.res.cookie["location"].indexOf("innerpage-left-bottom")>=0){
            result["innerpageLeftBottom"]=tmp;
            result["innerpageLeftBottom"]["replay"]=global.cache["innerpage-left-bottom"];
        }else if(render.res.cookie["location"].indexOf("innerpage-left-bottom")>=0&&
            typeof result["innerpageLeftBottom"]=='undefined'){
            result["innerpageLeftBottom"]=true;
        }
    }
    //result["advDatas"]=data;
    
    //console.log(result);
    result["username"]=render.res.cookie["username"];
    console.log(result);
    return result;
}
function loginLogic(data){
    if(data.length>0)
    {
        render.res.cookie["location"]=data[0].location;
        return data[0];
    }
    else
    {
        return {error:"用户名或密码错误，请重新登录"};
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
    render.res=res;
    render.req=req;
    render.view='index';

    currentQueue=new Queue("index");

    currentQueue.push({exec:function(data){
        DB.query("select * from advs where owner='"+res.cookie["username"]+"'",bindData,advuserLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(_data){return _data;}]);
        currentQueue = null;
    }});
    currentQueue.start();
});

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
    var imgPath=res.cookie["advImage"];
    var href=req.body.href;
    var location=req.body.location;
    var results=[res.cookie["username"]];
        results.push(location);
        results.push(imgPath);
        results.push(href);
        console.dir(results);
    DB.update("delete from advs where owner='"+res.cookie["username"]+"' and location='"+location+"'",function(){
        DB.execute("insert into advs set owner=?,location=?,images=?,href=?",results);
    });
    res.redirect('/adv/index');
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
              res.json({title:'只支持png和jpg格式图片'});
              return; 
        }
        
        var avatarName =  Math.random() + '.' + extName;

        var newPath = form.uploadDir + avatarName;
        //currentSession.advImage=avatarName;
        res.cookie["advImage"]=avatarName;
        fs.renameSync(files.fulAvatar.path, newPath); //重命名
    });
    

    res.json({title:'上传成功！' }); 
});

router.get('/adv/sendComment',function(req,res){
	var userid=req.query.userid;
	var comment=req.query.comment;
	var date=req.query.date;
	var location=req.query.location;
	var result=global.cache[location];
	if(result)
	{
		result.push({
				userid:userid,
				comment:comment,
				date:date,
				location:location
		});
		global.cache[location]=result;
	}
	else{
		result=[{
				userid:userid,
				comment:comment,
				date:date,
				location:location
		}];
		global.cache[location]=result;
		
	}
	console.log(global.cache);
	res.json({status:"success"});
});


router.get('/adv/setScore',function(req,res){
	var userid=req.query.userid;
	var score=req.query.score;
	var location=req.query.location;
	if(!global.cache["adv"])
	{
		global.cache["adv"]={};
	}
	if(!global.cache["adv"][userid])
	{
		global.cache["adv"][userid]={};
	}
	global.cache["adv"][userid][location]=score;
	res.json({status:"success"});
	
})








































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
    var result;
    if(logic)
    {
        result=logic(this);
    }
    else
    {
        result=this;
    }

    if(result!==false)
    {
        render.res.render(viewPath+render.view, result);
    }
    
}
module.exports = router;