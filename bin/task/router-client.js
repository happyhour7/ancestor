var async = require('async');
var express = require('express');
var DB=require("../db/connect");
var session = require('express-session');
var router = express.Router();
var fake_datas=require('./fake-data');
var viewPath='actions/secret/';
var formidable = require("formidable");
var fs = require("fs");
var sqlCode=require("./sql");
var Queue=require("../queue");
var fake_mine_datas=[];
var fake_ta_datas=[];
var fake_sell_datas=[];
var fake_offser_datas=[];
var write=require("./toFile");
var homeSQL=sqlCode.homeSQL;
var orderSQL=sqlCode.orderSQL;
var loginHomeSQL=sqlCode.loginHomeSQL;
var floaterGetSQL=sqlCode.floaterGetSQL;
var personalAvgGetSQL=sqlCode.personalAvgGetSQL;

var longStoreSQL=sqlCode.longStoreSQL;
var loginLongStoreSQL=sqlCode.loginLongStoreSQL;
var hotSecretSQL=sqlCode.hotSecretSQL;

// 注册in_array 方法
Array.prototype.S=String.fromCharCode(2);
Array.prototype.in_array=function(e){
      var r=new RegExp(this.S+e+this.S);
      return (r.test(this.S+this.join(this.S)+this.S));
};

function getHomeSQL(){
    var otherWhere=arguments[0]||"";
    if(currentSession && currentSession.username){
        return loginHomeSQL.replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<where>",otherWhere);
    }
    else{
        var tmp=homeSQL.replace("<where>",otherWhere);
        return tmp;
    }
    /*var otherWhere=arguments[0]||"";

    return homeSQL.replace("<where>",otherWhere);*/
}


function getLongStorySQL(){
	if(currentSession && currentSession.username){
        return loginLongStoreSQL.replace("<username>",currentSession.username)
            .replace("<username>",currentSession.username)
            .replace("<username>",currentSession.username);
    }
    else{
        return longStoreSQL;
    }
}

// 获取当前登陆用的好友姓名组成的数据
function geFriends(data) {
    var result = {};
    var haoyous = [];
    for(var i=0;i<data.length;i++)
    {
        haoyous.push(data[i]["username"]);
    }

    result['haoyous'] = haoyous;
    return result;
}
// 获取当前登录用户的评论
function getComments (data) {
    var replayers = [];
    for (var i = 0; i < data.length; i++) {
        replayers.push(data[i].fileid);
    }

    _tmpData['replayers'] = replayers;
    return _tmpData;
}

/*返回给客户端的数据*/
var returnData={};
var currentQueue=null;
var _tmpData={};
/* GET home page. */
router.get('/', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("index");
    
    if(currentSession && currentSession.username) {
        // 获取登陆用户的朋友
        currentQueue.push({exec: function() {
            DB.query("select DISTINCT u.username from users u right join friends on friends.friendname=u.username where friends.username='"+currentSession.username+"'",bindData,geFriends,'secretDatas');
        }});

        // 获取登录用户的评论
        currentQueue.push({exec: function(data) {
            _tmpData = data[0];
            DB.query("select fileid from replay where replayer='"+currentSession.username+"'",bindData,getComments,'secretDatas');
        }});

        currentQueue.push({exec:function(data){
            _tmpData = data[0];
            DB.query(getHomeSQL(" and secretMainType<>'漂流瓶' "),bindData,indexLogic,'secretDatas');
        }});
    }else {
        currentQueue.push({exec:function(){
            DB.query(getHomeSQL(" and secretMainType<>'漂流瓶' "),bindData,indexLogic,'secretDatas');
        }});
    }

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';
        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                }
            }

            return _tmpData;
        });
    }});


    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);//console.log
        //
        
    }});
    currentQueue.start();
});
function getSurvey(){
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from survey",bindData,surveyLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select count(Id) as cc from surveyanswer where good<>null or good <>''",bindData,surveyGoodLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select count(Id) as cc from surveyanswer where bad<>null or bad<>''",bindData,surveyBadLogic,'secretDatas');
    }});
    if(currentSession&&currentSession.username)
    {
        currentQueue.push({exec:function(data){
                _tmpData=data[0];
                DB.query("select count(Id) as cc from surveyanswer where username='"+currentSession.username+"'",bindData,surveyLawLogic,'secretDatas');
        }});
    }

}
function surveyLawLogic(data){
    if(data[0].cc>0)
    {
        _tmpData["survey"]["law"]="law";
    }
    else
    {
        
        _tmpData["survey"]["law"]=null;
    }
    return _tmpData;
}
function surveyGoodLogic(data){

    _tmpData["survey"]["good"]=data[0].cc;
    return _tmpData;
}
function surveyBadLogic(data){
    _tmpData["survey"]["bad"]=data[0].cc;
    return _tmpData;
}
function surveyLogic(data){
    _tmpData["survey"]=data[0];
    return _tmpData;
}
function getMyFriends(){
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select DISTINCT u.* from users u right join friends on friends.friendname=u.username and friends.username='"+currentSession.username+"' order by u.Id",bindData,getMyFirendsLogic,'secretDatas');
    }});
}
function getMyFirendsLogic(data){
    _tmpData["friends"]=data.slice(1);
    return _tmpData;
}
function getHostSecret(){
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query(hotSecretSQL,bindData,hotSecretLogic,'secretDatas');
    }});
}

function hotSecretLogic(data){
    _tmpData["hostSecret"]=data;
    return _tmpData;
}
router.get('/search',function(req,res){
    currentSession = req.session;
    var keyword=req.query.keyword;
    var type=req.query.type||"";
        render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("index");
    if(type=="")
    {
        currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and (owner like '%"+keyword+"%' or"+
                            " secretTitle like '%"+keyword+"%' or "+
                            " secretMainType like '%"+keyword+"%' or "+
                            " secretType like '%"+keyword+"%' or "+
                            " secretSubType like '%"+keyword+"%' or "+
                            " secretCity like '%"+keyword+"%' or "+
                            " secretKeyWord like '%"+keyword+"%' or "+
                            " longstory like '%"+keyword+"%')")
                        ,bindData,indexLogic,'secretDatas');
        }});
    }
    else
    {
        currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and ("+
                            " secretKeyWord like '%"+keyword+"%')")
                        ,bindData,indexLogic,'secretDatas');
        }});
    }
    


    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        write("myjson.txt",data[0]);
        render.apply(data[0],['',function(data){return data;}]);
        
    }});
    currentQueue.start();
});


