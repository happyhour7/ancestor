$("#loginbutton").click(function(){
    var username=$("#username").val();
    var password=$("#password").val();

    if(username==""||password==""){
        alert("请输入完整的用户名密码！");
        return false;
    }

});