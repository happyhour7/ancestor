$("#top-adv-save-button").click(function(){
	$("#top-adv-submit-button").trigger("click");
});


$("#left-top-adv-save-button").click(function(){
  $("#left-top-adv-submit-button").trigger("click");
});


$("#left-mid-adv-save-button").click(function(){
  $("#left-mid-adv-submit-button").trigger("click");
});


$("#left-bottom-adv-save-button").click(function(){
  $("#left-bottom-adv-submit-button").trigger("click");
});


$("#inner-left-top-adv-save-button").click(function(){
  $("#inner-left-top-adv-submit-button").trigger("click");
});

$("#inner-left-bottom-adv-save-button").click(function(){
  $("#inner-left-bottom-adv-submit-button").trigger("click");
});
        function onUploadImgChange(sender,id,id_fake,id_size_fake){
             if( !sender.value.match( /.jpg|.png/i ) ){
                 alert('图片格式无效！');
                 return false;
             }
             var objPreview = document.getElementById(id);
             var objPreviewFake = document.getElementById(id_fake);
             var objPreviewSizeFake = document.getElementById(id_size_fake);
            
    //ff/chrome
             if( sender.files && sender.files[0] ){
                 objPreview.style.display = 'block';
                 objPreview.style.width = 'auto';
                 objPreview.style.height = 'auto';
                 objPreview.src = window.URL.createObjectURL(sender.files[0]);
             }else if( objPreviewFake.filters){
               //ie
              sender.select();
              sender.blur();//安全性问题考虑（拒绝访问的情形）
              var imgSrc = document.selection.createRange().text;
              document.selection.empty();
                objPreviewFake.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + imgSrc + "',sizingMethod = scale;)";
                objPreviewSizeFake.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + imgSrc + "',sizingMethod = scale;)";
                autoSizePreview(objPreviewFake,179,219);
                objPreview.style.display = 'none';
             }  
       }