function systemNoticeLogic(data){
    var notice=data[0];
    _tmpData["systemNotice"]=notice.notice;
    return _tmpData;
}
function firstAdvLogic(data){
    
    async.each(data, function(tmp, next){
        try{
            // tmp.score=global.cache["adv"][render.res.cookie["username"]][tmp.location];
            tmp.userscore=global.cache["adv"][render.res.cookie["username"]][tmp.location];
        }catch(e){}

        async.parallel([
            function(callback){
                DB.exec('select sum(score) as score from advscore where advId=?', [tmp.Id], function(err, result){
                    if(err){
                        callback(err);
                    }else{
                        callback(null, result[0]['score']);
                    }
                });
            },
            function(callback){
                if(!tmp.userscore && currentSession){
                    DB.exec('select score as userscore from advscore where advId=? and username=?', [tmp.Id, currentSession.username], function(err, result){
                        if(err){
                            callback(err);
                        }else{
                            callback(null, result.length > 0 ? result[0]['userscore']:undefined);
                        }
                    });
                    return;
                }

                callback(null);
            }
        ], function(err, results){
            if(err)
                next(err);

            tmp['score'] = 0;
            if(results[0]){
                tmp['score'] = results[0];
            }
            if(results[1]){
                tmp['userscore'] = results[1];
            }

            if(tmp.location=="firstpage-top"){
                _tmpData["firstpageTop"]=tmp;
            }
            if(tmp.location=="firstpage-left-top"){

                _tmpData["firstpageLeftTop"]=tmp;
            }
            if(tmp.location=="firstpage-left-mid"){
                _tmpData["firstpageLeftMid"]=tmp;
            }
            if(tmp.location=="firstpage-left-bottom"){
                _tmpData["firstpageLeftBottom"]=tmp;
            }
            if(tmp.location=="innerpage-left-top"){
                _tmpData["innerpageLeftTop"]=tmp;
            }
            if(tmp.location=="innerpage-left-bottom"){
                _tmpData["innerpageLeftBottom"]=tmp;
            }

            next(null);

        });
    }, function(err){
        if(err)
            throw err;

        return _tmpData;
    });
}
function bindData(keyname,logic){
    var data=logic(this);
    if(currentQueue.next()){
        currentQueue.exec(data);
    }
}
function indexLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            if(currentSession && currentSession.username)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
                // 判断是否为秘密发布者的好友
                if(data[i].owner==currentSession.username || (data[i].secretLimit == 3 && _tmpData['haoyous'].in_array(data[i].owner))) {
                    data[i]["ishaoyou"] = true;
                    data[i]["hasReply"] = true;
                }

                // 回复可见秘密处理
                if(data[i].secretLimit == 2 && _tmpData['replayers'].in_array(data[i].Id)) {
                    data[i]["hasReply"] = true;
                }
            }

            // 好友可见秘密处理
            if(data[i].secretLimit != 3) {
                data[i]["ishaoyou"] = true;
            }else if(data[i].secretLimit != 2) {
                data[i]["hasReply"] = true;
            }

        }
    }
    result['newest_choosen']=true;
    result['secretDatas']=data;
    return result;
}


router.get('/secret/longstore',function(req,res){
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="index";
    
    
    currentQueue=new Queue("longstory");
    currentQueue.push({exec:function(){
        DB.query(getLongStorySQL(),bindData,longsStoryLogic,'secretDatas');
    }});

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';

        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                };
            }

            return _tmpData;
        });
    }});

    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});

    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        //currentQueue.end();
        
    }});
    currentQueue.start();
});

function longsStoryLogic(data){
    data["longstore_choosen"]=true;
    data["secretDatas"]=data;
    return data;
}


//我的秘密
router.get('/secret/mine', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("mine");
    
    if(currentSession && currentSession.username) {
        // 获取登陆用户的朋友
        currentQueue.push({exec: function() {
            DB.query("select DISTINCT u.username from users u right join friends on friends.friendname=u.username where friends.username='"+currentSession.username+"'",bindData,geFriends,'secretDatas');
        }});

        // 获取登录用户的评论
        currentQueue.push({exec: function(data) {
            _tmpData = data[0];
            DB.query("select fileid from replay where replayer='"+currentSession.username+"'",bindData,getComments,'secretDatas');
        }});

        currentQueue.push({exec:function(data){
            _tmpData = data[0];
            DB.query(getHomeSQL(" and secretMainType='WO的秘密' "),bindData,woLogic,'secretDatas');
        }});
    }else {
        currentQueue.push({exec:function(){
            DB.query(getHomeSQL(" and secretMainType='WO的秘密' "),bindData,woLogic,'secretDatas');
        }});
    }

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';

        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                };
            }

            return _tmpData;
        });
    }});

    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);

    }});
    currentQueue.start();
});
function woLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            if(currentSession && currentSession.username)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }

                // 判断是否为秘密发布者的好友
                if(data[i].owner==currentSession.username || (data[i].secretLimit == 3 && _tmpData['haoyous'].in_array(data[i].owner))) {
                    data[i]["ishaoyou"] = true;
                    data[i]["hasReply"] = true;
                }

                // 回复可见秘密处理
                if(data[i].secretLimit == 2 && _tmpData['replayers'].in_array(data[i].Id)) {
                    data[i]["hasReply"] = true;
                }
            }

            // 好友可见秘密处理
            if(data[i].secretLimit != 3) {
                data[i]["ishaoyou"] = true;
            }else if(data[i].secretLimit != 2) {
                data[i]["hasReply"] = true;
            }
        }
    }
   result['wo_choosen']=true;
   result['secretDatas']=data;
   return result; 
}


//发布秘密
router.get('/secret/write', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="sendSecret";
    currentQueue=new Queue("sendSecret");

    currentQueue.push({exec:function(data){
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);

        
    }});
    currentQueue.start();
});



