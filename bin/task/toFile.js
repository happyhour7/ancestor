// 加载File System读写模块  
var fs = require('fs');  
  
var file = "c:\\a.txt";  
//writeFile(file,obj);  
  
function writeFile(file,obj){  
    // 测试用的中文  
    var str = JSON.stringify(obj);
    // 把中文转换成字节数组  
    //var arr = iconv.encode(str, 'utf-8');  
      
    // appendFile，如果文件不存在，会自动创建新文件  
    // 如果用writeFile，那么会删除旧文件，直接写新文件  
 //写入文件
  fs.writeFile(file, str, function (err) {
      if (err) throw err;
      console.log('It\'s saved!'); //文件被保存
  }); 
}  

module.exports = writeFile;