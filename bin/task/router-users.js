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

//DB.test();


/* GET home page. */
router.get('/', function(req, res) {
    render.res=res;
    render.req=req;
    render.view="index";
    DB.query("",render,indexLogic);
});

router.post('/user/registry', function(req, res) {
    var datas=[];
    var sql="insert into users set username=?,password=?,sex=?,usertype=?,score=?,email=?,cityname=?,qq=?,phone=?";
    datas.push(req.body.username);
    datas.push(req.body.password);
    datas.push(parseInt(req.body.sex));
    datas.push(1);
    datas.push(10);
    datas.push(req.body.email);
    datas.push(req.body.cityname);
    datas.push(req.body.qq);
    datas.push(req.body.phone);
    console.log(datas);
    DB.execute(sql,datas);
    console.log(viewPath+"index");
    res.render(viewPath+"index",{newest_choosen:true});
});



module.exports = router;