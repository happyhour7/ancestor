var dataDIc={
    type:{
        wozuoguo:['人','物','事','其他'],
        wozuijin:['人','物','事','其他'],
        woai:['人','物','事','其他'],
        woxihuanzuo:['人','物','事','其他'],
        woxiang:['人','物','事','其他'],
        wohen:['人','物','事','其他'],
        typeqita:['人','物','事','其他']
    },
    replayType:{
        'gongkai':'公开',
        'huifukejian':'回复可见',
        'haoyoukejian':'好友可见',
        'zijikejian':'自己可见'
    },
    orderType:{
        'qiuzan':'求赞',
        'qiuyue':'求约',
        'qiumaxing':'求骂',
        'qiuzhu':'求助',
        'qiukaidao':'其他'
    },
    tatype:{
        sirenmimi:{
            mingren:"名人",
            jiaren:"家人",
            qinren:"亲人",
            lianren:"恋人",
            laoshi:"老师",
            tongxue:"同学",
            tongshi:"同事",
            pengyou:"朋友",
            kehu :"客户",
            linju:"邻居",
            qita:"其他",
            children:['隐私','其他']
        },
        shangjiamimi:{
            canguan:{
                text:"服饰",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            jiudian:{
                text:"饮食",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            kafeiguan:{
                text:"旅店",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            jiuzhuang:{
                text:"交通",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            shangchao:{
                text:"医疗",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            jiayouzhan:{
                text:"旅游",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            qixiuchang:{
                text:"商超",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            yiyuan:{
                text:"服务",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            gongsi:{
                text:"中介",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            shangpu:{
                text:"网站",
                children:['材料','价格','质量','信誉','便利','其他']
            },
            qita:{
                text:"其他",
                children:['材料','价格','质量','信誉','便利','其他']
            }
        }
    },
    selltype:{
        sirenmimi:{
            benren:"本人",
            children:['私密','其他']
        }
    }
};

$(".order-title").click(function(){
    $("#order-oirder-container").toggle();
});

// 初始化定制数据
$("#secret_select_maintype_dropdown").html(current_pindao+'<span class="caret"></span>');
$('input[name="secretMainType"]').val(current_pindao!='选择频道'?current_pindao:'');
$("#type_ul>li>a").html(current_type+'<span class="caret"></span>');
$('input[name="secretType"]').val(current_type!='选择类型'?current_type:'');
$("#subtype_ul>li>a").html(current_subtype+'<span class="caret"></span>');
$('input[name="secretSubType"]').val(current_subtype!='选择子类型'?current_subtype:'');
$("#grandsubtype_ul>li>a").html(current_grandsubtype+'<span class="caret"></span>');
$('input[name="secretGrandSubType"]').val(current_grandsubtype!='选择孙类型'?current_grandsubtype:'');
$('input[name="secretCity"]').val(cityname);
var sex_text = '选择性别';
if(sex == 1) {
    sex_text = '男';
}else if(sex == 2) {
    sex_text = '女';
}
$('#secret_othersex_text').html(sex_text+'<span class="caret"></span>');
$('input[name="secretSex"]').val(sex);

$('#secret_otherage_text').html(age+'<span class="caret"></span>');
$('input[name="secretAge"]').val(age!='选择年龄'?age:'');

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
                '<li><a class="select-item" data-type="" data-src="">选择类型</a></li>'+
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
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-item" target="" data-src="">选择类型</a></li>'+
                "<li><a class='select-item' data-src='tatype' target='sirenmimi'>私人的</a></li>"+
                "<li><a class='select-item' data-src='tatype' target='shangjiamimi'>组织的</a></li>"+
            '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1" id="ta_subtype_ul">'+
            '</ul></li>';
        grandsubtype_html = '<li class="dropdown">'+
                '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择孙类型<span class="caret"></span></a>'+
                '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '</ul></li>';
    }
    else if(text=="出售秘密")
    {
        html='<li class="dropdown">'+
            '<a id="secrettype_one" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-item" target="" data-src="">选择类型</a></li>'+
                '<li><a class="select-item" data-src="selltype" target="sirenmimi">私人的</a></li>'+
                '<li><a class="select-item" data-src="selltype" target="shangjiamimi">组织的</a></li>'+
            '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
            '</ul></li>';
        grandsubtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择孙类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
            '</ul></li>';
    }
    else if(text=="悬赏秘密")
    {
        html='<li class="dropdown">'+
            '<a id="secrettype_one" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
                '<li><a class="select-item" target="" data-src="">选择类型</a></li>'+
                '<li><a class="select-item" data-src="selltype" target="sirenmimi">私人的</a></li>'+
                '<li><a class="select-item" data-src="selltype" target="shangjiamimi">组织的</a></li>'+
            '</ul></li>';
        subtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择子类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
            '</ul></li>';
        grandsubtype_html = '<li class="dropdown">'+
            '<a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选择孙类型<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" aria-labelledby="drop1">'+
            '</ul></li>';
    }

    $('#type_ul').html(html);
    $('#subtype_ul').html(subtype_html);
    $('#grandsubtype_ul').html(grandsubtype_html);
    eventBind();

    $('#secret_select_maintype_dropdown').html(text+"<span class='caret'></span>");
    $("#current_choosen_type").val(text!='选择频道'?text:'');
});


function eventBind(){

    // 类型到子类型联动效果
    $(".select-item").on("click",function(){
        if($(this).text() == '选择类型'){
            $('#type_ul>li>a').html("选择类型<span class='caret'></span>");
            $('#secretType_hidden').val('');
            return;
        }else{
            $("#secretType_hidden").val($(this).text());
        }

        var html='<li><a class="select-subitem" data-type="" data-src="">选择子类型</a></li>';
        var i;

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
        $('#secretSubType_hidden').val('');

        $('#subtype_ul ul').html(html);
        eventBind();
    });

    // 子类型到孙类型联动效果
    $(".select-subitem").on("click",function(){

        if($(this).text() == '选择子类型'){
            $('#subtype_ul>li>a').html("选择子类型<span class='caret'></span>");
            $('#secretSubType_hidden').val('');
            return;
        }else{
            $('#secretSubType_hidden').val($(this).text());
        }

        var html='<li><a class="select-grandsubitem" name="secretGrandSubType">选择孙类型</a></li>';
        var i;

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
        $('#secretGrandSubType_hidden').val('');

        $('#grandsubtype_ul ul').html(html);
        eventBind();
    });

    // 孙类型选择事件
    $(".select-grandsubitem").on("click",function(){
        if($(this).text() == '选择孙类型'){
            $('#grandsubtype_ul>li>a').html("选择孙类型<span class='caret'></span>");
            $('#secretGrandSubType_hidden').val('');
            return;
        }else{
            $('#secretGrandSubType_hidden').val($(this).text());
        }

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
    $("#"+name+"_hidden").val(value != '选择年龄'?value:'');

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
    

    /*if($.trim(secretType)=="")
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
    }*/

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