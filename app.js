var express = require('express');
var path = require('path');
var hbs = require('hbs');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var init=require('developerjs');

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



app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: false }));

app.use(cookieParser());

app.use(pjax());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'admin')));

app.use(init.ReadConFigFile());

init.init(app);




app.listen(3000);
console.log('web服务已经在3000端口启动，请访问：http://localhost:3000');

module.exports = app;
