var page_personal={
	load:function(){
		$("#btnSub_upload").click(function(){
			$("#user-photo-upload-form").submit();
		});

		$("#personal-msg-post-button").click(function(){
			$("#personal_update_form").submit();
		});



        
        
	}
};

window.onload=page_personal.load;