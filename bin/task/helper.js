var express = require('express');
var path = require('path');
var hbs = require('hbs');
hbs.registerHelper('dealUsername', function(text) {
    if(text)
    {
        text=text.substring(0,Math.floor(text.length/2))+"*";
    }
    
    return text;
});
hbs.registerHelper('myscore', function(currentScore,choosenScore) {
  if(choosenScore)
  {
    if((currentScore+'')==(choosenScore+''))
    {
        return "selected='selected'";
    }
  }
    
    
    return "";
});
hbs.registerHelper('scorePrize', function(currentPrize) {
  if(currentPrize)
  {
    if((currentPrize+'')!='0')
    {
        return "<span class='items system-icons money ' style='width:100px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;'>"+currentPrize+"</span>";
    }
  }
    
    
    return "";
});

hbs.registerHelper('secretSex', function(sexId) {
  if(sexId)
  {
    if((sexId+'')=='0')
    {
        return "女";
    }
  }
    return "男";
});

hbs.registerHelper('secretCity', function(type, city) {
  if(city && type == 'TA的秘密')
  {
    return '<span class="items address">对方城市：'+city+'</span>';
  }
  
  return "";
});
hbs.registerHelper('otherSecretSex', function(type, subtype, sexId) {
  if((type == 'WO的秘密') || (type == '出售秘密') || (type == '悬赏秘密' && subtype.indexOf('商家秘密') != -1)) {
      return "";
  }
  
  var message = '性别';
  if(type == 'TA的秘密') {
    message = '对方性别';
  }
  if((sexId+'')=='0')
  {
      return "<span class='items address'>"+message+"：女</span>";
  }else if((sexId+'')=='1')
  {
    return "<span class='items address'>"+message+"：男</span>";
  }
});

hbs.registerHelper('ifCond', function(v1, v2, options) {
  if(v1 == v2) {
    return options.fn(this);
  }
  return options.inverse(this);
});

hbs.registerHelper('otherSecretAge', function(type, age) {
  if(age)
  {
    if(type == 'TA的秘密')
    {
        return "<span class='items address'>对方年龄："+age+"</span>";
    }else{
      return "<span class='items address'>年龄："+age+"</span>";
    }
  }
    return "";
});



hbs.registerHelper('otherSecretName', function(username) {
  if(username)
  {
    if(username!=''&&username!='undefined')
    {
        return "<span class='items address'>对方姓名："+username+"</span>";
    }
  }
    return "";
});
hbs.registerHelper('isScoreDisabled', function(score) {
  if(score)
  {
    if(!isNaN(parseInt(score))&&parseInt(score)>=0&&parseInt(score)<=10)
    {
        return "disabled='disabled'";
    }
  }
    return "";
});


hbs.registerHelper('showComeFrom', function(type,comefrom) {
  if(type=="好友申请验证")
  {
    return "来自"+comefrom+"的好友申请";
  }
    return "";
});



hbs.registerHelper('getType', function(type) {
  if(type=="好友申请验证")
  {
    return "<button class='btn btn-success btn-agree-success-buttton'>同意</button>"+
            "<button class='btn btn-danger btn-disagree-success-buttton'>拒绝</button>";
  }
    return "<button class='btn btn-danger'>删除</button>";
});

hbs.registerHelper('isNull', function(obj) {
  if(typeof obj==='undefined'||obj==null||obj=="")
  {
    return false;
  }
  return true;
});


hbs.registerHelper("otherSecretBuildName",function(address1,address2){
  if(address1==""&&address2=="")
  {
    return "";
  }
  else
  {
    return "<span class='items address'>地址："+address1+address2+"</span>"
  }
});

hbs.registerHelper("secretHopeShow",function(type, hope){
  if(type.indexOf('WO的秘密') != -1 && hope != '') {
    return '<span class="items name">期望：'+hope+'</span>';
  }

  return '';
});

hbs.registerHelper("userPhotoShow",function(photo){
  return photo ? '/avatar/'+photo : 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC';
});

hbs.registerHelper("floaterSex",function(sexId){

  if(sexId == 2)
  {
    return "女";
  }
  return "男";
});

hbs.registerHelper("targetShow",function(sex, age, keyword){

  if(sex || age || keyword) {
    return '<span class="items">目标人：</span>';
  }
  return '';
});