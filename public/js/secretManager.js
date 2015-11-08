$.ajax({
    url:"/admin/getSecrets",
    async:false,
    cache:false,
    success:function(data){
        var html="<tr>"+
                "<td><<index>></td>"+
                "<td><<secretMainType>></td>"+
                "<td><<secretType>></td>"+
                "<td><<secretSubType>></td>"+
                "<td><<secretGrandSubType>></td>"+
                "<td><<secretTitle>></td>"+
                "<td><<owner>></td>"+
                "<td data='<<Id>>'><button class='btn btn-danger btn-secret-noReply' style='width:80px;margin:10px;line-height:10px;padding:5px;' data-reply='<<noReplyStatus>>'><<noReply>>回复</button><button class='btn btn-danger btn-advuser-del' style='width:80px;margin:10px;line-height:10px;padding:5px;'>删除</button></td>"+
                "</tr>";
        var result="";

        for(var i=0;i<data.length;i++)
        {
            var tmp=data[i];

            result+=html.replace("<<index>>",i+1)
                            .replace("<<secretMainType>>",tmp.secretMainType)
                            .replace("<<secretType>>",tmp.secretType)
                            .replace("<<secretSubType>>",tmp.secretSubType)
                            .replace("<<secretGrandSubType>>",tmp.secretGrandSubType)
                            .replace("<<secretTitle>>",tmp.secretTitle ? tmp.secretTitle.substr(0, 18) : '')
                            .replace("<<owner>>",tmp.owner)
                            .replace("<<noReplyStatus>>",tmp.noReply)
                            .replace("<<noReply>>",tmp.noReply ? '开启' : '关闭')
                            .replace("<<Id>>",tmp.Id);
        }
        $("#advuser-table-tbody").html(result);
        $(".btn-secret-noReply").click(function(){
            var id=$(this).parent().attr("data"),
                noReply = $(this).attr('data-reply');
            $.ajax({
                url:"/admin/setNoReply",
                type: 'post',
                data: {
                    id: id,
                    noReply: noReply
                },
                async:false,
                cache:false,
                success:function(data){
                    if(data.status) {
                        alert('设置成功');
                        location.reload();
                    }else {
                        alert('设置失败');
                    }
                }
            });
        });
        $(".btn-advuser-del").click(function(){
        	var id=$(this).parent().attr("data");
        	$.ajax({
        		url:"/admin/delSecret?id="+id,
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
