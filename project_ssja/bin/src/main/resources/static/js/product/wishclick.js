let wish_click = function(){
	
	
$.ajax({
	type : "put",
	beforeSend : function(xhr) {
		xhr.setRequestHeader(header, token);
	},
	url:"/wishlist",
	success:function(data){
		
	},error: function(xhr, status, error) {
		console.log("Error:", xhr.responseText);
	}
	
}
	
}