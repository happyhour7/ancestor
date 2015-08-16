var dataDIc={
    type:{
        woai:['亲情','爱情','友情','师生情','暗恋','同性','其他'],
        wohen:['亲人','爱人','老师','同学','上司','同事','亲戚','邻居','其他'],
        woxiang:['恋爱','破处','做爱','骂人','大人','犯罪','结婚','离婚','自杀','出轨','其他'],
        wozuoguo:['欺骗','造谣','背叛','犯罪','堕胎','卖身','小三','偷窃','恶作剧','性骚扰','其他'],
        woxihuanzuo:['做饭','做爱','暧昧','吃货','419','偷窃','恶作剧','性骚扰','其他'],
        wozuijin:['开心','苦恼','怀疑','失落','抑郁','兴奋','无聊','出差','其他'],
        guaipi:['洁癖','异装癖','露阴癖','窥阴癖','嗜痂癖','性瘾','SM','无聊','自慰','其他'],
        typeqita:['其他']
    },
    replayType:{
        'gongkai':'公开',
        'huifukejian':'回复可见',
        'haoyoukejian':'好友可见',
        'zijikejian':'自己可见'
    },
    orderType:{
        'qiuzhufu':'求祝福',
        'qiuzhidian':'求指点',
        'qiumaxing':'求骂醒',
        'qiuzhiliao':'求治疗',
        'qiuzhu':'求助',
        'qiuanwei':'求安慰',
        'qiuguli':'求鼓励',
        'qiukaidao':'求开导',
        'qiuyue':'求约',
        'qiuzan':'求赞'
    },
    tatype:{
        sirenmimi:{
            qinren:"亲人",
            airen:"爱人",
            tongxue:"同学",
            laoshi:"老师",
            xuesheng:"学生",
            shangsi:"上司",
            xiashu:"下属",
            tongshi:"同事",
            kehu :"客户",
            linju:"邻居",
            pengyou:"朋友",
            mingren:"名人",
            siji:"司机",
            fuwushang:"服务商",
            qita:"其他",
            children:['偷情约炮','性骚扰','怪癖','卑鄙伎俩','买春卖春','偷窃剽窃','婚姻状态','身体密码','说谎欺骗','奇葩行为']
        },
        shangjiamimi:{
            canguan:{
                text:"餐馆",
                children:['材料','卫生','其他']
            },
            jiudian:{
                text:"酒店",
                children:['卫生','特殊服务','其他']
            },
            kafeiguan:{
                text:"咖啡馆",
                children:['真假','其他']
            },
            jiuzhuang:{
                text:"酒庄",
                children:['真假','其他']
            },
            shangchao:{
                text:"商超",
                children:['真假','其他']
            },
            jiayouzhan:{
                text:"加油站",
                children:['质数量','价格','其他']
            },
            qixiuchang:{
                text:"汽修厂",
                children:['诚信','技术','速度','价格','其他']
            },
            yiyuan:{
                text:"医院",
                children:['医术','医德','护士','价格','卫生','其他']
            },
            gongsi:{
                text:"公司",
                children:['骗子公司','黑中介','活少钱多','老板变态','其他']
            },
            shangpu:{
                text:"商铺",
                children:['真假','其他']
            },
            qita:{
                text:"其他",
                children:['真假','其他']
            }
        }
    },
    selltype:{
        sirenmimi:{
            benren:"本人",
            children:['经验','教训','技能','经历','其他']
        }
    }
}

$(".order-title").click(function(){
    $("#order-oirder-container").toggle();
});

