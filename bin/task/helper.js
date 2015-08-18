var express = require('express');
var path = require('path');
var hbs = require('hbs');
hbs.registerHelper('dealUsername', function(text) {
    if(text)
    {
        text=text.substring(0,Math.floor(text.length/2))+"*";
    }
    
    return text
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
        return "<span class='items system-icons money ' style='width:80px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;'>"+currentPrize+"</span>";
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
hbs.registerHelper('otherSecretSex', function(sexId) {
  if(sexId)
  {
    if((sexId+'')=='0')
    {
        return "<span class='items address'>对方性别：女</span>";
    }else if((sexId+'')=='1')
    {
      return "<span class='items address'>对方性别：男</span>";
    }
  }
    return "";
});

hbs.registerHelper('otherSecretAge', function(age) {
  if(age)
  {
    if(age!=''&&age!='undefined')
    {
        return "<span class='items address'>对方年龄："+age+"</span>";
    }
  }
    return "";
});



hbs.registerHelper('otherSecretName', function(username) {
  if(username)
  {
    if(username!=''&&username!='undefined')
    {
        return "<br/><br/><span class='items address'>对方姓名："+username+"</span>";
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
