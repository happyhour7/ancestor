var mysql = require('mysql');  
      
var TEST_DATABASE = 'ancestor';   
  
//创建连接 
var client =mysql.createConnection({  
  user: 'root',  
  password: 'ww3ww3',  
});

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
        if (err) {  
          throw err;  
        }  
            
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
        if (err) {  
          throw err;  
        }  
            
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
function open(){
    client.connect();
    client.query("use " + TEST_DATABASE);
    hasOpen=true;
}
function close(){
  return;
    client.end();
    hasOpen=false;
}