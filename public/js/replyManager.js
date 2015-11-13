$.ajax({
    url:"/admin/getReplies",
    async:false,
    cache:false,
    success:function(data){
        var html="<tr>"+
                "<td><<index>></td>"+
                "<td><<fileid>></td>"+
                "<td><<secretTitle>></td>"+
                "<td><<content>></td>"+
                "<td><<replayer>></td>"+
                "<td data='<<replayId>>'><button class='btn btn-danger btn-advuser-del' style='width:80px;margin:10px;'>删除</button></td>"+
                "</tr>";
        var result="";

        for(var i=0;i<data.length;i++)
        {
            var tmp=data[i];

            result+=html.replace("<<index>>",i+1)
                            .replace("<<fileid>>",tmp.fileid)
                            .replace("<<secretTitle>>",tmp.secretTitle)
                            .replace("<<content>>",tmp.content ? tmp.content.substr(0, 10) : '')
                            .replace("<<replayer>>",tmp.replayer)
                            .replace("<<owner>>",tmp.owner)
                            .replace("<<replayId>>",tmp.replayId);
        }
        $("#advuser-table-tbody").html(result);
        $(".btn-advuser-del").click(function(){
        	var id=$(this).parent().attr("data");
        	$.ajax({
        		url:"/admin/delReply?id="+id,
        		async:false,
        		cache:false,
        		success:function(data){
                    if(data.status) {
                        alert('删除成功');
                        location.reload();
                    }else {
                        alert('删除失败');
                    }
        		}
        	});
        });
    }
});
