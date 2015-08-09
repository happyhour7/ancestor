var page={
	onload:function(){
		$("#registry-area").click(function(){
			if($("#registry-area").attr("login")=="false")
			{
				$("#registry-dialog").show();
				page.showDialog();
			}
			
		});
		
		

		$("#login-cancle-button").click(function(){
			$("#login-dialog").hide();
			$("#system-background").remove();
		});
		
		$("#registry-registry-button").click(function(){
			
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
			$(this).parent().height(90);
		}).blur(function(){
			$(this).height(20);
			$(this).parent().height(30);
		});
		
		$("#login-login-button").click(function(){

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
							$("#registry-area").attr("login","true")
						}
					}
				});
		})
		$(".secret-comments-replay-button").on('click',function(){
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
		$(".secret-good-area,.secret-bad-area").on("click",function(){
			var current=parseInt($(this).html());
			var currentName=$(this).attr("name");
			var currentClass=$(this).attr("class");
			if(typeof hasClick[currentName]=="undefined"&&!hasClick[currentName])
			{
				hasClick[currentName]=$(this).attr("id");
				$(this).html(++current);

				if(currentClass.indexOf("good-icon-choosen")>0)
				{
					$(this).removeClass("good-icon-choosen").addClass("good");
				}
				else if(currentClass.indexOf(" good")>0)
				{
					$(this).addClass("good-icon-choosen").removeClass("good");
				}

				if(currentClass.indexOf("bad-icon-choosen")>0)
				{
					$(this).removeClass("bad-icon-choosen").addClass("bad");
				}
				else if(currentClass.indexOf(" bad")>0)
				{
					$(this).addClass("bad-icon-choosen").removeClass("bad");
				}

			}
			else if(hasClick[currentName]==$(this).attr("id")){
				$(this).html(--current);
				hasClick[currentName]=null;
				delete hasClick[currentName];


				if(currentClass.indexOf("good-icon-choosen")>0)
				{
					$(this).removeClass("good-icon-choosen").addClass("good");
				}
				else if(currentClass.indexOf(" good")>0)
				{
					$(this).addClass("good-icon-choosen").removeClass("good");
				}

				if(currentClass.indexOf("bad-icon-choosen")>0)
				{
					$(this).removeClass("bad-icon-choosen").addClass("bad");
				}
				else if(currentClass.indexOf(" bad")>0)
				{
					$(this).addClass("bad-icon-choosen").removeClass("bad");
				}
			}
			
			
		});

		$(".secret-comment-button").on("click",function(){
			var id=$(this).attr("id").replace("comments-","secret-comments-");
			$("#"+id).toggle();
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
	alert("haha");
	return false;
	
}