//我的定制
router.get('/secret/order', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view='order';
    currentQueue=new Queue("");

    currentQueue.push({exec:function(){
        DB.query(getMyOrder(),bindData,orderInitLogin,'secretDatas');
        
    }});

    // 根据定制获取的秘密
    currentQueue.push({exec:function(data){
        _tmpData = data[0];
        var order = _tmpData['order_info'];
        var sql = '';

        if(JSON.stringify(order) != "{}"){
            var where = 'owner="'+order['owner']+'" and secretMainType="'+order['maintype']+'"';

            if(order['type']){
                where += ' and secretType="'+order['type']+'"';
            }
            if(order['subtype']){
                where += ' and secretSubType="'+order['subtype']+'"';
            }
            if(order['cityname']){
                where += ' and secretCity="'+order['cityname']+'"';
            }
            if(order['sex']){
                where += ' and othersex='+(order['sex']==2?0:order['sex']);
            }
            if(order['age']){
                where += ' and otherage="'+order['age']+'"';
            }

            if(order['maintype'] != 'WO的秘密' && order['grandsubtype']){
                where += ' and secretGrandSubType="'+order['grandsubtype']+'"';
            }
            sql = orderSQL.replace('<where>', where);
        }

        DB.query(sql, bindData, function(secretDatas){
            _tmpData['secretDatas'] = [];

            if(secretDatas.length >0){
                for (var i = 0; i < secretDatas.length; i++) {
                    if(currentSession && currentSession.username)
                    {
                        if(secretDatas[i].owner==currentSession.username)
                        {
                            secretDatas[i]["mine"]=true;
                        }
                    }
                }

                _tmpData['secretDatas'] = secretDatas;
            }

            return _tmpData;
        });
    }});

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';
        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                };
            }

            return _tmpData;
        });
    }});

    getHostSecret();

    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("",render,function(_data){return  _tmpData;});
    }});
    currentQueue.start();
});

function getMyOrder(){
    if(currentSession!=null)
    {
        return "select * from orderdeal where owner='"+currentSession.username+"'";
    }
    else
    {
        return "select * from orderdeal where owner='allusers'";
    }
}

// 定制页面数据初始化逻辑
function orderInitLogin (data) {
    var result = {};
    
    result['order_choosen'] = true;
    result['order_info'] = data[0]||{};

    return result;

}

//保存定制
router.post('/secret/orderdealsave', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view='order';
    if(currentSession==null)
    {
        render.view="index";
        DB.query(getHomeSQL(),render,indexLogic);
        return false;
    }
    else
    {
        var splitString="";
        splitString=req.body.secretMainType+","+
                req.body.secretType+","+
                req.body.secretSubType+","+
                (req.body.secretGrandSubType||"")+","+

                (req.body.secretCity||"")+","+

                (req.body.secretSex||"")+","+
                (req.body.secretAge||"");
        var results=splitString.split(",");
        results.push(currentSession.username);
        DB.update("delete from orderdeal where owner='"+currentSession.username+"'",function(){
            DB.execute("insert into orderdeal set maintype=?,type=?,subtype=?,grandsubtype=?,"+
                "cityname=?,sex=?,age=?,owner=?",results);

            res.redirect('/secret/order');

        });
    }
    
});

// 删除定制
router.get('/secret/orderdealdel', function(req, res) {
    currentSession = req.session;
    var id=req.query.id;
    if(!isNaN(id))
    {
        DB.update("delete from orderdeal where id="+id,function(){
            res.json({status:"success"});
        });

    }
    else
    {
        res.json({status:"error"});
    }
});



router.post('/secret/replaysave',function(req,res){
    currentSession = req.session;
    render.req=req;
    render.res=res;
    var sql="insert into replay set replayer=?,content=?,fileid=?,replayTime=?";
    var result=[];
    result.push(currentSession.username);
    result.push(req.body.content);
    result.push(parseInt(req.body.filedid));
    result.push(req.body.replayTime)
    DB.exec(sql,result, function(err, dat) {
        if(err) {
            console.log(err);
        }

        res.json({status: true});
    });
    // DB.query(getHomeSQL(),render,indexLogic);
});

//他的秘密
router.get('/secret/ta', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=null;
    
    currentQueue=new Queue("index");
    
    if(currentSession && currentSession.username) {
        // 获取登陆用户的朋友
        currentQueue.push({exec: function() {
            DB.query("select DISTINCT u.username from users u right join friends on friends.friendname=u.username where friends.username='"+currentSession.username+"'",bindData,geFriends,'secretDatas');
        }});

        // 获取登录用户的评论
        currentQueue.push({exec: function(data) {
            _tmpData = data[0];
            DB.query("select fileid from replay where replayer='"+currentSession.username+"'",bindData,getComments,'secretDatas');
        }});

        currentQueue.push({exec:function(data){
            _tmpData = data[0];
            DB.query(getHomeSQL(" and secretMainType='TA的秘密' "),bindData,taLogic,'secretDatas');
        }});
    }else {
        currentQueue.push({exec:function(){
            DB.query(getHomeSQL(" and secretMainType='TA的秘密' "),bindData,taLogic,'secretDatas');
        }});
    }

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';

        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                };
            }

            return _tmpData;
        });
    }});

    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
	currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        console.log("over");
        
    }});

    currentQueue.start();
});


function taLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            if(currentSession && currentSession.username)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
                // 判断是否为秘密发布者的好友
                if(data[i].owner==currentSession.username || (data[i].secretLimit == 3 && _tmpData['haoyous'].in_array(data[i].owner))) {
                    data[i]["ishaoyou"] = true;
                    data[i]["hasReply"] = true;
                }

                // 回复可见秘密处理
                if(data[i].secretLimit == 2 && _tmpData['replayers'].in_array(data[i].Id)) {
                    data[i]["hasReply"] = true;
                }
            }

            // 好友可见秘密处理
            if(data[i].secretLimit != 3) {
                data[i]["ishaoyou"] = true;
            }else if(data[i].secretLimit != 2) {
                data[i]["hasReply"] = true;
            }
        }
    }
   result['ta_choosen']=true;
   result['secretDatas']=data;
   return result; 
}


//出售秘密
router.get('/secret/sell', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("sell");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and secretMainType='出售秘密' "),bindData,sellLogic,'secretDatas');
    }});

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';

        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                };
            }

            return _tmpData;
        });
    }});

    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);
        
    }});
    currentQueue.start();
    //console.log(currentQueue._datas);
});