$(".select-subitem-kind").click(function(){
    var text=$(this).text();
    var html="";
    if(text=="WO的秘密")
    {
        html="<li><a class='select-subitem select-subitem-subkind' data='woai' target='secretType'>我爱</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='wohen' target='secretType'>我恨</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='woxiang' target='secretType'>我想</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='wozuoguo' target='secretType'>我做过</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='woxihuanzuo' target='secretType'>我喜欢做</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='wozuijin' target='secretType'>我最近</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='guaipi' target='secretType'>怪癖</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' data='typeqita' target='secretType'>其他</a></li>";
        $("#subtype-ul").html(html);
        eventBind();
    }
    else if(text=="TA的秘密")
    {
        html="<li><a class='select-subitem select-subitem-subkind' target='secretType'>私人秘密</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' target='secretType'>商家秘密</a></li>";

        $("#subtype-ul").html(html);
        eventBind();
    }
    else if(text=="出售秘密")
    {
        html="<li><a class='select-subitem select-subitem-subkind select-sellsubitem-subkind' target='secretType'>私人秘密</a></li>";

        $("#subtype-ul").html(html);
        eventBind();
    }
    else if(text=="悬赏秘密")
    {
        html="<li><a class='select-subitem select-subitem-subkind' target='secretType'>私人秘密</a></li>"+
                "<li><a class='select-subitem select-subitem-subkind' target='secretType'>商家秘密</a></li>";
        $("#subtype-ul").html(html);
        eventBind();
    }
});
eventBind();
function eventBind(){
    $(".select-subitem-subkind").unbind().click(function(){
        var text=$.trim($("#secret_select_maintype_dropdown").text());
        var html="";
        if(text=="WO的秘密")
        {

            var targetData=dataDIc.type[$(this).attr("data")];
            console.dir(targetData);
            for(var i=0;i<targetData.length;i++)
            {
                html+="<li><a class='select-subitem select-grandsubitem-subkind' data='' target='secretSubType'>"+targetData[i]+"</a></li>"
            }
        }
        else
        {

            if($(this).text()=="私人秘密")
            {
                var targetData=dataDIc.tatype.sirenmimi;
                for(var key in targetData)
                {
                    if(key!=="children")
                    {
                        html+="<li><a class='select-subitem' data='sirenmimi."+key+"' target='secretSubType'>"+targetData[key]+"</a></li>";
                    }
                    else
                    {
                        var children=targetData[key];
                        var _html="";
                        for(var i=0;i<children.length;i++)
                        {
                            _html+="<li><a class='select-subitem select-grandsubitem-subkind'  data='sirenmimi."+key+"' target='secretGrandSubType'>"+children[i]+"</a></li>";
                        }
                        $("#secretGrandSubType_select").html(_html);
                    }
                    
                }
                
            }
            else
            {
                var targetData=dataDIc.tatype.shangjiamimi;
                for(var key in targetData)
                {
                    if(key!="children")
                    {
                        html+="<li><a class='select-subitem select-grandsubitem-subkind'  data='shangjiamimi."+key+"' target='secretSubType'>"+targetData[key].text+"</a></li>";
                    }
                    else
                    {
                        var children=targetData[key];
                        var _html="";
                        for(var i=0;i<children.length;i++)
                        {
                            _html+="<li><a class='select-subitem' target='secretGrandSubType'>"+children[i]+"</a></li>";
                        }
                        $("#secretGrandSubType_select").html(_html);
                    }
                    
                }
                
            }

        }
        $("#sub-subtype-ul").html(html);
        eventBind();
    });


    $(".select-maintype-kind").click(function(){
        if($.trim($(this).text())=="WO的秘密"){
            $("#secrettype_one").text("私人秘密");
            $("#secret_select_subtype_dropdown").text("亲情");
        }
        else if($.trim($(this).text())=="TA的秘密"){
            $("#secrettype_one").text("私人秘密");
            $("#secret_select_subtype_dropdown").text("亲人");
            $("#secret_select_grandtype_dropdown").text("偷情约炮");
        }
        else if($.trim($(this).text())=="出售秘密"){
            $("#secrettype_one").text("私人秘密");
            $("#secret_select_subtype_dropdown").text("本人");
            $("#secret_select_grandtype_dropdown").text("经验");
        }
        else if($.trim($(this).text())=="悬赏秘密"){
            $("#secrettype_one").text("私人秘密");
            $("#secret_select_subtype_dropdown").text("亲情");
            $("#secret_select_grandtype_dropdown").text("偷情约炮");
        }
    });
    $(".select-grandsubitem-subkind").click(function(){
        var targetData={};
        var data=$(this).attr("data");
        try
        {
            targetData=dataDIc.tatype[data.split('.')[0]][data.split('.')[1]];
            
            /*for(var key in targetData)
            {
                var children=targetData["children"];
                var _html="";
                for(var i=0;i<children.length;i++)
                {
                    _html+="<li><a class='select-subitem' target='secretGrandSubType'>"+children[i]+"</a></li>";
                }
            }*/
           // $("#secretGrandSubType_select").html(_html);
            $(".select-subitem").on("click",function(){
                var name=$(this).attr("name");
                $("#"+name+"_hidden").val($(this).text());
                $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
            });
        }catch(e){}
    });

    $(".select-sellsubitem-subkind").click(function(){
        var targetData=dataDIc.selltype;
        var data=$(this).attr("data");

        var children=targetData["sirenmimi"]["children"];
        var _html="<li><a class='select-subitem select-grandsubitem-subkind' target='secretSubType'>本人</a></li>";


        $("#sub-subtype-ul").html(_html);
        var html="";
        for(var i=0;i<children.length;i++)
        {
            html+="<li><a class='select-subitem' target='secretGrandSubType'>"+children[i]+"</a></li>";
        }

        $("#secretGrandSubType_select").html(html);
        $(".select-subitem").on("click",function(){
            var name=$(this).attr("name");
            $("#"+name+"_hidden").val($(this).text());
            $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
        });
    });

    $(".mine-type-choose").click(function(){
        var datats=dataDIc.type[$(this).attr("data")];

        var _html="";
        for(var i=0;i<datats.length;i++)
        {
            _html+="<li><a class='select-subitem select-grandsubitem-subkind' target='secretGrandSubType'>"+datats[i]+"</a></li>";
        }
        $("#sub-subtype-ul").html(_html);
        $(".select-subitem").on("click",function(){
            var name=$(this).attr("name");
            $("#"+name+"_hidden").val($(this).text());
            $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
        });
    });
    $(".select-subitem").on("click",function(){
            var name=$(this).attr("name");
            $("#"+name+"_hidden").val($(this).text());
            $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
    });
}

$("#secret_order_post_button").click(function(){

    $("#secret_order_submit_button").trigger("click");
});