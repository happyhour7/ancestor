var config = {
    partner:'2088021457068229' //合作身份者id，以2088开头的16位纯数字
    ,key:'m9fcges6tw5cbdh7uy8yutdrs71xs7mv'//安全检验码，以数字和字母组成的32位字符
    ,seller_email:'2330416537@qq.com' //卖家支付宝帐户 必填 
    ,host:'http://localhost:5000/'
	,cacert:'cacert.pem'//ca证书路径地址，用于curl中ssl校验 
	,transport:'http' //访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
	,input_charset:'utf-8'//字符编码格式 目前支持 gbk 或 utf-8
};

var Alipay = require('alipay').Alipay;

exports.alipay = new Alipay(config);