function sellLogic(data){
    var result={};
        if(data.length>0)
        {
            for(var i=0;i<data.length;i++)
            {
                if(currentSession && currentSession.username)
                {
                    if(data[i].owner==currentSession.username)
                    {
                        data[i]["mine"]=true;
                    }
                }
            }
        }
       result['sell_choosen']=true;
       result['secretDatas']=data;
       write("myjson.txt",result);
       return result; 
}
//秘密悬赏
router.get('/secret/offer', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="index";
    currentQueue=new Queue("offer");
    currentQueue.push({exec:function(){
        DB.query(getHomeSQL(" and secretMainType='悬赏秘密' "),bindData,offerLogic,'secretDatas');
    }});

    // 添加个人信用评分
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        var sql = '';

        if(_tmpData['secretDatas'].length > 0){
            var owners = [];
            for(var o in _tmpData['secretDatas']){
                owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
            }

            sql = personalAvgGetSQL.replace('<username>',owners.join(','));
        }

        DB.query(sql, bindData, function(_data){
            var avgDatas = {};
            for(var a in _data){
                avgDatas[_data[a]['username']] = _data[a]['average'];
            }

            if(JSON.stringify(avgDatas) != "{}"){
                for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                    var secret = _tmpData['secretDatas'][k];
                    secret['personal_score'] = avgDatas[secret['owner']];
                };
            }

            return _tmpData;
        });
    }});

    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);

        
    }});
    currentQueue.start();
    //console.log(currentQueue._datas);
});

function offerLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            if(currentSession && currentSession.username)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
            }
        }
    }
   result['offer_choosen']=true;
   result['secretDatas']=data;
   write("myjson.txt",data);
   return result; 
}
router.get('/secret/del',function(req,res){
    currentSession = req.session;
    var id=req.query.id;
    //console.log(id);
    if(!isNaN(id))
    {
        DB.update("delete from files where id="+id,function(){
            res.json({status:"success"});

        });

    }
    else
    {
        res.json({status:"error"});
    }
    
});


router.post('/secret/saveSecret',function(req, res){
    currentSession = req.session;
    var datas=[];
    var splitString="";
    render.res=res;
    render.req=req;
    splitString=req.body.secretMainType+","+
                req.body.secretType+","+
                req.body.secretSubType+","+
                (req.body.secretGrandSubType||"")+","+
                (req.body.secretLimit||1)+","+
                (req.body.secretHope||"")+","+
                (req.body.secretCity||"")+","+
                (req.body.secretDate||"")+","+
                (req.body.secretKeyWord||"")+","+
                (req.body.secretTitle||"")+","+
                (req.body.secretBackground||"")+","+
                (req.body.secretContent||"")+","+
                (req.body.secretKnown||"")+","+
                (req.body.othername||"")+","+
                (req.body.othersex||"")+","+
                (req.body.otherage||"")+","+
                (req.body.otherBuildName||"")+","+
                (req.body.otheraddress||"")+","+
                (req.body.secretPrice||"")+","+
                (req.body.secretLimitTime||"")+","+
                (req.body.islongstory||0)+","+
                (req.body.longstory||"")+","+
                (req.body.createTime||"");
    datas=splitString.split(',');
    datas[4]=getInt(datas[4]);
    datas[14]=getInt(datas[14]);
    datas[18]=getInt(datas[18]);
    if(currentSession!==null)
    {
        datas.push(currentSession.username);
    
    
        ////console.log(datas);
        var sql="insert into files set secretMainType=?,secretType=?,secretSubType=?,secretGrandSubType=?,secretLimit=?,"+
                "secretHope=?,secretCity=?,secretDate=?,secretKeyWord=?,secretTitle=?,secretBackground=?,"+
                "secretContent=?,secretKnown=?,othername=?,othersex=?,otherage=?,otherBuildName=?,otheraddress=?,"+
                "secretPrice=?,secretLimitTime=?,islongstory=?,longstory=?,createTime=?,owner=?";
        DB.exec(sql,datas, function(err, result){
            if(err)
                throw err;

            AddScore(5);
            res.redirect("/");
        });
        
    }
    else
    {
        res.redirect("/");
    }
});

function AddScore(num){
    //console.log("update users set score="+(parseInt(currentSession.user.score)+num)+" where username='"+currentSession.username+"'");
    DB.update("update users set score="+(parseInt(currentSession.user.score)+num)+" where username='"+currentSession.username+"'",function(){
        
    });
    
}

function gotoHome(){
    DB.query(getHomeSQL(),render,indexLogic);
}




router.get('/secret/permsg-score',function(req,res){
    currentSession = req.session;
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;

        currentQueue=new Queue("permsg-score");
        currentQueue.push({exec:function(data){
            DB.query("select * from users where username='"+currentSession.username+"'",bindData,function(data){_tmpData=data[0];return data[0];},'secretDatas');
        }});
        _tmpData={};
        getHostSecret();
        getMyFriends();
        
        currentQueue.push({exec:function(data){
            render.view="personal_score";
            render.apply([user, data[0]],['',personalScoreLogic]);
        }});
        currentQueue.start();
    }
    else
    {
        res.redirect("/");
    }
});

function personalScoreLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_score"]=true;
        result["hostSecret"] = data[1]["hostSecret"];
        result["friends"] = data[1]["friends"];
        return result;
    }
    else
    {
        return false;
    }

}

router.get('/secret/permsg-friend',function(req,res){
    currentSession = req.session;
    render.res=res;
    render.req=req;

    if(currentSession&&currentSession.username)
    {
        var user=currentSession.user;
        currentQueue=new Queue("friend");
        currentQueue.push({exec:function(data){
            DB.query("select * from users where username='"+currentSession.username+"'",bindData,function(data){_tmpData=data[0];return data[0];},'secretDatas');
        }});
        _tmpData={};
        getHostSecret();
        getMyFriends();
        
        currentQueue.push({exec:function(data){
            render.view="personal_friend";
            render.apply([user, data[0]],['',personalFriendLogic]);
        }});
        currentQueue.start();
    }
    else
    {
        res.redirect("/");
    }
});
function getnewMsg(){

}

// 删除好友
router.get('/friend/del',function(req,res){
    currentSession = req.session;
    var username=req.query.username;
    //console.log(id);
    if(currentSession && currentSession.username)
    {
        DB.update("delete from friends where friendname='"+currentSession.username+"' and username='"+username+"'",function(){
            DB.update("delete from friends where username='"+currentSession.username+"' and friendname='"+username+"'", function() {
                res.json({status:"success"});
            })

        });

    }
    else
    {
        res.json({status:"error"});
    }
    
});

