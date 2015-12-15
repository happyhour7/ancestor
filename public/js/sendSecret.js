var page={
	onload:function(){

		$("#current_choosen_type").html("WO的秘密");
		page.eventBind();
		$(".select-subitem").on("click",function(){
			var name=$(this).attr("name");
			$("#"+name+"_hidden").val($(this).text());
			console.dir($("#"+name+"_hidden"));
			$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
		});
		$("#mine_secret").click(function(){
			$("#current_choosen_type").html("WO的秘密");
			$("#secret-container").html($("#mysecretbody_script").html());
			page.eventBind();
		});

		$("#ta_secret").click(function(){
			$("#current_choosen_type").html("TA的秘密");
			$("#secret-container").html($("#tasecretbody_per_script").html());
			page.eventBind();
		});

		$("#sell_secret").click(function(){
			$("#current_choosen_type").html("出售秘密");
			$("#secret-container").html($("#sellsecretbody_script").html());
			page.eventBind();
		});

		$("#order_secret").click(function(){
			$("#current_choosen_type").html("悬赏秘密");
			$("#secret-container").html($("#offersecretbody_script").html());
			page.eventBind();
		});

		/*$("#floater_secret").click(function(){
			$("#current_choosen_type").html("漂流瓶");
		});*/


	},
	showDialog:function(){
		var background=$("<div/>").css({
			position:"fixed",
			top:0,
			left:0,
			width:'100%',
			height:'100%',
			background:'#000',
			'filter':'alpha(opacity=50)',
			'-moz-opacity':'0.5', 
			'-khtml-opacity': '0.5',  
			'opacity': '0.5',  
			'z-index':18
		}).attr("id","system-background").appendTo("body");
	},
	eventBind:function(){
		$(".mine-type-choose").on("click",function(){
			var datas=dataDIc["type"];
			var result=datas[$(this).attr("target")];
			var html="";


			if(result){
				for(var i=0;i<result.length;i++)
				{
					html+="<li><a class='select-subitem  sub-type-choose' name='secretSubType'>"+result[i]+"</a></li>";
				}
			}
			$("#mine-sub-select-ul").html(html);
			$("#secretType").val($(this).text());
			$(".select-subitem").on("click",function(){
				var name=$(this).attr("name");
				$("#"+name+"_hidden").val($(this).text());
				$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
			});
			$(".sub-type-choose").on('click',function(){
				$("#secretSubType").html();
			});

			$(".sub-type-choose").on('click',function(){
				$("#secretSubType").html();
			});
		});
		$(".secret-limit-choose").on('click',function(){
			var text=$(this).text();

			$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");

			if(text=="公开"){
				$("#secretLimit_hidden").val("1");
			}
			else if(text=="回复可见")
			{
				$("#secretLimit_hidden").val("2");
			}
			else if(text=="好友可见")
			{
				$("#secretLimit_hidden").val("3");
			}
			else 
			{
				$("#secretLimit_hidden").val("4");
			}
		});

		$(".select-subitem").on("click",function(){
				var name=$(this).attr("name");
				$("#"+name+"_hidden").val($(this).text());
				$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
			});

		$("#ta-bus-type,#ta-bus-bus-type").on("click",function(){
			$("#secret-container").html($("#tasecretbody_bus_script").html());
			page.eventBind();
		});
		$("#ta-personal-type,#ta-personal-bus-type").on("click",function(){
			$("#secret-container").html($("#tasecretbody_per_script").html());
			page.eventBind();
		});


		$("#sell-secret-personal-personal-ul,#sell-secret-personal-bus-ul").on('click',function(){
			$("#secret-container").html($("#sellsecretbody_script").html());
			page.eventBind();
		});
		$("#sell-secret-bus-personal-ul,#sell-secret-bus-bus-ul").on('click',function(){
			$("#secret-container").html($("#sellsecretbody_buy_script").html());
			page.eventBind();
		});

		$("#offser-secret-personal-bus-li,#offser-secret-bus-bus-li").on("click",function(){
			$("#secret-container").html($("#offersecretbody_buy_script").html());
			page.eventBind();
		});
		$("#offser-secret-personal-personal-li,#offser-secret-bus-personal-li").on("click",function(){
			$("#secret-container").html($("#offersecretbody_script").html());
			page.eventBind();
		});
		$(".secret-hop").on("click",function(){
			$("#secretHope").val();
		});

		$(".ta_bus_subtype_select_item").on('click',function(){
			var subType=$(this).attr("data-src");
			var grandType=dataDIc["tatype"]["shangjiamimi"][subType]["children"];
			var _html="";
			for(var i=0;i<grandType.length;i++)
			{
				_html+="<li><a class='select-subitem' name='secretGrandSubType'>"+grandType[i]+"</a></li>";
			}
			$("#ta-grand-sub-select-ul").html(_html);

				$("#secretType").val($(this).text());
				$(".select-subitem").on("click",function(){
					var name=$(this).attr("name");
					$("#"+name+"_hidden").val($(this).text());
					$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
				});
		});


		$(".sell-subtype-item").on('click',function(){
			var subType=$(this).attr("data-src");
			var grandType=dataDIc["tatype"]["shangjiamimi"][subType]["children"];
			var _html="";
			for(var i=0;i<grandType.length;i++)
			{
				_html+="<li><a class='select-subitem' name='secretGrandSubType'>"+grandType[i]+"</a></li>";
			}
			$("#sell-subgrandtype-ul").html(_html);

				$("#secretType").val($(this).text());
				$(".select-subitem").on("click",function(){
					var name=$(this).attr("name");
					$("#"+name+"_hidden").val($(this).text());
					$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
				});
		});


		/*他的秘密，私人秘密提交按钮*/
        $("#ta_secret_post_button").on('click',function(){
        	if(page.validate()!==false)
        	{
        		$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
        		$("#secretMainType_hidden").val($("#current_choosen_type").text());
	        	//console.log($("#secretMainType_hidden").val());
	        	//console.log($("#current_choosen_type").text());
	            $("#secretType_hidden").val($("#secrettype_one").text());
	            $("#ta_secret_submit_button").trigger("click");
        	}
        	
        });

        $("#bus_secret_pos_button").on('click',function(){
        	if(page.validate()!==false)
        	{
        		$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
	        	$("#secretMainType_hidden").val($("#current_choosen_type").text());
	            $("#secretType_hidden").val($("#secrettype_one").text());
	        	$("#bus_secret_submit_button").trigger("click");
        	}
        });




        $("#sell_secret_post_button").on('click',function(){
        	// 悬赏秘密标价
        	var secretPrice = $('input[name="secretPrice"]').val();
        	console.log(secretPrice);
        	if(secretPrice == '' || secretPrice <0 || secretPrice > 100000){
        		alert('标价必须在0~100000');
        		return false;
        	}
        	
        	$("#secretMainType_hidden").val($("#current_choosen_type").text());

        	$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));

            $("#secretType_hidden").val($("#secrettype_one").text());

        	$("#sell_secret_submit_button").trigger("click");
        });


        	$("#sell_secret_buy_post_button").on('click',function(){
        	$("#secretMainType_hidden").val($("#current_choosen_type").text());
            $("#secretType_hidden").val($("#secrettype_one").text());
        	$("#sell_secret_buy_submit_button").trigger("click");
        });






        $("#offer_secret_post_button").on('click',function(){
        	// 悬赏秘密标价
        	var secretPrice = $('input[name="secretPrice"]').val();
        	if(secretPrice == '' || secretPrice <0 || secretPrice > 100000){
        		alert('标价必须在0~100000');
        		return false;
        	}

        	// 判断用户的蟋蟀腿是否充足
        	$.post('/xishuaitui/check', {
        		secretPrice: secretPrice
        	}, function(data) {
        		if(data.flag) {
    			$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
    			$("#secretMainType_hidden").val($("#current_choosen_type").text());
    			$("#secretType_hidden").val($("#secrettype_one").text());
    			$("#offer_secret_submit_button").trigger("click");
        		} else {
        			alert(data.error);
        			return false;
        		}
        	});

        	
        });

        $("#offer_secret_buy_post_button").on('click',function(){

        	// 悬赏秘密标价
        	var secretPrice = $('input[name="secretPrice"]').val();
        	console.log(secretPrice);
        	if(secretPrice == '' || secretPrice <0 || secretPrice > 100000){
        		alert('标价必须在0~100000');
        		return false;
        	}

        	// 判断用户的蟋蟀腿是否充足
        	$.post('/xishuaitui/check', {
        		secretPrice: secretPrice
        	}, function(data) {
        		if(data.flag) {
    			$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
		        	$("#secretMainType_hidden").val($("#current_choosen_type").text());
		            $("#secretType_hidden").val($("#secrettype_one").text());
		        	$("#offer_secret_buy_submit_button").trigger("click");
        		} else {
        			alert(data.error);
        			return false;
        		}
        	});
        });



        $("#my_secret_post_button").on('click',function(){

        	if(page.validate()!==false)
        	{
        		console.log($('#secretLimit_hidden').val());
        		$("#secretMainType_hidden").val($("#current_choosen_type").text());
        		$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
	            $("#secretType_hidden").val($("#secrettype_one").text());
	        	$("#mine_secret_submit_button").trigger("click");
        	}

        	
        });


        var tmpBackground="";
        var tmpContent="";
        var tempKnow="";

        /*转长文确认*/
        $("#secrect-background,#secrect-content,#secrect-known").on("keyup",function(){
        	var backgroundLength=$("#secrect-background").val().length;
        	var contentLength=$("#secrect-content").val().length;
        	var knownLength=$("#secrect-known").val().length;
        	if(backgroundLength+contentLength+knownLength>=156)
        	{
        		tmpBackground=$("#secrect-background").val();
        		tmpContent=$("#secrect-content").val();
        		tempKnow=$("#secrect-known").val();

        		$("#secret_background_tr").hide();
        		$("#secret_content_tr").hide();
        		$("#secret_known_tr").hide();
        		$("#secret_longstory_tr").show();
        		$("#secrect-longstory").css({height:600});
        		$("#secrect-longstory").val($("#secrect-background").val()+$("#secrect-content").val()+$("#secrect-known").val());
        		$("#secrect-background").val("");
        		$("#secrect-content").val("");
        		$("#secrect-known").val("");
        		$("#is_longstory_hidden").val("1");//长文标志位
        		$("#secrect-longstory").focus();

				$("#secrect-longstory").unbind().on("keyup",function(){
					if($("#secrect-longstory").val().length<156&&(tmpBackground!=""||tmpContent!=""||tempKnow!="")) {
						$("#secret_background_tr").show();
			    		$("#secret_content_tr").show();
			    		$("#secret_known_tr").show();
			    		$("#secret_longstory_tr").hide();


			    		$("#secrect-background").val(tmpBackground);
			    		$("#secrect-content").val(tmpContent);
			    		$("#secrect-known").val(tempKnow);
        				$("#is_longstory_hidden").val('');//长文标志位
        				$("#secrect-longstory").val('');
			    		$("#secrect-known").focus();
		    		}
				});
        	}
        	
        });


        $('[data-toggle="tooltip"]').tooltip();
        $('.form_date').datetimepicker({
	          language:  'zh-CN',
	          format: 'yyyy-mm',
	          weekStart: 1,
	          todayBtn:  1,
	          autoclose: 1,
	          todayHighlight: 1,
	          startView: 3,
	          minView: 3,
	          forceParse: 0
          });
	},
	validate:function(){

		var title=$('#secretTitle_text').val();
		var keyword=$('#secretKeyWord_text').val();
		var background=$('#secrect-background').val();
		var content=$('#secrect-content').val();
		var known=$('#secrect-known').val();
		var longstory=$('#secrect-longstory').val();
		var date=$("#secret_date_text").val();
		var typeone=$("#secrettype_one").text();
		var limit=$("#secret_select_limit_dropdown").text();
		var hope=$("#secret_select_hope_dropdown").text();
		var grandType=$("#secret_select_grandtype_dropdown").text();
		var cityname=$("#secret_city_text").val();
		var othername=$('#secret_othername_text').val();
		var othersex=$('#secret_othersex_text').html();
		var otherage=$('#secret_otherage_text').html();
		var subtype=$("#secret_select_subtype_dropdown").text();
		var buildName=$("#secret_otherBuildName_text").val();
		var otherAddress=$("#secret_otheraddress_text").val();

		if(typeone&&typeone.indexOf("选择类型")>=0)
		{
			alert("请选择类型");
			return false;
		}


		if(subtype&&subtype.indexOf("选择子类型")>=0)
		{
			alert("请选择子类型");
			return false;
		}
		if(grandType&&grandType.indexOf("选择孙")>=0)
		{
			alert("请选择孙类型");
			return false;
		}
		if(limit&&limit.indexOf("选择")>=0)
		{
			alert("请选择限制");
			return false;
		}

		if(hope&&hope.indexOf("选择")>=0)
		{
			alert("请选择希望");
			return false;
		}	

		if($.trim(cityname)=="")
		{
			alert("请输入城市");
			return false;
		}	


		if((othername&&(othername.length==0))&&othername!="")
		{
			alert("请输入完整的对方信息1");
			return false;
		}
		if(othersex&&$.trim(othersex).indexOf("性别")>=0){
			alert("请输入完整的对方信息2");
			return false;
		}
		if(otherage&&$.trim(otherage).indexOf("年龄")>=0){
			alert("请输入完整的对方信息3");
			return false;
		}
		if(buildName&&(buildName.length==0)||buildName=="")
		{
			alert("请输入完整的对方信息4");
			return false;
		}
		if(otherAddress&&(otherAddress.length==0)||otherAddress=="")
		{
			alert("请输入完整的对方信息5");
			return false;
		}


		if($.trim(title)=="")
		{

			alert("请输入标题");
			return false;
		}
		if(title.length > 18)
		{
			alert("标题的长度不能超过18");
			return false;
		}
		if($.trim(keyword)=="")
		{
			alert("请输入关键词");
			return false;
		}
		if(keyword.length > 4)
		{
			alert("关键词的长度不能超过4");
			return false;
		}
		if(date&&date.indexOf("-")<0||date.length==0)
		{
			alert("请选择日期");
			return false;
		}
		if(($.trim(background)==""||$.trim(content)==""||$.trim(known)=="") && $.trim(longstory)=="")
		{
			alert("请输入完整秘密内容");
			return false;
		}
		if($("#hasLogin_hidden").val()=="no"){
			$("#login-area").trigger("click");
			return false;
		}
		// 长文字数限制在2000以内
		if($('#secrect-longstory').val().length > 2000){
			alert('长文字数不能超过2000');
			return false;
		}
		return true;
	}
};


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
}


$(window).bind("load",page.onload);
