
$(document).ready(function(){
	$("#typeSearch").on('click',function(){
		var type=$("#TypeNum").val();
		var snackName=$("#snackName").val();
		location.href='/shop/puffingType?snackName='+snackName;
	})
	
})