router.get('/secret/getMyFriends',function(req,res){
    currentSession = req.session;
    render.req=req;
    render.res=res;
    if(currentSession&&currentSession.username)
    {
            currentQueue=new Queue("longstory");
            currentQueue.push({exec:function(){
                DB.query("select DISTINCT u.* from users u right join friends on friends.friendname=u.username where friends.username='"+currentSession.username+"'",bindData,getFriendNames,'secretDatas');
            }});

            // 添加个人信用评分
            currentQueue.push({exec:function(data){
                _tmpData=data[0];
                var sql = '';
                if(_tmpData.length > 0){
                    var owners = [];
                    for(var o in _tmpData){
                        owners.push('"'+_tmpData[o].username+'"');
                    }

                    sql = personalAvgGetSQL.replace('<username>',owners.join(','));
                }
                
                DB.query(sql, bindData, function(_data){
                    var avgDatas = {};
                    for(var a in _data){
                        avgDatas[_data[a]['username']] = _data[a]['average'];
                    }

                    if(JSON.stringify(avgDatas) != "{}"){
                        for (var k = 0; k < _tmpData.length; k++) {
                            var secret = _tmpData[k];
                            secret['personal_score'] = avgDatas[secret['username']];
                        };
                    }

                    return _tmpData;
                });
            }});

            currentQueue.push({exec:function(data){
                _tmpData={results:data[0]};
                res.json(_tmpData);
            }});
            currentQueue.start();
    }
    else
    {
        res.redirect("/");
    }

});

function getFriendNames(data){
    for(var i=0;i<data.length;i++)
    {
        data[i].isFriend=true;
    }
    return data;
}

function personalFriendLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_friend"]=true;
        result["hostSecret"] = data[1]["hostSecret"];
        result["friends"] = data[1]["friends"];
        return result;
    }
    else
    {
        return false;
    }
}

// 个人中心中的我的秘密
router.get('/secret/permsg-mysecret',function(req,res){
    currentSession = req.session;
    render.res=res;
    render.req=req;

    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;

        currentQueue=new Queue("permsg-mysecret");
        currentQueue.push({exec:function(){
            DB.query("select * from files where owner='"+currentSession.username+"'",bindData,getMySecrets,'secretDatas');
        }});

        // 添加个人信用评分
        currentQueue.push({exec:function(data){
            _tmpData=data[0];
            var sql = '';

            if(_tmpData['secretDatas'].length > 0){
                var owners = [];
                for(var o in _tmpData['secretDatas']){
                    owners.push('"'+_tmpData['secretDatas'][o].owner+'"');
                }

                sql = personalAvgGetSQL.replace('<username>',owners.join(','));
            }

            DB.query(sql, bindData, function(_data){
                var avgDatas = {};
                for(var a in _data){
                    avgDatas[_data[a]['username']] = _data[a]['average'];
                }

                if(JSON.stringify(avgDatas) != "{}"){
                    for (var k = 0; k < _tmpData['secretDatas'].length; k++) {
                        var secret = _tmpData['secretDatas'][k];
                        secret['personal_score'] = avgDatas[secret['owner']];
                    };
                }

                return _tmpData;
            });
        }});

        getHostSecret();
        getMyFriends();
        currentQueue.push({exec:function(data){
            _tmpData = data[0];
            render.view="personal_mysecret";
            /*DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
            DB.query("select * from files",render,function(_data){return  _tmpData;});*/
            render.apply([user, _tmpData],['',personalSecretLogic]);

        }});
        currentQueue.start();
    }
    else
    {
        res.redirect("/");
    }
});

function getMySecrets(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            if(data[i].owner==currentSession.username)
            {
                data[i]["mine"]=true;
            }
        }
    }
    result['secretDatas']=data;
    return result; 
}



router.get('/secret/getMineSecret',function(){
    currentSession = req.session;
    if(currentSession&&currentSession.username)
    {
        currentQueue=new Queue("");
        currentQueue.push({exec:function(){
            DB.query("select * from files where owner='"+currentSession.username+"'",bindData,getFriendNames,'secretDatas');
        }});
        currentQueue.push({exec:function(data){
            res.json(data);
            currentQueue.end();
        }});
    }
    else
    {
        res.json({status:"error"});
    }
});
function personalSecretLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_mysecret"]=true;
        result["secretDatas"] = data[1]["secretDatas"];
        result["hostSecret"] = data[1]["hostSecret"];
        result["friends"] = data[1]["friends"];
        return result;
    }
    else
    {
        return false;
    }
}

router.get('/secret/permsg-msg',function(req,res){
    currentSession = req.session;
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var user=currentSession.user;
        currentQueue=new Queue("msg");
        currentQueue.push({exec:function(data){
            DB.query("select * from users where username='"+currentSession.username+"'",bindData,function(data){_tmpData=data[0];return data[0];},'secretDatas');
        }});
        _tmpData={};
        getHostSecret();
        getMyFriends();
        
        currentQueue.push({exec:function(data){
            render.view="personal_msg";
            render.apply([user, data[0]],['',personalMsgLogic]);
        }});
        currentQueue.start();
    }
    else
    {
        res.redirect("/");
    }
});

function personalMsgLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        result["personal_msg_msg"]=true;
        result["hostSecret"] = data[1]["hostSecret"];
        result["friends"] = data[1]["friends"];
        return result;
    }
    else
    {
        return false;
    }
    
}




router.post('/secret/uploadImage',function(req, res){
    currentSession = req.session;
    var form = new formidable.IncomingForm(); //创建上传表单
    form.encoding = "utf-8"; //设置编辑
    form.uploadDir = "public/avatar/"; //设置上传目录
    form.keepExtensions = true; //保留后缀
    form.maxFieldsSize = 2 * 1024 * 1024; //文件大小
    var uploadName="";
    form.parse(req, function(err, fields, files) {

        if (err) {
            console.log(err);
            res.locals.error = err;
            res.render(viewPath+'personal', { title: '图片上传错误' });
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
              res.render(viewPath+'personal', { title: '图片上传错误' });
              return; 
        }

        var avatarName =  Math.random() + '.' + extName;
        DB.update("update users set userPhoto='"+avatarName+"' where username='"+currentSession.username+"'",function(){});
        currentSession.user.userPhoto=avatarName;
        var newPath = form.uploadDir + avatarName;
        fs.renameSync(files.fulAvatar.path, newPath); //重命名
    });
    
    res.locals.success = '上传成功';
    res.redirect('/secret/permsg');
});



