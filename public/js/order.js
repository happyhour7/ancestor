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

// 初始化定制数据
$("#secret_select_maintype_dropdown").html(current_pindao+'<span class="caret"></span>');
$('input[name="secretMainType"]').val(current_pindao);
$("#type_ul>li>a").html(current_type+'<span class="caret"></span>');
$('input[name="secretType"]').val(current_type);
$("#subtype_ul>li>a").html(current_subtype+'<span class="caret"></span>');
$('input[name="secretSubType"]').val(current_subtype);
$("#grandsubtype_ul>li>a").html(current_grandsubtype+'<span class="caret"></span>');
$('input[name="secretGrandSubType"]').val(current_grandsubtype);
$('input[name="secretCity"]').val(cityname);
var sex_text = sex ? '男':'女';
$('#secret_othersex_text').html(sex_text+'<span class="caret"></span>');
$('input[name="secretSex"]').val(sex);

$('#secret_otherage_text').html(age+'<span class="caret"></span>');
$('input[name="secretAge"]').val(age);

$('#grandsubtype_label').hide();
eventBind();

// 频道选择列表
$(".select-pindao-subitem").click(function(){
    var text=$(this).text();
    var html="",
        subtype_html = '',
        grandsubtype_html = '';


    $('#grandsubtype_label').show();

    if(text=="WO的秘密")
    {
        html='<li class="dropdown">'+
            '<a id="secrettype_one" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择类型<span class="caret"></span></a>'+
            '<ul id="subtype-ul" class="dropdown-menu" aria-labelledby="drop1">'+
                "<li><a class='select-item' data-src='type' target='woai'>我爱</a></li>"+
                "<li><a class='select-item' data-src='type' target='wohen'>我恨</a></li>"+
                "<li><a class='select-item' data-src='type' target='woxiang'>我想</a></li>"+
                "<li><a class='select-item' data-src='type' target='wozuoguo'>我做过</a></li>"+
                "<li><a class='select-item' data-src='type' target='woxihuanzuo'>我喜欢做</a></li>"+
                "<li><a class='select-item' data-src='type' target='wozuijin'>我最近</a></li>"+
                "<li><a class='select-item' data-src='type' target='guaipi'>怪癖</a></li>"+
                "<li><a class='select-item' data-src='type' target='typeqita'>其他</a></li>"+
                '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="secret_select_subtype_dropdown" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1" id="mine-sub-select-ul">'+
            '</ul></li>';
        $('#grandsubtype_label').hide();
    }
    else if(text=="TA的秘密")
    {
        html='<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 私人秘密<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
            "<li><a class='select-item' data-src='tatype' target='sirenmimi'>私人秘密</a></li>"+
            "<li><a class='select-item' data-src='tatype' target='shangjiamimi'>商家秘密</a></li>"+
            '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1" id="ta_subtype_ul">'+
                '<li><a class="select-subitem" href="#">亲人</a></li>'+
                '<li><a class="select-subitem" href="#">爱人</a></li>'+
                '<li><a class="select-subitem" href="#">同学</a></li>'+
                '<li><a class="select-subitem" href="#">老师</a></li>'+
                '<li><a class="select-subitem" href="#">学生</a></li>'+
                '<li><a class="select-subitem" href="#">上司</a></li>'+
                '<li><a class="select-subitem" href="#">下属</a></li>'+
                '<li><a class="select-subitem" href="#">同事</a></li>'+
                '<li><a class="select-subitem" href="#">客户</a></li>'+
                '<li><a class="select-subitem" href="#">邻居</a></li>'+
                '<li><a class="select-subitem" href="#">朋友</a></li>'+
                '<li><a class="select-subitem" href="#">名人</a></li>'+
                '<li><a class="select-subitem" href="#">司机</a></li>'+
                '<li><a class="select-subitem" href="#">服务商</a></li>'+
                '<li><a class="select-subitem" href="#">其他</a></li>'+
            '</ul></li>';
        grandsubtype_html = '<li class="dropdown">'+
                '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择孙类型<span class="caret"></span></a>'+
                '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                    '<li><a href="#">忠贞</a></li>'+
                    '<li><a href="#">品德</a></li>'+
                    '<li><a href="#">怪癖</a></li>'+
                    '<li><a href="#">能力</a></li>'+
                    '<li><a href="#">身体</a></li>'+
                    '<li><a href="#">婚姻</a></li>'+
                    '<li><a href="#">隐私</a></li>'+
                    '<li><a href="#">其他</a></li>'+
                '</ul></li>';
    }
    else if(text=="出售秘密")
    {
        html='<li class="dropdown">'+
            '<a id="secrettype_one" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">私人秘密<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-item" data-src="selltype" id="sell-secret-bus-personal-ul">商家秘密</a></li>'+
                '<li><a class="select-item" data-src="selltype" id="sell-secret-personal-personal-ul">私人秘密</a></li>'+
            '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a href="#" class="select-subitem" name="secretSubType">本人</a></li>'+
            '</ul></li>';
        grandsubtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择孙类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-subitem" name="secretGrandSubType">经验</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">教训</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">技能</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">经历</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">其他</a></li>'+
            '</ul></li>';
    }
    else if(text=="悬赏秘密")
    {
        html='<li class="dropdown">'+
            '<a id="secrettype_one" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">私人秘密<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a data-src="selltype" id="offser-secret-personal-bus-li">商家秘密</a></li>'+
                '<li><a data-src="selltype" id="offser-secret-personal-personal-li">私人秘密</a></li>'+
            '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-subitem" name="secretSubType">亲人</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">爱人</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">同学</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">老师</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">学生</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">上司</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">下属</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">同事</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">客户</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">邻居</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">朋友</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">名人</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">司机</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">服务商</a></li>'+
                '<li><a class="select-subitem" name="secretSubType">其他</a></li>'+
            '</ul></li>';
        grandsubtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择孙类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-subitem" name="secretGrandSubType">忠贞</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">品德</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">怪癖</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">能力</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">身体</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">婚姻</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">隐私</a></li>'+
                '<li><a class="select-subitem" name="secretGrandSubType">其他</a></li>'+
            '</ul></li>';
    }

    $('#type_ul').html(html);
    $('#subtype_ul').html(subtype_html);
    $('#grandsubtype_ul').html(grandsubtype_html);
    eventBind();

    $('#secret_select_maintype_dropdown').html(text+"<span class='caret'></span>");
    $("#current_choosen_type").val(text);
});


