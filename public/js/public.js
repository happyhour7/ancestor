Date.prototype.format =function(format)
{
	var o = {
		"M+" : this.getMonth()+1, //month
		"d+" : this.getDate(), //day
		"h+" : this.getHours(), //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter
		"S" : this.getMilliseconds() //millisecond
	}
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	(this.getFullYear()+"").substr(4- RegExp.$1.length));
	for(var k in o)if(new RegExp("("+ k +")").test(format))
	format = format.replace(RegExp.$1,
	RegExp.$1.length==1? o[k] :
	("00"+ o[k]).substr((""+ o[k]).length));
	return format;
}
Handlebars.registerHelper('dealUsername', function(text) {
    if(text)
    {
        text=text.substring(0,Math.floor(text.length/2))+"*";
    }
    
    return text
});







function ranom(){ 
	var data=["0","1","2","3","4","5","6","7","8","9"]; 
	r=Math.floor(Math.random()*10); //16为数组里面数据的数量，目的是以此当下标取数组data里的值！
	return data[r]; 
} 
function buildValidateNum(){
	var num=ranom();
	var result=num+'';
	$("#registry-valinum-content").html("");
	var span1=$("<span/>").attr("class","public-validata-num-icon public-validate-num")
				.css({
					"background-position":(num*-30)+"px  0px"
				}).appendTo("#registry-valinum-content");
	num=ranom();
	result+=num+'';
	var span2=$("<span/>").attr("class","public-validata-num-icon public-validate-num")
				.css({
					"background-position":(num*-30)+"px  0px"
				}).appendTo("#registry-valinum-content");
	num=ranom();
	result+=num+'';
	var span3=$("<span/>").attr("class","public-validata-num-icon public-validate-num")
				.css({
					"background-position":(num*-30)+"px  0px"
				}).appendTo("#registry-valinum-content");
	num=ranom();
	result+=num+'';
	var span4=$("<span/>").attr("class","public-validata-num-icon public-validate-num")
				.css({
					"background-position":(num*-30)+"px  0px"
				}).appendTo("#registry-valinum-content");
	$("#registry-valinum-content").attr("data",result);
}
var page={
	onload:function(){
		$("#registry-area").click(function(){
			if($("#registry-area").attr("login")=="false")
			{
				$("#registry-dialog").show();
				page.showDialog();
				buildValidateNum();
				
				$("#refresh-valinum-button").click(function(){
					buildValidateNum();
				});

			}
			
		});
		
		

		$("#login-cancle-button").click(function(){
			$("#login-dialog").hide();
			$("#system-background").remove();
		});
		
		$("#login-area").click(function(){
			$("#login-dialog").show();
			page.showDialog();
		});
		$("#registry-gotologin-button").click(function(){
			$("#registry-dialog").hide();
			$("#login-dialog").show();
		});
		$(".secrect-comment-area").focus(function(){
			$(this).height(90);
			$(this).parent().parent().height(100);
		}).blur(function(){
			$(this).height(25);
			$(this).parent().parent().height(25);
		});
		
		$("#login-login-button").click(function(){
				if($("#username-input").val()==""||$("#password-input").val()=="")
				{
					alert("请输入完整的用户名密码");
					return false;
				}

				$.ajax({
					url:"/client/login",
					type:"post",
					data:{username:$("#username-input").val(),password:$("#password-input").val()},
					success:function(data){
						if(!data.error){
							$("#login-area").hide();
							$("#registry-area").html($("#registry-area").html().replace("注册","")+data.username+"&nbsp;&nbsp;<a href='/secret/permsg'>[个人中心]</a>&nbsp;&nbsp;<a href='/'>[返回首页]</a>").css("width",250);
							$("#login-dialog").hide();
							$("#system-background").remove();
							$("#registry-area").attr("login","true");
							$("#hasLogin_hidden").val("yes");
							location.reload();
						}
						else
						{
							alert(data.error);
						}
					}
				});
		});
		$("#registry-registry-button").click(function(){
			if($("#registry-username").val()=="")
			{
				alert("请输入登陆账号");
				return false;
			}
			if($("#registry-password")=="")
			{
				alert("请输入登陆密码");
				return false;
			}
			if($("#registry-city")=="")
			{
				alert("请输入所在城市");
				return false;
			}
			if($("#registry-email")=="")
			{
				alert("请输入注册电子邮箱");
				return false;
			}
			if($("#registry-qq")=="")
			{
				alert("请输入注册QQ");
				return false;
			}
			if($("#registry-phone")=="")
			{
				alert("请输入注册手机号");
				return false;
			}
			if($("#registry-validatecode").val()!=$("#registry-valinum-content").attr("data"))
			{
				alert("请输入正确的验证码"+$("#registry-valinum-content").attr("data"));
				return false;
			}
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/user/registry",
				data:$("#registry-form").serialize(),
				success:function(data){
					console.log(data);
				}
			});
			$("#registry-gotologin-button").trigger("click");
		});
		$(".publish-button").click(function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
			}
			else
			{
				document.location="/secret/write";
			}
			
		});

		$(".secret-comments-replay-button").on('click',function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
				return;
			}
			if($(".secrect-comment-area").val()=="")
			{
				return;
			}
			var div=$("<div/>").css({
				width:200,
				height:50,
				"text-align":"center",
				"line-height":"50px",
				color:"#fff",
				background:"#333",
				position:"fixed",
				left:"50%",
				top:"30%",
				"z-index":999,
				"margin-top":"-25px",
				"margin-left":"-100px",
				"filter":"alpha(opacity=0)",
				"-moz-opacity":"0",
				"-khtml-opacity": "0",
				"opacity": "0"

			}).html("回复成功！").appendTo("body");
			div.animate({"filter":"alpha(opacity=100)",
						"-moz-opacity":"1",
						"-khtml-opacity": "1",
						"opacity": "1",
						top:"50%"
						},500,function(){
							window.setTimeout(function(){
								div.animate({top:"80%",
								"filter":"alpha(opacity=0)",
								"-moz-opacity":"0",
								"-khtml-opacity": "0",
								"opacity": "0",
								},500,function(){
									div.remove();
								});
							},1000);
						});

			$(this).prev().css({height:"20px"}).val("");
			$(this).parent().height(30);
		});
		$(".select-subitem").on("click",function(){
			var name=$(this).attr("name");
			$("#"+name+"_hidden").val($(this).text());
			$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
		});

		var hasClick={};
		$(".secret-area").each(function(index,obj){
			var bad=$(this).find(".secret-bad-area");
			var good=$(this).find(".secret-good-area");
			if(bad[0]==null||good[0]==null)
				return;
			if(bad.attr("class").indexOf("bad-icon-choosen")>=0)
			{
				hasClick[bad.attr("name")]=bad.attr("id");
			}
			else if(good.attr("class").indexOf("good-icon-choosen")>=0)
			{
				hasClick[bad.attr("name")]=good.attr("id");
			}
			

		});
		$(".secret-good-area,.secret-bad-area").on("click",function(){
			var current=parseInt($(this).html());
			var id=$(this).attr("data");
			var currentName=$(this).attr("name");
			var currentClass=$(this).attr("class");
			if(typeof hasClick[currentName]=="undefined"&&!hasClick[currentName])
			{
				if($("#hasLogin_hidden").val()=="no")
				{
					$("#login-area").trigger("click");
					return false;
				}
				
				hasClick[currentName]=$(this).attr("id");
				$(this).html(++current);

				if(currentClass.indexOf("good-icon-choosen")>0)
				{
					$(this).removeClass("good-icon-choosen").addClass("good");
					//点赞减一
					dealComm("good","pass",id);
				}
				else if(currentClass.indexOf(" good")>0)
				{
					$(this).addClass("good-icon-choosen").removeClass("good");
					//点赞加一
					dealComm("good","add",id);
				}

				if(currentClass.indexOf("bad-icon-choosen")>0)
				{
					$(this).removeClass("bad-icon-choosen").addClass("bad");
					//鸡蛋减一
					dealComm("bad","pass",id);
				}
				else if(currentClass.indexOf(" bad")>0)
				{
					$(this).addClass("bad-icon-choosen").removeClass("bad");
					//鸡蛋加一
					dealComm("bad","add",id);
				}

			}
			else if(hasClick[currentName]==$(this).attr("id")){
				if($("#hasLogin_hidden").val()=="no")
				{
					$("#login-area").trigger("click");
					return false;
				}
				$(this).html(--current);
				hasClick[currentName]=null;
				delete hasClick[currentName];


				if(currentClass.indexOf("good-icon-choosen")>0)
				{
					$(this).removeClass("good-icon-choosen").addClass("good");
					//点赞减一
					dealComm("good","pass",id);
				}
				else if(currentClass.indexOf(" good")>0)
				{
					$(this).addClass("good-icon-choosen").removeClass("good");
					//点赞加一
					dealComm("good","add",id);
				}

				if(currentClass.indexOf("bad-icon-choosen")>0)
				{
					$(this).removeClass("bad-icon-choosen").addClass("bad");
					//鸡蛋减一
					dealComm("bad","pass",id);
				}
				else if(currentClass.indexOf(" bad")>0)
				{
					$(this).addClass("bad-icon-choosen").removeClass("bad");
					//鸡蛋加一
					dealComm("bad","add",id);
				}
			}
			
			
		});
		function dealComm(type,deal,id){

			$.ajax({
				url:"/secret/func?type="+type+"&deal="+deal+"&fileid="+id,
				async:false,
				cache:false,
				success:function(){
					console.log("操作成功！");
				}
			});
		}
		$(".secret-score-select").change(function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
				return false;
			}

			var choosenScore=$(this).find("option:selected").text();
			var id=$(this).attr("data");
			$.ajax({
				url:"/secret/setScore?id="+id+"&score="+choosenScore,
				async:false,
				cache:false,
				success:function(){
					console.log("执行成功！");
				}
			});
		});
		$(".secret-comment-button").on("click",function(){
			var parents=$("#secret-body-container-"+$(this).attr("data"));
			if(parents.find(".comment-title-bar")[0]!=null)
			{
				console.log(parents.find(".comment-title-bar"));
				return false;
			}
			$.ajax({
				url:"/secret/getAllComments?id="+$(this).attr("data"),
				async:false,
				cache:false,
				success:function(data){
					var source=$("#secretComment-temple").html();
					var template=Handlebars.compile(source);
					console.dir(data);
					var html=template(data);
					parents.append(html);
					$(".comment-title-bar").unbind().click(function(){
						$(this).parent().remove();
					});
				}
			});
		});

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
$(window).bind("load",page.onload);