//我的漂流瓶
router.get('/secret/floater', function(req, res) {
    currentSession = req.session;
    render.res=res;
    render.req=req;
    render.view="sendFloater";
    currentQueue=new Queue("floater");
    currentQueue.push({exec:function(){
        DB.query(floaterGetSQLQuery(" and files.owner='<username>' "),bindData,floaterInitLogic,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from advs",bindData,firstAdvLogic,'secretDatas');
        
    }});
    currentQueue.push({exec:function(data){
        DB.query("select * from config where system='system'",bindData,systemNoticeLogic,'secretDatas');
        
    }});
    getHostSecret();
    if(currentSession && currentSession.username)
    {
        getMyFriends();
    }
    getSurvey();
    currentQueue.push({exec:function(data){
        render.apply(data[0],['',function(data){return data;}]);

    }});
    currentQueue.start();
    //console.log(currentQueue._datas);
});

//获取漂流瓶的回复
router.get('/secret/floaterComments', function(req, res) {
    currentSession = req.session;
    var id=req.query.id;

    DB.query(
        "select * from replay where fileid="+id,
        function(fields,logic){
            var data=logic(this);
            if(data.length==0)
            {
                res.json({});
            }
            else
            {
                res.json({replays:data});
            }
            
        },
        function(data){
            return data;
        }
    );
});

// 捞捞看
router.get('/secret/floater/try', function(req, res) {
    currentSession = req.session;
    currentQueue=new Queue("floater_try");
    // 捞捞看
    currentQueue.push({exec:function(data){
        DB.query(floaterGetSQLQuery(" and secretCity = '<cityname>' and files.owner<>'<username>' "), bindData, getFloatersLogic, 'secretDatas');

    }});  
    currentQueue.push({exec:function(data){
        res.json(data[0]);
        
        currentQueue=null;
    }});
    currentQueue.start();
});

function floaterGetSQLQuery () {
    var otherWhere=arguments[0]||"";
    if(currentSession && currentSession.username){
        return floaterGetSQL.replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<username>",currentSession.username)
                    .replace("<where>",otherWhere)
                    .replace("<username>",currentSession.username)
                    .replace("<cityname>",currentSession.user.cityname);
    }
    else{
        var tmp=homeSQL.replace("<where>",otherWhere);
        return tmp;
    }
}

function getFloatersLogic(data){
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            data[i]["secretTitle"]="漂流瓶";
            data[i]["secretMainType"]="漂流瓶";
            if(currentSession && currentSession.username)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
            }
        }

        return data;
    }
    
    return {error:"什么都没有捞到"};
}

function floaterInitLogic(data){
    var result={};
    if(data.length>0)
    {
        for(var i=0;i<data.length;i++)
        {
            data[i]["secretTitle"]="漂流瓶";
            data[i]["secretMainType"]="漂流瓶";
            if(currentSession && currentSession.username)
            {
                if(data[i].owner==currentSession.username)
                {
                    data[i]["mine"]=true;
                }
            }
        }
    }
   result['floater_choosen']=true;
   result['secretDatas']=data;

   return result; 
}

// 回复漂流瓶
router.post('/secret/floater/reply', function(req, res) {
    currentSession = req.session;
    var sql="insert into replay set ?";
    var result={
        replayer: currentSession.username,
        content: req.body.content,
        fileid: req.body.filedid,
        replayTime: req.body.replayTime
    };

    DB.exec(sql, result, function(err, data) {
        if(err)
            throw err;

        var status = true;
        if(!data.insertId){
            status = {error:"回复失败"};
        }

        res.json(status);
    });
});

// 扔漂流瓶
router.post('/secret/saveFloater',function(req, res){
    currentSession = req.session;
    var datas=[];
    var splitString="";
    render.res=res;
    render.req=req;
    splitString=req.body.secretMainType+","+
                req.body.secretType+","+
                req.body.secretSubType+","+
                (req.body.secretGrandSubType||"")+","+
                (req.body.secretLimit||1)+","+
                (req.body.secretHope||"")+","+
                (req.body.secretCity||"")+","+
                (req.body.secretDate2||"")+","+
                (req.body.secretKeyWord||"")+","+
                (req.body.secretTitle||"")+","+
                (req.body.secretBackground||"")+","+
                (req.body.secretContent||"")+","+
                (req.body.secretKnown||"")+","+
                (req.body.othername||"")+","+
                (req.body.othersex||"")+","+
                (req.body.otherage||"")+","+
                (req.body.otherBuildName||"")+","+
                (req.body.otheraddress||"")+","+
                (req.body.secretPrice||"")+","+
                (req.body.secretLimitTime||"")+","+
                (req.body.islongstory||0)+","+
                (req.body.longstory||"")+","+
                (req.body.createTime||"");
    datas=splitString.split(',');
    datas[4]=getInt(datas[4]);
    datas[14]=getInt(datas[14]);
    datas[18]=getInt(datas[18]);
    if(currentSession!==null)
    {
        datas.push(currentSession.username);
    
    
        ////console.log(datas);
        var sql="insert into files set secretMainType=?,secretType=?,secretSubType=?,secretGrandSubType=?,secretLimit=?,"+
                "secretHope=?,secretCity=?,secretDate=?,secretKeyWord=?,secretTitle=?,secretBackground=?,"+
                "secretContent=?,secretKnown=?,othername=?,othersex=?,otherage=?,otherBuildName=?,otheraddress=?,"+
                "secretPrice=?,secretLimitTime=?,islongstory=?,longstory=?,createTime=?,owner=?";
        DB.exec(sql, datas, function(err, data) {
            if(err)
                throw err;

            res.redirect("/secret/floater");
        });
        
    }
        else
    {
        res.redirect("/");
    }
});

// 删除漂流瓶
router.get('/secret/floaterdel', function(req, res) {
    currentSession = req.session;
    var id=req.query.id;
    if(!isNaN(id))
    {
        DB.update("delete from files where id="+id,function(){
            res.json({status:"success"});
        });

    }
    else
    {
        res.json({status:"error"});
    }
});




var currentSession=null;
router.post("/client/login",function(req,res){
	/*render.res=res;
    render.req=req;
	
    render.view='index';*/
    currentSession=req.session;
    currentQueue=new Queue("asdf");
    currentQueue.push({exec:function(data){
        DB.query("select * from users where username='"+req.body.username+"' and password='"+req.body.password+"'",bindData,loginLogic,'secretDatas');
    }});  
    currentQueue.push({exec:function(data){
        var result=data[0]||data;
        if(result.Id) {
            res.cookie["username"]=result.username;    
        }
        res.json(result);
        
        currentQueue=null;
    }});
    currentQueue.start();
});


