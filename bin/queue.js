var express = require('express');

var router = express.Router();

function Queue(_name){
	this.name=_name;
	this._datas=[];
	this.length=0;
	this._currentIndex=0;
}
Queue.prototype={
	currentItem:null,
	push:function(obj){
		this.length++;
		this._datas.push(obj);
		//console.log(this._datas.length);
	},
	next:function(){
		if(this._currentIndex<=this.length-1)
		{
			this._currentIndex++;
			this.currentItem=this._datas[this._currentIndex];
			return true;
		}
		else
		{
			return false;
		}
		
	},
	exec:function(){
		var arg=arguments;
		if(this.currentItem)
		{
			this.currentItem.exec(arg);
		}
	},
	start:function(){
		this.currentItem=this._datas[0];
		if(this.currentItem)
		{
			this.currentItem.exec();
		}
	},
	end:function(){
		this.currentItem=null;
		this.length=0;
		this._datas=[];
		console.log("清空队列");
	}
}
console.log(new Queue());
module.exports=Queue;