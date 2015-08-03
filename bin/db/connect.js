var mysql = require('mysql');  
      
var TEST_DATABASE = 'ancestor';   
  
//创建连接 
var client =null;

/* mysql.createConnection({  
  user: 'root',  
  password: 'ww3ww3',  
});*/

var hasOpen=false;



module.exports.query=function(sql,fn,logic){
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
         fn.apply(results,[fields,logic]);
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
    client.end();
    hasOpen=false;
}