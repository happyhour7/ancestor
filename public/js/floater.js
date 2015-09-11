var floaterPage={
    floaterValidate: function(){// 扔漂流瓶验证

        var cityname=$("#secret_city_text").val();
        var otherage=$('#secret_otherage_text').text();
        var othersex=$('#othersex_hidden').val();
        var keyword=$('#secretKeyWord_text').val();
        var content=$('#secrect-content').val();
        

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
            alert("请输入关键字");
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
                    console.log(target);
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
                $("#floater_form").submit();
            }
        });
    }
};
window.onload=floaterPage.load();