router.get('/secret/permsg',function(req,res){
    currentSession = req.session;
    render.res=res;
    render.req=req;
    
    if(currentSession&&currentSession.username)
    {
        var username=currentSession.username;
        var user=currentSession.user;
        currentQueue=new Queue("asdf");
        _tmpData={};
        currentQueue.push({exec:function(data){
            DB.query("select * from users where username='"+currentSession.username+"'",bindData,function(data){console.log(data); _tmpData=data[0];return data[0];},'secretDatas');
        }});
        getHostSecret();
        getMyFriends();
        
        currentQueue.push({exec:function(data){
            render.view="personal";
            render.apply([user, data[0]],['',personalLogic]);
        }});
        currentQueue.start();
        
    }
    else
    {
        res.redirect("/");
    }
    
    
});

router.post('/secret/personalUpdate',function(req,res){
    currentSession = req.session;
    var _pwd=req.body.password||"";
    var insertPassword="";
    if(_pwd!=="")
    {
        insertPassword=" password='"+_pwd+"',";
    }
    var sql="update users set "
                +insertPassword
                +" sex="+req.body.sex+","
                +" email='"+req.body.email+"',"
                +" qq='"+req.body.qq+"',"
                +" phone='"+req.body.phone+"',"
                +" cityname='"+req.body.cityname+"',"
                +" mark='"+req.body.mark+"'"
                +" where username='"+currentSession.username+"'";
    DB.update(sql,
        function(){});

    var username=currentSession.username;
    var user=currentSession.user;
    user.sex=parseInt(req.body.sex);
    user.email=req.body.email;
    user.qq=req.body.qq;
    user.phone=req.body.phone;
    user.cityname=req.body.cityname;
    user.mark=req.body.mark;
    if(_pwd!="")
    {
        user.password=req.body.password;
    }
    currentSession.user=user;
    res.json({title:"更新成功！"});
});
router.get('/secret/getAllComments',function(req,res){
    currentSession = req.session;
    var id=req.query.id;

    DB.query("select * from replay where fileid="+id,
        function(fields,logic){
            var data=logic(this);
            if(data.length==0)
            {
                res.json({});
            }
            else
            {
                res.json({replays:data});
            }
            
        },
        function(data){
            return data;
        });
});
router.get('/secret/setScore',function(req,res){
    currentSession = req.session;
    var id=req.query.id;
    var score=req.query.score;
    DB.update('delete from score where username="'+currentSession.username+'" and fileid='+id,function(){
        var sql="insert into score set username=?,fileid=?,score=?";
        var results=[currentSession.username];
        results.push(id);
        results.push(score);
        DB.execute(sql,results);
        res.json({status:"success"});
    });
});
function getInt(obj){
    if(isNaN(parseInt(obj)))
    {
        return 0;
    }
    else
    {
        return parseInt(obj);
    }
}

function personalLogic(data){
    if(data.length>0)
    {
        var result=clone(data[0]);
        if(data[0].sex==1)
        {
            result["men"]=true;
        }
        else
        {
            console.log("性别："+data[0].sex);
        }
        result["personal_msg"]=true;
        result["hostSecret"] = data[1]["hostSecret"];
        result["friends"] = data[1]["friends"];
        return result;
    }
    else
    {
        //render.res.render({error:"用户名或密码错误，请重新登录"});
        DB.query("",render,indexLogic);
        return false;
    }
}

function loginLogic(data){
    if(data.length>0)
    {
    	currentSession.username=data[0].username;
        currentSession.user=data[0];
        if(data[0].sex==1)
        {
            data[0].man=true;
        }
        else
        {
            data[0].woman=true;
        }
        return data[0];
    }
    else
    {
        return {error:"用户名或密码错误，请重新登录"};
    }
    return false;
}

router.get('/secret/func',function(req,res){
    currentSession = req.session;
    var type=req.query.type;
    var deal=req.query.deal;
    var id=req.query.fileid;
    ////console.log("操作数为："+deal);
    var result=[currentSession.username];
    var tablename="isbad";
    if(type=="good")
    {
        tablename="isgood";
        
    }
    result.push(1);
        result.push(parseInt(id));
    var sql="insert into "+tablename+" set username=?, "+type+"=? , fileid=?";
    ////console.log(sql);
    DB.update("delete from "+tablename+" where username='"+currentSession.username+"' and fileid="+id,function(){
        if(deal=="add")
        {
            //console.log(result);
            DB.execute(sql,result);
        }
        res.json({status:"success"});
    });
});

router.get('/login2', function(req, res) {
  render(res,'main',{});
});

function render(fields,logic){
    var result;
    currentQueue=new Queue("");
    if(logic)
    {
        result=logic(this);
    }
    else
    {
        result=this;
    }
    
    var hasLogin=false;
    hasLogin=getUserLoginStatues(render.req.session);
    result["hasLogin"]=hasLogin;
    result["userid"]=render.res.cookie["username"];
    if(result!==false)
    {
        if(currentSession && currentSession.username)
        {
            currentQueue.push({exec:function(){
                DB.query("select * from systemmsg where username='"+currentSession.username+"' and isReaded='未读消息'",bindData,newMsgLogic,'secretDatas');
            }}); 
        }
    }
    currentQueue.push({exec:function(data){
        if(data)
        {
            result["hasNew"]=data[0];
        }
        render.res.render(viewPath+render.view, result);
        currentQueue.end();
    }});
    currentQueue.start();
}

function newMsgLogic(data){
    if(data.length>0)
    {
        return true;
    }
    return null;
}

function getUserLoginStatues(session){
	if(session&&session.username)
	{
		return session.username;
	}
	return false;
}




function clone(obj){  
    function Clone(){}  
    Clone.prototype = obj;  
    var o = new Clone();  
    for(var a in o){  
        if(typeof o[a] == "object") {  
            o[a] = clone(o[a]);  
        }  
    }  
    return o;  
} 

