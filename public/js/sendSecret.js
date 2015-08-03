var page={
	onload:function(){
		$("#mine_secret").click(function(){
			$("#current_choosen_type").html("我的秘密");

			$("#mysecret-container-body").show();

			$("#tasecret-container-body").hide();
			$("#tasecret-container-bus-body").hide();

			$("#sellsecret-container-body").hide();
			$("#sellsecret-container-bus-body").hide();

			$("#offersecret-container-body").hide();
			$("#offersecret-container-bus-body").hide();
		});

		$("#ta_secret").click(function(){
			$("#current_choosen_type").html("TA的秘密");
			$("#mysecret-container-body").hide();

			$("#tasecret-container-body").show();
			$("#tasecret-container-bus-body").hide();

			$("#sellsecret-container-body").hide();
			$("#sellsecret-container-bus-body").hide();

			$("#offersecret-container-body").hide();
			$("#offersecret-container-bus-body").hide();
		});

		$("#sell_secret").click(function(){
			$("#current_choosen_type").html("出售秘密");
			$("#mysecret-container-body").hide();

			$("#tasecret-container-body").hide();
			$("#tasecret-container-bus-body").hide();

			$("#sellsecret-container-body").show();
			$("#sellsecret-container-bus-body").hide();

			$("#offersecret-container-body").hide();
			$("#offersecret-container-bus-body").hide();
		});

		$("#order_secret").click(function(){
			$("#current_choosen_type").html("悬赏秘密");
			$("#mysecret-container-body").hide();

			$("#tasecret-container-body").hide();
			$("#tasecret-container-bus-body").hide();

			$("#sellsecret-container-body").hide();
			$("#sellsecret-container-bus-body").hide();

			$("#offersecret-container-body").show();
			$("#offersecret-container-bus-body").hide();
		});

		/*$("#floater_secret").click(function(){
			$("#current_choosen_type").html("漂流瓶");
		});*/

		$(".").on("click",function(){});

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
	}
};


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


$(window).bind("load",page.onload);