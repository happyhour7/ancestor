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
        	$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
        	$("#secretMainType_hidden").val($("#current_choosen_type").text());
            $("#secretType_hidden").val($("#secrettype_one").text());
        	$("#offer_secret_submit_button").trigger("click");
        });

        $("#offer_secret_buy_post_button").on('click',function(){

        	// 悬赏秘密标价
        	var secretPrice = $('input[name="secretPrice"]').val();
        	console.log(secretPrice);return;
        	if(secretPrice == '' || secretPrice <0 || secretPrice > 100000){
        		alert('标价必须在0~100000');
        		return false;
        	}

        	$("#createTime_hidden").val((new Date()).format('yyyy-MM-dd hh:mm:ss'));
        	$("#secretMainType_hidden").val($("#current_choosen_type").text());
            $("#secretType_hidden").val($("#secrettype_one").text());
        	$("#offer_secret_buy_submit_button").trigger("click");
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
        	if(backgroundLength+contentLength+knownLength>=140)
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
        	}
        	
        });
		$("#secrect-longstory").on("keyup",function(){
			if($("#secrect-longstory").val().length<140&&(tmpBackground!=""||tmpContent!=""||tempKnow!="")) {
				$("#secret_background_tr").show();
	    		$("#secret_content_tr").show();
	    		$("#secret_known_tr").show();
	    		$("#secret_longstory_tr").hide();


	    		$("#secrect-background").val(tmpBackground);
	    		$("#secrect-content").val(tmpContent);
	    		$("#secrect-known").val(tempKnow);
	    		$("#secrect-known").focus();
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
		if($.trim(keyword)=="")
		{
			alert("请输入关键字");
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
		return true;
	}
};


var dataDIc={
	type:{
		woai:['亲情','爱情','友情','师生情','暗恋','同性','其他'],
		wohen:['亲人','爱人','老师','同学','上司','同事','亲戚','邻居','其他'],
		woxiang:['恋爱','破处','做爱','骂人','打人','犯罪','结婚','离婚','自杀','出轨','其他'],
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


$(window).bind("load",page.onload);