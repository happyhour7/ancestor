var page_personal={
	load:function(){
		$("#btnSub_upload").click(function(){
			$("#user-photo-upload-form").submit();
		});

		$("#personal-msg-post-button").click(function(){
			$("#personal_update_form").submit();
			alert('提交成功');
		});



        
        
	}
};

window.onload=page_personal.load;