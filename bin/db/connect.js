var mysql = require('mysql');  
      
var TEST_DATABASE = 'ancestor';
var client;

function handleConnect() {
    //创建连接
    client =mysql.createConnection({
        user: 'root',
        password: '6399998'
    });

    client.on('error', function (err) {
        console.log('数据库连接出错啦', err);
        // 如果是连接断开，自动重新连接
        //if (err.code === 'PROTOCOL_CONNECTION_LOST') {
        client =mysql.createConnection({
            user: 'root',
            password: '6399998'
        });
    });
}

var hasOpen=false;

module.exports.test=function(){
  if(hasOpen===false){
        open();
    }
  var sql="insert into users set username=?,password=?,sex=?,usertype=?,score=?,email=?,cityname=?,qq=?,phone=?";
  //client.query(sql,['william wang','123456',1,1,10,'happyhour7@163.com','南京','251619896','13813994215']);
}

module.exports.update=function(sql,fn){
    if(hasOpen===false){
        open();
    }
    if(sql==""){
      fn.apply({},[""]);
      return;
    }
    client.query(  
      sql,  
      function selectCb(err, results, fields) {  
       /* if (err) {
          throw err;  
        }  */
            
        if(results)
        {
         fn.apply(results,[fields]);
        }    
      }  
    );
}

module.exports.query=function(sql,fn,logic,keyname){
    if(hasOpen===false){
        open();
    }
    if(sql==""){
    	fn.apply({},["",logic]);
    	return;
    }
    client.query(  
      sql,  
      function selectCb(err, results, fields) {  
        /*if (err) {
          throw err;
        }  */
            
        if(results)
        {
         fn.apply(results,[keyname,logic]);
        }    
      }  
    );
};
module.exports.execute=function(sql,columns){
    if(hasOpen===false){
        open();
    }
    client.query(  
      sql, 
      columns  
    );
};

module.exports.exec = function(sql, datas, callback) {
  if(hasOpen ===false) {
    open();
  }
  client.query(sql, datas, callback);
};
function open(){
    client.connect(function (err) {
        if (err) {
            console.log('error when connecting to db:', err);
            setTimeout(handleConnect , 2000);
        } else {
            client.query("use " + TEST_DATABASE);
            hasOpen=true;
        }
    });
}

function close(){
  return;
    client.end();
    hasOpen=false;
}

handleConnect();