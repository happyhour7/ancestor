var express = require('express');
var DB=require("../db/connect");
var router = express.Router();
var viewPath='actions/admin/';
/* GET home page. */
router.post('/login', function(req, res) {
    render.res=res;
    render.view='main';
    DB.query("select * from admin where userid='"+req.body.userid+"' and password='"+req.body.password+"'",render,loginLogic);
});

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



router.get('/login2', function(req, res) {
  render(res,'main',{});
});

function render(fields,logic){
    var result=logic(this);
    if(result!==false)
    {
        render.res.render(viewPath+render.view, result);
    }
    
}
module.exports = router;