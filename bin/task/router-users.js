var express = require('express');
var DB=require("../db/connect");
var session = require('express-session');
var router = express.Router();
var fake_datas=require('./fake-data');
var viewPath='actions/secret/';
var Queue=require("../queue");
var currentQueue=null;

var fake_mine_datas=[];
var fake_ta_datas=[];
var fake_sell_datas=[];
var fake_offser_datas=[];

//DB.test();


/* GET home page. */
router.get('/', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    DB.query("",render,indexLogic);
});


router.get('/user/hasRegistried',function(req,res){
    var username=req.query.username;

    currentQueue=new Queue("index");
    currentQueue.push({exec:function(){
        DB.query("select * from users where username='"+username+"'",bindData,registriedLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        if(data[0].error===true)
        {
            res.json({
                status:"hasRegistried"
            });
        }
        else
        {
            res.json({
                status:"OK"
            });
        }
        
        currentQueue.end();
    }});
    currentQueue.start();
});

function registriedLogic(data){
    var result={};
    if(data.length>0)
    {
        result.error=true;
    }
    else
    {
         result.error=false;
    }
    return result;
}



function bindData(keyname,logic){
    var data=logic(this);
    if(currentQueue.next()){
        currentQueue.exec(data);
    }
}


router.post('/user/registry', function(req, res) {
    var datas=[];
    var sql="insert into users set username=?,password=?,sex=?,age=?,usertype=?,score=?,email=?,cityname=?,qq=?,phone=?";
    datas.push(req.body.username);
    datas.push(req.body.password);
    datas.push(parseInt(req.body.sex));
    datas.push(parseInt(req.body.age));
    datas.push(1);
    datas.push(10);
    datas.push(req.body.email);
    datas.push(req.body.cityname);
    datas.push(req.body.qq);
    datas.push(req.body.phone);
    console.log(datas);
    DB.execute(sql,datas);
    console.log(viewPath+"index");
    res.json({status:"success"});
    //res.render(viewPath+"index",{newest_choosen:true});
});



module.exports = router;