function eventBind(){

    // 类型到子类型联动效果
    $(".select-item").on("click",function(){
        var html="";
        var i;

        $("#secretType_hidden").val($(this).text());

        $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");

        var target = $(this).attr('target');
        var pindao = $(this).attr('data-src');
        var subtype = dataDIc[pindao][target];

        if(subtype){
            for(i in subtype)
            {
                if(i == 'children')
                    continue;
                var subtype_name = subtype[i];
                html+='<li><a';
                if(target === 'shangjiamimi') {
                    html+=' target="'+i+'"';
                    subtype_name = subtype_name.text;
                }

                html+=" class='select-subitem' data-type='"+target+"' data-src='"+pindao+"'>"+subtype_name+"</a></li>";
            }
        }

        $('#subtype_ul>li>a').html("选择子类型<span class='caret'></span>");
        $('#subtype_ul ul').html(html);
        eventBind();
    });

    // 子类型到孙类型联动效果
    $(".select-subitem").on("click",function(){
        var html="";
        var i;

        $('#secretSubType_hidden').val($(this).text());

        $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");

        var target = $(this).attr('target');
        var pindao = $(this).attr('data-src');
        var leixing = $(this).attr('data-type');
        var grandsubtype = dataDIc[pindao][leixing]['children'];
        if(target){
            grandsubtype = dataDIc[pindao][leixing][target]['children'];
        }
        
        if(grandsubtype){
            for(i in grandsubtype)
            {
                html+="<li><a class='select-grandsubitem' name='secretGrandSubType'>"+grandsubtype[i]+"</a></li>";
            }
        }

        $('#grandsubtype_ul>li>a').html("选择孙类型<span class='caret'></span>");
        $('#grandsubtype_ul ul').html(html);
        eventBind();
    });

    // 孙类型选择事件
    $(".select-grandsubitem").on("click",function(){
        $('#secretGrandSubType_hidden').val($(this).text());

        $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
    });
}

// 性别，年龄选择事件
$('.select-subitem-other').on('click', function(){
    var name=$(this).attr("name");
    var value = $(this).text();

    if(name === 'secretSex'){
        value = $(this).attr('data-val');
    }
    $("#"+name+"_hidden").val(value);

    $(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
});

$("#secret_order_post_button").click(function(){

    $("#secret_order_submit_button").trigger("click");
});

// 提交定制验证
function orderValidate(){

    var secretType=$("#secretType_hidden").val();
    var secretSubType=$('#secretSubType_hidden').val();
    var secretGrandSubType=$('#secretGrandSubType_hidden').val();
    var pingdao=$('#current_choosen_type').val();
    var cityname=$('input[name="secretCity"]').val();
    var sex=$('input[name="secretSex"]').val();
    var age=$('input[name="secretAge"]').val();
    

    if($.trim(secretType)=="")
    {
        alert("请选择类型");
        return false;
    }
    if($.trim(secretSubType)=="")
    {
        alert("请选择子类型");
        return false;
    }

    if($.trim(cityname)=="")
    {
        alert("请输入城市");
        return false;
    }
    if(age&&$.trim(age).indexOf("年龄")>=0){
        alert("请选择年龄");
        return false;
    }
    if(sex==''){
        alert("请选择性别");
        return false;
    }

    return true;
}

// 添加定制提交事件
$("#secret_order_post_button").click(function(){
    if($("#hasLogin_hidden").val()=="no")
    {
        $("#login-area").trigger("click");
        return;
    }

    if(orderValidate()!==false)
    {
        $("#order_form").submit();
    }
});

// 定制删除事件
$(".order-del-button").click(function(){
    var id=$(this).attr("data");
    var _that=this;
    if(confirm("确认删除该秘密吗？"))
    {
        $.ajax({
            url:"/secret/orderdealdel?id="+id,
            async:false,
            cache:false,
            success:function(data){
                $(_that).parent().parent().remove();
            }
        });
    }
    
});