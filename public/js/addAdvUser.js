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
                "<td data='<<username>>'><button class='btn btn-warning btn-advuser-mod' style='width:80px;margin:10px;'>修改</button><button class='btn btn-danger btn-advuser-del' style='width:80px;margin:10px;'>删除</button></td>"+
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
                            .replace("<<username>>",tmp.username)
                            .replace("<<location>>",_location);
        }
        $("#advuser-table-tbody").html(result);
        $(".btn-advuser-mod").click(function(){
        	var username=$(this).parent().attr("data");
        	window.location="/admin/advUserManagerMod?userid="+username;
        });
        $(".btn-advuser-del").click(function(){
        	var username=$(this).parent().attr("data");
        	$.ajax({
        		url:"/admin/delAdvUser?username="+username,
        		async:false,
        		cache:false,
        		success:function(data){
        			location.reload();
        		}
        	});
        });
    }
});

$(".advuser-add-btn").click(function(){
	window.location="/admin/advUserManagerAdd";
});

$("#advUser_add_post_button").click(function(){
    $("#advUser_add_submit_button").trigger("click");
    setTimeout(function(){window.location = '/admin/advUserManager';}, 500);
});


if($("#location_hidden")[0]!=null)
{
	var results=$("#location_hidden").val().split(',');
	console.log(results);
	for(var i=0;i<results.length;i++)
	{
		$("input[value='"+results[i]+"']").attr("checked","checked");
	}
	
}
