var page={
	onload:function(){
		$("#registry-area").click(function(){
			if($("#registry-area").attr("login")=="false")
			{
				$("#registry-dialog").show();
				page.showDialog();
			}
			
		});
		
		
		$("#login-login-button").click(function(){
			
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
		});
		
		$("#login-login-button").click(function(){

				$.ajax({
					url:"/client/login",
					type:"post",
					data:{username:$("#username-input").val(),password:$("#password-input").val()},
					success:function(data){
						if(!data.error){
							$("#login-area").hide();
							$("#registry-area").html($("#registry-area").html().replace("注册","")+data.username+"&nbsp;&nbsp;<a href='/secret/permsg'>[个人中心]</a>&nbsp;&nbsp;<a href='/'>[返回首页]</a>").css(width,250);
							$("#login-dialog").hide();
							$("#system-background").remove();
							$("#registry-area").attr("login","true")
						}
					}
				});
		})

		$(".select-subitem").on("click",function(){
			$(this).parent().parent().prev().html($(this).text()+"<span class='caret'></span>");
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
