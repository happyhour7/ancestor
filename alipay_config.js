var config = {
    partner:'2088021457068229' //合作身份者id，以2088开头的16位纯数字
    ,key:'m9fcges6tw5cbdh7uy8yutdrs71xs7mv'//安全检验码，以数字和字母组成的32位字符
    ,seller_email:'13926167658@139.com' //卖家支付宝帐户 必填 
	,return_url: 'http://localhost:5000/alipay/return' // 回调地址
};

var Alipay = require('direct-alipay');
Alipay.config(config);

exports.alipay = Alipay;
