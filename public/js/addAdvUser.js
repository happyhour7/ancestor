$.ajax({
    url:"/admin/getAdvUser",
    async:false,
    cache:false,
    success:function(data){
        var html="<tr>"+
                "<td><<index>></td>"+
                "<td><<userid>></td>"+
                "<td><<username>></td>"+
                "<td><<location>></td>"+
                "</tr>";
        var result="";

        for(var i=0;i<data.length;i++)
        {
            var tmp=data[i];
            var _location=tmp.location.split(",").join("</br>");

            _location=_location.replace("firstpage-top","一级页面顶部广告");
            _location=_location.replace("firstpage-left-top","一级页面左侧顶部广告");
            _location=_location.replace("firstpage-left-mid","一级页面左侧中间广告");
            _location=_location.replace("firstpage-left-bottom","一级页面左侧下方广告");
            _location=_location.replace("innerpage-left-top","二级页面左侧顶部广告");
            _location=_location.replace("innerpage-left-bottom","二级页面左侧底部广告").split(",").join("</br>");

            result+=html.replace("<<index>>",i+1)
                            .replace("<<userid>>",tmp.userid)
                            .replace("<<username>>",tmp.username)
                            .replace("<<location>>",_location);
        }
        $("#advuser-table-tbody").html(result);
    }
});

$("#advUser_add_post_button").click(function(){
    $("#advUser_add_submit_button").trigger("click");
    $("#userid").val("");
    $("#username").val("");
    $("#password").val("");
    $("#passwords").val("");
    $("input[name='location']").removeAttr("checked");
});
