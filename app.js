var express = require('express');
var path = require('path');
var hbs = require('hbs');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
//var init=require('developerjs');
var session = require('express-session');

var task=require("./bin/task/router-admin");
var task_client=require("./bin/task/router-client");
var task_user=require("./bin/task/router-users");
var task_adv=require("./bin/task/router-adv");
var pjax = require('express-pjax');
//var partial=require('express-partials');
var app = express();
app.hbs=hbs;
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.engine('html', hbs.__express);
app.set('view engine', 'html');

// uncomment after placing your favicon in /public
hbs.registerPartials(__dirname + '/views/partials');
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use((function(){
	return function(req,res,next){
		hbs.registerPartials(__dirname + '/views/partials');
		next();
	}
})());


app.use(session({
  resave:false,
  saveUninitialized:false,
  secret: 'keyboard cat'
}));
app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: false }));

app.use(cookieParser());

app.use(pjax());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'admin')));

//app.use(init.ReadConFigFile());

app.use('/',task);
app.use('/',task_client);
app.use('/',task_user);
app.use('/',task_adv);

require("./bin/task/helper");


//init.init(app);
//task();

//注册ancestor路由


app.listen(80);
console.log('web服务已经在80端口');

module.exports = app;
