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

Handlebars.registerHelper('dealUsername', function(text) {
    if(text)
    {
        text=text.substring(0,Math.floor(text.length/2))+"*";
    }
    
    return text
});





function replaySuccess(){
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

}

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

				// 关闭注册框按钮
				$('#closeBtn').unbind().click(function(){
					$('#registry-dialog').hide();
					$(".system-background").remove();
				});

			}
			
		});
		
		$(".adv-replay-btn").click(function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
				return false;
			}
			var text=$(this).prev().val();
			if(text=="")
			{
				return false;
			}
			var _that=this;
			$.ajax({
				url:"/adv/sendComment?userid="+$("#hasLogin_hidden").attr("username")+"&comment="+text+"&date="+(new Date()).format('yyyy-MM-dd hh:mm:ss')+"&location="+$(this).next().val(),
				async:false,
				cache:false,
				success:function(data){
					$(_that).prev().val("");
					replaySuccess();
					location.reload();
				}
			});
		});
		$(".adv-replay-top-btn").click(function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
				return false;
			}
			var text=$(this).prev().find(".secrect-comment-area").val();
			if(text=="")
			{
				return false;
			}
			var _that=this;
			$.ajax({
				url:"/adv/sendComment?userid="+$("#hasLogin_hidden").attr("username")+"&comment="+text+"&date="+(new Date()).format('yyyy-MM-dd hh:mm:ss')+"&location="+$(this).next().val(),
				async:false,
				cache:false,
				success:function(data){
					$(_that).prev().find(".secrect-comment-area").val("");
					replaySuccess();
				}
			});
		});

		$("#login-cancle-button").click(function(){
			$("#login-dialog").hide();
			$(".system-background").remove();
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
			$(this).height(18);
			$(this).parent().parent().height(30);
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
							$(".system-background").remove();
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
			if($("#registry-password").val()=="")
			{
				alert("请输入登陆密码");
				return false;
			}
			if($("#registry-age").val()=="")
			{
				alert("请选择您的年龄");
				return false;
			}
			if($("#registry-city").val()=="")
			{
				alert("请输入所在城市");
				return false;
			}
			if($("#registry-validatecode").val()!=$("#registry-valinum-content").attr("data"))
			{
				alert("请输入正确的验证码"+$("#registry-valinum-content").attr("data"));
				return false;
			}
			if(!$('#agreeContract:checked').length)
			{
				alert('请同意用户协议');
				return false;
			}
			var isOk=true;
			$.ajax({
				type:"get",
				async:false,
				url:"/user/hasRegistried?username="+$("#registry-username").val(),
				success:function(data){
					if(data.status!="OK")
					{
						isOk=false;
					}
				}
			});

			if(!isOk){
				alert("该账号已被注册！");
				return;
			}

			$.ajax({
				type:"post",
				async:false,
				dataType:"json",
				url:"/user/registry",
				data:$("#registry-form").serialize(),
				success:function(data){
					alert("注册成功：\r\n登录账号："+$("#registry-username").val()+"\r\n登录密码："+$("#registry-password").val()+'\r\n亲爱的用户，欢迎您注册蟋蟀网！\r\n一、怎么获取蟋蟀腿？\r\n1.发帖和回复。发1帖所得蟋蟀腿数=用户信用分值*10。\r\n2.充值购买，支付宝充值1元人民币可获取10个蟋蟀腿。\r\n3.偷好友蟋蟀腿，每个好友每天限偷1次。\r\n4.出售秘密，用户需先支付蟋蟀腿才能浏览。\r\n5.其他用户打赏。\r\n6.系统自动赠送每日蟋蟀腿增长数前若干名用户蟋蟀腿若干。\r\n二、蟋蟀腿有何用处？\r\n1.向本站兑换人民币，60个蟋蟀腿可兑换1元人民币（篡改、重复发帖等非正常所得无法兑换）。\r\n2.支付蟋蟀腿浏览“出售秘密”的贴子。\r\n3.发布“悬赏秘密”贴需有足够蟋蟀腿。\r\n4.打赏其他用户。\r\n三、信用分值是什么？\r\n1.一个用户所有帖子可信度得分的平均值是该用户的信用分值。\r\n2.一个帖子的所有用户评分的平均值是一个帖子的可信度得分。\r\n3.如用户所发贴无用户评分，则系统默认该用户信用分值为0，发帖得蟋蟀腿为1个。\r\n四、可以和其他用户在线聊天吗？\r\n1.在“个人中心——我的好友”处可搜索用户，加其为好友。\r\n2.在“好友列表”处可以和好友一对一聊天、和多个好友群聊。');
					$("#registry-gotologin-button").trigger("click");
				}
			});

			
		});
		$(".publish-button").click(function(){
			/*if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
			}
			else
			{
				document.location="/secret/write";
			}*/
			document.location="/secret/write";
			
		});

		/*$(".secret-comments-replay-button").on('click',function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
				return;
			}
			if($(".secrect-comment-area").val()=="")
			{
				return;
			}
			
			$(this).prev().css({height:"20px"}).val("");
			$(this).parent().height(30);
		});*/
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
				hasClick[good.attr("name")]=good.attr("id");
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
			var that=this;
			if(choosenScore != '')
			{
				$.ajax({
					url:"/secret/setScore?id="+id+"&score="+choosenScore,
					async:false,
					cache:false,
					success:function(){
						console.log("执行成功！");
						$(that).attr("disabled","disabled");
					}
				});
			}
			
		});
		
		$(".adv-score-select").change(function(){
			if($("#hasLogin_hidden").val()=="no")
			{
				$("#login-area").trigger("click");
				return false;
			}
			var that=this;
			var choosenScore=$(this).find("option:selected").text();
			var location=$(this).parent().prev().prev().val();
			var advId = $(this).attr('data');
			if(choosenScore != '')
			{
				$.ajax({
					url:"/adv/setScore?advId="+advId+"&userid="+$("#hasLogin_hidden").attr("username")+"&score="+choosenScore+"&location="+location,
					async:false,
					cache:false,
					success:function(){
						$(that).attr("disabled","disabled");
					}
				});
			}
			
		});
		$(".secret-comment-button").on("click",function(){
			var parents=$("#secret-body-container-"+$(this).attr("data"));
			if(parents.find(".comment-title-bar")[0]!=null)
			{
				return false;
			}
			$.ajax({
				url:"/secret/getAllComments?id="+$(this).attr("data"),
				async:false,
				cache:false,
				success:function(data){
					Handlebars.registerHelper('ifCond', function(v1, v2, options) {
					  if(v1 == v2) {
					    return options.fn(this);
					  }
					  return options.inverse(this);
					});
					var source=$("#secretComment-temple").html();
					var template=Handlebars.compile(source);
					var html=template(data);
					parents.append(html);
					$(".comment-title-bar").unbind().click(function(){
						$(this).parent().remove();
					});

					// 悬赏秘密采纳并支付蟋蟀腿按钮事件
					$('.btn-xuanshang-caina').unbind().click(function() {
						$this = $(this);
						var $btn = $this.button('loading');

						if($("#hasLogin_hidden").val()=="no")
						{
							$("#login-area").trigger("click");
							return false;
						}

						// 支付动作
						var fileid = $this.attr('data-fileid');
						var title = $this.attr('data-title');
						var receiver = $this.attr('data-receiver');
						var price = $this.attr('data-price');

						$.post('/xishuaitui/caina', {
							fileid: fileid,
							title: title,
							receiver: receiver,
							price: price
						}, function(data) {
							if(data.flag) {
								alert(data.error);
								location.reload();
							}
							$btn.button('reset');
						});
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
		}).attr("class","system-background").appendTo("body");
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
	if($("#hasLogin_hidden").val()=="no")
	{
		$("#login-area").trigger("click");
		return;
	}	
	var text=$(this).prev().find(".secrect-comment-area").val();
	var currentTime=(new Date()).format('yyyy-MM-dd hh:mm:ss');

	if($.trim(text)!=="") {
		$.post('/secret/replaysave', {
			content: text,
			filedid: $(this).prev().find('input[name="filedid"]').val(),
			replayTime: currentTime,
		}, function(resp) {
			if(resp.status) {
				replaySuccess();
				location.href = '/';
			}
		});
	}
});

$(window).scroll(function(){
		if($(this).scrollTop()>100)
		{
			var toTop = $("<div/>").css({
				width:50,
				height:50,
				position:"fixed",
				bottom:100,
				right:15,
				background:"url(../../images/icons.png)  -24px -174px #333",
				cursor:"pointer"
			}).attr("class","scrollToTop");
			if($('.scrollToTop').length > 0) {
				return;
			}

			toTop.appendTo("body").click(function(){
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
	if(confirm("确认删除该秘密吗？"))
	{
		$.ajax({
			url:"/secret/del?id="+id,
			async:false,
			cache:false,
			success:function(data){
				$(_that).parent().parent().remove();
			}
		});
	}
	
});

$(".search-button").click(function(){
	if($(this).next().val()=="")
		return false;
	document.location="/search?keyword="+$(this).next().val();
});


$(".friend-ul").find("li").dblclick(function(){
	var username=$(this).attr("username");
	buildChatWin("与"+username+"聊天中",username);
});
var currentSystemUsername=$.trim($("#registry-area").text().split("[")[0]);
function buildChatWin(title,target, message){
	// 如果存在群聊的窗口就先移除
	if($(".chatgroup-area").length > 0) {
		$($(".chatgroup-area").parent().remove());
	}

	if($(".target-text-area")[0]!=null) {
		if(message) {
			var textarea=$(".target-text-area");
			var currentValue=textarea.html();
			var time=(new Date()).format("yyyy-MM-dd hh:mm:ss");
			textarea.html("<span style='display:block;width:100%;height:5px;'></span><span style='color:purple;'>"+target+"</span><span style='color:#ccc;'>"+time+"</span>："+"<br/>"+message+currentValue);
		}
		return;
	}

	var win=$("<div/>").css({
		width:478,
		height:350,
		position:"fixed",
		bottom:5,
		right:80,
		"z-index":0,
		background:"#fff",
		border:"1px solid #000"
	}).appendTo("body");
	var title=$("<span/>").css({
		height:"50px",
		"line-height":"50px",
		"text-align":"left",
		"font-size":20,
		"padding-left":9,
		display:"block"
	}).html(title).appendTo(win);


	var closeButton=$("<span/>").css({
		width:30,
		height:30,
		"background-position":"-110px -211px",
		position:"absolute",
		right:8,
		top:11,
		cursor:"pointer",
	}).attr("class","system-icons").click(function(){
		$(this).parent().remove();
	}).appendTo(win);
	var textarea=$("<div/>").css({
		width:458,
		height:250,
		border:"1px solid #ccc",
		color:"#000",
		margin: "5px 0 0 9px",
		overflow:"auto"
	}).attr("readonly","").attr("class","target-text-area").appendTo(win);

	var input =$("<input/>").css({width:300,height:30,border:"1px solid #ccc",
			"line-height":"30px",
			"margin-left":9
	}).bind({
		keypress:function(event){
			if(event.keyCode==13)
			{
				console.log('obj');
				$(this).next().trigger("click");
			}
		}
	}).appendTo(win);

	var button=$("<button/>").attr("class","btn btn-primary")
	.css({
		"margin-left":5,
		width:74
	}).text("发送").unbind().click(function(){
		var text=$(this).prev().val();
		sendMsg({text:text,target:target,from:currentSystemUsername});
		$(this).prev().val("");
	}).appendTo(win);

	// 清除聊天记录按钮
	var button=$("<button/>").attr("class","btn btn-primary")
	.css({
		"margin-left":5,
		width:74
	}).text("清除").unbind().click(function(){
		$('.target-text-area').empty();
	}).appendTo(win);

	// 回车发送
	/*$(button).prev().keypress(function(e){
		if(e.which == 13){
			var text=$(this).val();
			sendMsg({text:text,target:target,from:currentSystemUsername});
			$(this).val("");
		}
	});*/

	// 添加消息
	if(message) {
		var textarea=$(".target-text-area");
		var currentValue=textarea.html();
		var time=(new Date()).format("yyyy-MM-dd hh:mm:ss");
		textarea.html(currentValue+"<span style='display:block;width:100%;height:5px;'></span><span style='color:purple;'"+target+"</span><span style='color:#ccc;'>"+time+"</span>："+"<br/>"+message);
		
	}
}

function sendMsg(data){
	var text=data.text;
	var textarea=$(".target-text-area"),
		chatgrouparea = $(".chatgroup-area");
	var currentValue=textarea.html(),
		currentchatValue = chatgrouparea.html();
	var username=$("#registry-area").text().split("[")[0];
	var time=(new Date()).format("yyyy-MM-dd hh:mm:ss");
	if(text!="")
	{
		if(textarea.length > 0) { // 个人聊天
			textarea.html("<span style='display:block;width:100%;height:5px;'></span><span style='color:blue;'>"+username+"</span><span style='color:#ccc;'>"+(new Date()).format("yyyy-MM-dd hh:mm:ss")+"</span>："+"<br/>"+text+currentValue);
		}
		
		if(chatgrouparea.length > 0) { // 群组聊天
			chatgrouparea.html("<span style='display:block;width:100%;height:5px;'></span>"+username+"<span style='color:#ccc;'>"+(new Date()).format("yyyy-MM-dd hh:mm:ss")+"</span>："+"<br/>"+text+currentchatValue);
		}
	}
	console.log(data);
	$.post('/chat/save',{from:$.trim(username),to:JSON.stringify(data.target),msg:text,time:time},function(){

	});
}
if($(".friend-area.hasLogin")[0]!=null)
{
	// 禁用ajax的缓存
	$.ajaxSetup ({
	    // Disable caching of AJAX responses */
	    cache: false
	});
	window.setInterval(function(){
		$.ajax({
			url:"/chat/getMine?to="+currentSystemUsername,
			async:false,
			success:function(data){
				if(data.length>0)
				{
					for(var i=0;i<data.length;i++)
					{
						if(data[i].type === 'chatgroup') {
							if(data[i].action === 'delete') {
								alert('您已被移除群聊');
								$('.chatgroup-area').parent().remove();
							}else {
								buildChatGroupWin("与"+data[i].to.join(',')+"群聊中", data[i].to, data[i].from, false, data[i].msg);
							}
							
						}else if(data[i].type === 'person') {
							buildChatWin("与"+data[i].from+"聊天中",data[i].from, data[i].msg);
						}
						
					}
				}
			}
		});
	},1000);
}
var isChooseSurvey=false;
$(".survey-container").find(".good").click(function(){
	if($("#hasLogin_hidden").val()=="no")
	{
		$("#login-area").trigger("click");
		return;
	}
	if($("#survey-law").val()=="law")
	{
		alert("您已经参与该调查");
		return;
	}
	changeSurveyResult("good");
	$(".survey-container").find(".good").unbind();
	$(".survey-container").find(".bad").unbind();
	$("#choosetype").val("good");
	isChooseSurvey=true;
});
$(".survey-container").find(".bad").click(function(){
	if($("#hasLogin_hidden").val()=="no")
	{
		$("#login-area").trigger("click");
		return;
	}
	if($("#survey-law").val()=="law")
	{
		alert("您已经参与该调查");
		return;
	}
	changeSurveyResult("bad");
	$(".survey-container").find(".good").unbind();
	$(".survey-container").find(".bad").unbind();
	$("#choosetype").val("bad");
	isChooseSurvey=true;
});
changeSurveyResult();
function changeSurveyResult(type){
	var resultWidth=$(".survey-container").find(".result").width()-5;
	var goodarea=$(".survey-container").find(".good-area");
	var badarea=$(".survey-container").find(".bad-area");
	var goodButton=$(".survey-container").find(".good");
	var badButton=$(".survey-container").find(".bad")
	var good=parseInt(goodButton.attr("num"));
	var bad=parseInt(badButton.attr("num"));
	if(type=="good")
		good++;
	else if(type=="bad")
		bad++;
	if(good+bad==0)
	{
		goodarea.width(0);
		badarea.width(0);
	}
	else
	{
		var unit=resultWidth/(good+bad);
		goodarea.width(unit*good);
		badarea.width(unit*bad);
		goodButton.attr("num",good);
		badButton.attr("num",bad);
	}
	$(".survey-container").find(".good-num").html(good);
	$(".survey-container").find(".bad-num").html(bad);


}

$("#post-button").click(function(){
	if($("#hasLogin_hidden").val()=="no")
	{
		$("#login-area").trigger("click");
		return;
	}
	if($("#survey-law").val()=="law")
	{
		alert("您已经参与该调查");
		return;
	}
	if(isChooseSurvey===false)
	{
		alert("请选择赞成或不赞成");
		return false;
	}

	$.post('/survey/post', {
		choosetype: $('#choosetype').val(),
		answer: 1
	}, function(result) {
		alert(result.error);
	});
	/*if($("input[name='answer']:checked").val())
	{
		$("#survey-submit").trigger("click");
		alert("回答成功！");
	}
	else
	{
		alert("请选择调查原因");
		return false;
	}

*/
});


// 群聊有关事件
$('.chatgroup-add-btn').click(function(e) {
	if ( e && e.stopPropagation ) {
		e.stopPropagation();
	}else {
		window.event.cancelBubble = true;
	}

	var username = $(this).parent().attr('username');
	$.get('/chatGroup/get', function(result) {
		if(result.status) {

			var time=(new Date()).format("yyyy-MM-dd hh:mm:ss");
			var members = '';

			if(result.data.length > 0) {
				members = result.data[0]['members'];
				if($.inArray(username, members.split(',')) === -1) {
					members = (members == '' ? username : (members +','+username));
				}
			} else {
				members += username;
			}

			var title = '与'+members+'群聊中';

			// 保存选择的群聊
			$.post('/chatGroup/save', {
				name: title,
				members: members,
				owner: currentSystemUsername,
				createTime: time
			}, function(data) {
				if(data.status) {
					buildChatGroupWin(title, members.split(','), currentSystemUsername, true);
				} else {
					alert('创建群聊失败，请重试');
				}
			});
		}
	});

});

// 群聊窗口
function buildChatGroupWin(title,target, from, isowner, message){
	// 如果存在好友聊天的窗口就先移除
	if($(".target-text-area").length > 0) {
		$($(".target-text-area").parent().remove());
	}

	if($(".chatgroup-area")[0]!=null) {
		// 更新标题
		$('.chatgroup-title').text(title);

		// 更新成员列表
		var newlis = '';
		for (var u = 0; u < target.length; u++) {
			newlis += '<li class="list-group-item">'+target[u];
			if(isowner) {
				newlis += '<button type="button" data-members="'+target.join(',')+
				   '" data-user="'+target[u]+
				   '" class="btn btn-xs pull-right chatgroup-member-del">'+
				   '<span aria-hidden="true">&times;</span></button>';
			}
			newlis += '</li>';
				   
		}
		$('.member-list').html(newlis);
		memeberDel();

		if(message) {

			var textarea=$(".chatgroup-area");
			var currentValue=textarea.html();
			var time=(new Date()).format("yyyy-MM-dd hh:mm:ss");
			textarea.html("<span style='display:block;width:100%;height:5px;'></span>"+from+"<span style='color:#ccc;'>"+time+"</span>："+"<br/>"+message+currentValue);
		}
		return;
	}

	var win=$("<div/>").css({
		width:665,
		height:350,
		position:"fixed",
		bottom:5,
		right:80,
		"z-index":0,
		background:"#fff",
		border:"1px solid #000"
	}).appendTo("body");
	var title=$("<span/>").css({
		height:"50px",
		"line-height":"50px",
		"text-align":"left",
		"font-size":20,
		"padding-left":9,
		display:"block"
	}).html(title).attr('class', 'chatgroup-title').appendTo(win);


	var closeButton=$("<span/>").css({
		width:30,
		height:30,
		"background-position":"-110px -211px",
		position:"absolute",
		right:8,
		top:11,
		cursor:"pointer",
	}).attr("class","system-icons").click(function(){
		$(this).parent().remove();
	}).appendTo(win);
	var textarea=$("<div/>").css({
		width:460,
		height:250,
		border:"1px solid #ccc",
		color:"#000",
		margin: "5px 0 0 9px",
		overflow:"auto"
	}).attr("readonly","").attr("class","chatgroup-area pull-left").appendTo(win);

	var lis = '';
	for (var u = 0; u < target.length; u++) {
		lis += '<li class="list-group-item">'+target[u];
		if(isowner) {
			lis += '<button type="button" data-members="'+target.join(',')+
			   '" data-user="'+target[u]+
			   '" class="btn btn-xs pull-right chatgroup-member-del">'+
			   '<span aria-hidden="true">&times;</span></button>';
		}
		lis += '</li>';
	}
	var ul = $("<ul/>").css({
		width: 188,
		height: 250,
		color: "#000",
		margin: "5px 0",
		overflow: "auto"
	}).html(lis).attr("class","member-list list-group pull-right").appendTo(win);

	// 群聊用户删除事件
	function memeberDel () {
		$('.chatgroup-member-del').click(function() {
			var $this = $(this);
			var memebers = $this.attr('data-members');
			var currentuser = $this.attr('data-user');
			$.post('/chatGroup/memeberdel', {
				originalMembers: memebers,
				currentuser: currentuser
			}, function(data) {
				if(data.status) {
					if(!data.target) { // 群聊成员为空时
						alert('成员为空，请重新创建群聊');
						$('.member-list').parent().remove();
						return;
					}

					$this.parent().slideUp('normal', function(){$(this).remove();});
					// 更新标题
					$('.chatgroup-title').text(data.title);
					// 更新成员列表的data-members属性
					$('.member-list button').attr('data-members', data.target);
					// 更新按钮发送的群组成员
					sendMsg({text:'',target:data.target.split(','),from:currentSystemUsername});
				}else {
					console.log('删除群组成员失败');
				}
			});
		});
	}
	memeberDel();

	var input =$("<input/>").css({width:300,height:30,border:"1px solid #ccc",
			"line-height":"30px",
			"margin-left":9
	}).attr('class', 'msg-input').bind({
		keypress:function(event){
			if(event.keyCode==13)
			{
				$(this).next().trigger("click");
			}
		}
	}).appendTo(win);

	var button=$("<button/>").attr("class","btn btn-primary")
	.css({
		"margin-left":5,
		width:74
	}).text("发送").unbind().click(function(){
		var text=$(this).prev().val();
		sendMsg({text:text,target:target,from:currentSystemUsername});
		$(this).prev().val("");
	}).appendTo(win);

	// 清除聊天记录按钮
	var button=$("<button/>").attr("class","btn btn-primary send-btn")
	.css({
		"margin-left":5,
		width:74
	}).text("清除").unbind().click(function(){
		$('.chatgroup-area').empty();
	}).appendTo(win);

	// 回车发送
	/*$('.send-btn').prev().keypress(function(e){
		if(e.which == 13){
			var text=$(this).val();
			sendMsg({text:text,target:target,from:currentSystemUsername});
			$(this).val("");
		}
	});*/

	// 添加消息
	if(message) {
		var textarea=$(".chatgroup-area");
		var currentValue=textarea.html();
		var time=(new Date()).format("yyyy-MM-dd hh:mm:ss");
		textarea.html(currentValue+"<span style='display:block;width:100%;height:5px;'></span>"+from+"<span style='color:#ccc;'>"+time+"</span>："+"<br/>"+message);
		
	}
}


// 支付蟋蟀腿按钮事件
$('.btn-pay').click(function() {
	if($("#hasLogin_hidden").val()=="no")
	{
		$("#login-area").trigger("click");
		return false;
	}

	$this = $(this);
	var $btn = $this.button('loading');

	// 支付动作
	var fieldid = $this.attr('data-fieldid');
	var title = $this.attr('data-title');
	var receiver = $this.attr('data-receiver');
	var xishuaitui = $this.attr('data-xishuaitui');

	$.post('/xishuaitui/pay', {
		fieldid: fieldid,
		title: title,
		receiver: receiver,
		xishuaitui: xishuaitui
	}, function(data) {
		alert(data.error);
		if(data.flag) {
			location.reload();
		}
		$btn.button('reset');
	});
});


// 打赏蟋蟀腿按钮事件
$('.btn-dashang').click(function() {
	if($("#hasLogin_hidden").val()=="no")
	{
		$("#login-area").trigger("click");
		return false;
	}

	$this = $(this);
	var $btn = $this.button('loading');

	var xishuaitui = prompt('您将打赏作者蟋蟀腿：');
	if(xishuaitui && parseInt(xishuaitui) == xishuaitui)
	{
		var fieldid = $this.attr('data-fieldid');
		var receiver = $this.attr('data-receiver');

		$.post('/xishuaitui/pay', {
			fieldid: fieldid,
			receiver: receiver,
			xishuaitui: xishuaitui,
			dashang: true
		}, function(data) {
			alert(data.error);
			if(data.flag) {
				location.reload();
			}
		});
	}
	$btn.button('reset');
	
});

// 昨日蟋蟀腿增长排行榜事件
$.get('/xishuaitui/rank', function(data) {
	var source=$("#rank-list-area").html();
	if (source) {
		var template=Handlebars.compile(source);
		var html=template(data);
		$('.rank-list-area').append(html);
	}

});

// 长文显示与隐藏效果
$('.showall').click(function () {
	$(this).prev().css('height', 'auto');
	$(this).hide();
});