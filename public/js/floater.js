Date.prototype.format = function(format){ 
    var o = { 
        "M+" : this.getMonth()+1, //month 
        "d+" : this.getDate(), //day 
        "h+" : this.getHours(), //hour 
        "m+" : this.getMinutes(), //minute 
        "s+" : this.getSeconds(), //second 
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter 
        "S" : this.getMilliseconds() //millisecond 
    } 

    if(/(y+)/.test(format)) { 
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    } 

    for(var k in o) { 
        if(new RegExp("("+ k +")").test(format)) { 
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
        } 
    } 
    return format; 
} 
var floaterPage={
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
            $("#secretDate_shidden").val((new Date()).format("yyyy-MM-dd hh:mm"));
            $("#floater_submit_button").trigger("click");
        });
    }
};
window.onload=floaterPage.load();