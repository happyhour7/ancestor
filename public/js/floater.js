Handlebars.registerHelper('ifCond', function(v1, v2, options) {
  if(v1 == v2) {
    return options.fn(this);
  }
  return options.inverse(this);
});

var floaterPage={
    floaterValidate: function(){// 扔漂流瓶验证

        /*var cityname=$("#secret_city_text").val();
        var otherage=$('#secret_otherage_text').text();
        var othersex=$('#othersex_hidden').val();
        var keyword=$('#secretKeyWord_text').val();
        

        if($.trim(cityname)=="")
        {
            alert("请输入目的城市");
            return false;
        }
        if(otherage&&$.trim(otherage).indexOf("年龄")>=0){
            alert("请选择年龄");
            return false;
        }
        if(othersex==''){
            alert("请选择性别");
            return false;
        }
        if($.trim(keyword)=="")
        {
            alert("请输入标签");
            return false;
        }*/

        var content=$('#secrect-content').val();
        if($.trim(content)=="")
        {
            alert("请输入内容");
            return false;
        }

        return true;
    },
    load:function(){
        var currentChoosenSex={};
        $(".user-sex-icon").css({
            'filter':'alpha(opacity=10)',
            '-moz-opacity':'0.1',
            'opacity':'0.1'
        })
        .on({
            "click":function(){
                var name=$(this).attr("name");
                $("span[name='"+name+"']").css({
                    'filter':'alpha(opacity=10)',
                    '-moz-opacity':'0.1',
                    'opacity':'0.1'
                });
                $(this).css({
                     'filter':'alpha(opacity=100)',
                    '-moz-opacity':'1',
                    'opacity':'1'
                });
                currentChoosenSex[name]={};
                currentChoosenSex[name]["choosen"]=$(this).attr("id");

                var target=$(this).attr("target");
                if(target)
                {
                    $("#"+target).val($(this).attr("value"));
                }
            },
            "mouseover":function(){
                $(this).css({
                     'filter':'alpha(opacity=100)',
                    '-moz-opacity':'1',
                    'opacity':'1'
                });
            },
            "mouseout":function(){
                
                var name=$(this).attr("name");
                if(currentChoosenSex[name]&&currentChoosenSex[name]["choosen"]!=$(this).attr("id"))
                {
                    $(this).css({
                        'filter':'alpha(opacity=10)',
                        '-moz-opacity':'0.1',
                        'opacity':'0.1'
                    });
                }
                
            }
        });

        // 获取漂流瓶的回复
        $(".floater-comment-button").on("click",function(){
            var parents=$("#secret-body-container-"+$(this).attr("data"));
            if(parents.find(".comment-title-bar")[0]!=null)
            {
                return false;
            }
            $.ajax({
                url:"/secret/floaterComments?id="+$(this).attr("data"),
                async:false,
                cache:false,
                success:function(data){
                    var source=$("#secretComment-temple").html();
                    var template=Handlebars.compile(source);
                    var html=template(data);
                    parents.append(html.replace(/评论/g, '回应'));
                    $(".comment-title-bar").unbind().click(function(){
                        $(this).parent().remove();
                    });
                }
            });
        });

        // 默认打开评论
        $('.floater-comment-button').trigger('click');

        // 捞捞看
        $('#profile .salvage-button').click(function() {
            if($("#hasLogin_hidden").val()=="no")
            {// 未登录，则显示登录提示框
                $("#login-area").trigger("click");
                return false;
            }

            var _that=this;
            $.ajax({
                url:"/secret/floater/try",
                async:false,
                cache:false,
                success:function(data){
                    if(data.error){
                        alert(data.error);
                        return;
                    }
                    var template = Handlebars.compile($('#floaters_try').html());
                    $('#floaters_list').empty().append(template(data));

                    // 激活回复框事件
                    $(".secrect-comment-area").focus(function(){
                        $(this).height(90);
                        $(this).parent().parent().height(100);
                    }).blur(function(){
                        $(this).height(25);
                        $(this).parent().parent().height(25);
                    });

                    // 提交漂流瓶回复
                    $(".floater-replay-button").click(function(){
                        if($("#hasLogin_hidden").val()=="no")
                        {
                            $("#login-area").trigger("click");
                            return;
                        }   
                        var text=$(this).prev().find(".secrect-comment-area").val();
                        var currentTime=(new Date()).format('yyyy-MM-dd hh:mm:ss');
                        $.ajax({
                            url: '/secret/floater/reply',
                            cache: false,
                            dataType:"json",
                            type: 'POST',
                            data: {
                                content: text,
                                filedid: $(this).prev().find('input[name="filedid"]').val(),
                                replayTime: currentTime
                            },
                            success: function(data) {
                                if(data.error) {
                                    alert(data.error);
                                    return;
                                }
                                replaySuccess();
                            }
                        });
                    });
                }
            });
        });
    
        // 扔漂流瓶事件
        $("#floater_post_button").click(function(){
            if($("#hasLogin_hidden").val()=="no")
            {
                $("#login-area").trigger("click");
                return;
            }

            if(floaterPage.floaterValidate()!==false)
            {
                $("#secretMainType_hidden").val('漂流瓶');
                $("#secretDate_hidden").val((new Date()).format('yyyy-MM-dd'));
                $("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
                if($('#otherage_hidden').val() == '选择年龄') {
                    $('#otherage_hidden').val('');
                }
                
                $("#floater_form").submit();
            }
        });

        // 漂流瓶删除事件
        $(".floater-del-button").click(function(){
            var id=$(this).attr("data");
            var _that=this;
            if(confirm("确认删除该漂流瓶吗？"))
            {
                $.ajax({
                    url:"/secret/floaterdel?id="+id,
                    async:false,
                    cache:false,
                    success:function(data){
                        $(_that).parent().parent().remove();
                    }
                });
            }
            
        });

        // 回复漂流瓶
        // 提交漂流瓶回复
        $(".floater-replay-button").click(function(){
            if($("#hasLogin_hidden").val()=="no")
            {
                $("#login-area").trigger("click");
                return;
            }   
            var text=$(this).prev().find(".secrect-comment-area").val();
            var currentTime=(new Date()).format('yyyy-MM-dd hh:mm:ss');
            $.ajax({
                url: '/secret/floater/reply',
                cache: false,
                dataType:"json",
                type: 'POST',
                data: {
                    content: text,
                    filedid: $(this).prev().find('input[name="filedid"]').val(),
                    replayTime: currentTime
                },
                success: function(data) {
                    if(data.error) {
                        alert(data.error);
                        return;
                    }
                    replaySuccess();
                }
            });
        });
    }
};
window.onload=floaterPage.load();