router.get('/search/user',function(req,res){
    currentSession = req.session;
    var where =req.query.where;
    currentQueue=new Queue("haha");
    currentQueue.push({exec:function(){
        DB.query("select * from users where username like '%"+where+"%' or cityname like '%"+where+"%'",bindData,searchUserLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        _tmpData=data[0];
        DB.query("select * from friends where username = '"+currentSession.username+"'",bindData,getMyFriendAndMoshengren,'secretDatas');
    }});
    currentQueue.push({exec:function(data){
        _tmpData={results:data[0]};
        res.json(_tmpData);
    }});
    currentQueue.start();
});
function searchUserLogic(data){
    return data;
}
function getMyFriendAndMoshengren(data){
    for(var i=0;i<_tmpData.length;i++)
    {
        var isFriend=false;
        for(var j=0;j<data.length;j++)
        {
            if(data[j].friendname==_tmpData[i].username)
            {
                //isFriend=true;
                _tmpData[i].isFriend=true;
                break;
            }
                
        }
    }
    return _tmpData;
}
router.post('/friend/addmsg',function(req,res){
    currentSession = req.session;
    var msg=req.body.msg;
    var friendname=req.body.frendname;
    var sql="insert into systemmsg set username=?,msg=?,isreaded=?,isOk=?,msgtype=?,comefrom=?";
    var result=[friendname];
    result.push(msg);
    result.push("未读");
    result.push("等待审核");
    result.push("好友申请验证");
    result.push(currentSession.username);
    DB.execute(sql,result);
    res.json({status:"success"});
});

router.get('/personal/getSystemMsg',function(req,res){
    currentSession = req.session;
    render.req=req;
    render.res=res;
    currentQueue=new Queue("haha");
    currentQueue.push({exec:function(){
        DB.query("select * from systemmsg where username='"+currentSession.username+"'",bindData,getSytemMsgLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        _tmpData={results:data[0]};
        res.json(_tmpData);
    }});
    currentQueue.start();
});
router.get('/personal/getSystemMsg',function(req,res){
    currentSession = req.session;
    render.req=req;
    render.res=res;
    currentQueue=new Queue("haha");
    currentQueue.push({exec:function(){
        DB.query("select * from systemmsg where username='"+currentSession.username+"'",bindData,getSytemMsgLogic,'secretDatas');
    }});

    currentQueue.push({exec:function(data){
        _tmpData={results:data[0]};
        res.json(_tmpData);
    }});
    currentQueue.start();
});

function getSytemMsgLogic(data){
    return data;
}

router.get('/friend/addAgree',function(req,res){
    currentSession = req.session;
    var come=req.query.come;
    var id=req.query.id;
    DB.update("delete from systemmsg where id="+id,function(){});
    var username=currentSession.username;
    var results=[come];
    results.push(username);
    DB.execute("insert into friends set friendname=?,username=?",results);
    DB.execute("insert into friends set username=?,friendname=?",results);

    var successResultUser=[currentSession.username];
    successResultUser.push("好友验证通过");
    successResultUser.push("验证通过");
    successResultUser.push("未读消息");
    successResultUser.push("您通过了来自"+come+"的好友申请");
    successResultUser.push("系统消息");
    DB.execute("insert into systemmsg set username=?,msgtype=?,isOk=?,isReaded=?,msg=?,comefrom=?",successResultUser);
    var successResultCome=[come];
    successResultCome.push("好友验证通过");
    successResultCome.push("验证通过");
    successResultCome.push("未读消息");
    successResultCome.push(currentSession.username+"通过了您的好友申请");
    successResultCome.push("系统消息");
    DB.execute("insert into systemmsg set username=?,msgtype=?,isOk=?,isReaded=?,msg=?,comefrom=?",successResultCome);
    res.json({status:"success"});
});
router.get('/friend/addDisagree',function(req,res){
    currentSession = req.session;
    var come=req.query.come;
    var id=req.query.id;
    DB.update("delete from systemmsg where id="+id,function(){});


    var successResultUser=[currentSession.username];
    successResultUser.push("好友验证未通过");
    successResultUser.push("验证通过");
    successResultUser.push("未读消息");
    successResultUser.push("您拒绝了来自"+come+"的好友申请");
    successResultUser.push("系统消息");
    DB.execute("insert into systemmsg set username=?,msgtype=?,isOk=?,isReaded=?,msg=?,comefrom=?",successResultUser);



    var successResultCome=[come];
    successResultCome.push("好友验证未通过");
    successResultCome.push("验证通过");
    successResultCome.push("未读消息");
    successResultCome.push(currentSession.username+"拒绝了您的好友申请");
    successResultCome.push("系统消息");
    DB.execute("insert into systemmsg set username=?,msgtype=?,isOk=?,isReaded=?,msg=?,comefrom=?",successResultCome);
    res.json({status:"success"});
});

router.get('/systemmsg/del',function(req,res){
    currentSession = req.session;
    var id=req.query.id;
    DB.update('delete from systemmsg where id='+id,function(){});
    res.json({status:"success"});
});
router.post('/chat/save',function(req,res){
    currentSession = req.session;
    var from=req.body.from;
    var to=req.body.to;
    var text=req.body.msg;
    var time=req.body.time;

    if(!global.cache["chat"])
    {
        global.cache["chat"]={};
    }
    if(!global.cache["chat"][to])
    {
        global.cache["chat"][to]=[];
    }
    global.cache["chat"][to].push({from:from,to:to,msg:text,time:time,hasSend:false});
    res.json({statu:"success"});
});

router.get('/chat/getMine',function(req,res){
    currentSession = req.session;
    if(currentSession==null)
    {
        res.json({status:"error"});
        return ;
    }
    var to=req.query.to;

    if(!global.cache["chat"])
    {
        global.cache["chat"]={};
    }
    if(!global.cache["chat"][to])
    {
        global.cache["chat"][to]=[];
    }
    var resutls=[];

    for(var i=0;i<global.cache["chat"][to].length;i++)
    {
        if(global.cache["chat"][to][i].hasSend===false)
        {
            resutls.push(global.cache["chat"][to][i]);
            global.cache["chat"][to][i].hasSend=true;
        }
    }
    res.json(resutls);
});

router.get('/logout',function(req,res){
    currentSession=null;
    res.cookie["username"]=null;
    req.session.destroy(function(err) {
        if(err) {
            console.log(err);
        }

        res.redirect("/");
    });
});


router.post('/survey/post',function(req,res){
    currentSession = req.session;
    var type=req.body.choosetype;
    var choose=req.body.answer;
    var username=currentSession.username;
    var sql="";
    if(type=="good")
    {
        sql="insert into surveyanswer set username=?,choose=?,good=?";
    }
    else
    {
        sql="insert into surveyanswer set username=?,choose=?,bad=?";
    }
    var results=[username];
    results.push(parseInt(choose));
    results.push("haha");
    DB.exec(sql, results, function(err, result) {
        if(err)
            console.log(err);

        var status = {error: "提交成功"};
        if(!result.insertId){
            status = {error:"提交失败"};
        }

        res.json(status);
    });
});
module.exports = router;