var express = require('express');
var path = require('path');
var hbs = require('hbs');
global.cache={};
module.exports=function(key,value){
	if(arguments.length==0)
	{
		global.cache[key]=value;
	}
	else{
		return global.cache[key];
	}
}
