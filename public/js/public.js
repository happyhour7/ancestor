var page={
	onload:function(){
		$("#registry-area").click(function(){
			$("#login-dialog").show();
			page.showDialog();
		});
		
		$("#login-area").click(function(){
			
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
			$("#registry-dialog").show();
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