function registrySubmit(){
	var username=$("#registry-username").val();
	var password=$("#registry-password").val();
	var sex_woman=$("#registry-woman").attr("checked")||false;
	var sex_man=$("#registry-man").attr("checked")||false;
	var email=$("#registry-email").val();

	var city=$("#registry-city").val();
	var qq=$("#registry-qq").val();
	var phone=$("#registry-phone").val();

	return false;
	
}

$(".secret-comments-replay-button").click(function(){
	var text=$(this).prev().find(".secrect-comment-area").val();
	var currentTime=(new Date()).format('yyyy-MM-dd hh:mm:ss');
	$(this).prev().find(".replayTime").val(currentTime);

	if($.trim(text)!=="")
	{
		$(this).prev().find(".secret-comments-replay-submit-button").trigger("click");
	}
	

});

$(window).scroll(function(){
		if($(this).scrollTop()>100)
		{
			$("<div/>").css({
				width:70,
				height:70,
				position:"fixed",
				bottom:100,
				right:50,
				background:"url(../../images/icons.png)  -14px -165px #333",
				cursor:"pointer"
			}).attr("class","scrollToTop").appendTo("body").click(function(){
				$(window).scrollTop(0);
			});
		}
		else
		{
			$(".scrollToTop").remove();
		}
	});


$(".secret-del-button").click(function(){
	var id=$(this).attr("data");
	var _that=this;
	$.ajax({
		url:"/secret/del?id="+id,
		async:false,
		cache:false,
		success:function(data){
			$(_that).parent().parent().remove();
		}
	})
});