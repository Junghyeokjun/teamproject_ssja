let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
let $product_content = $("#product_content");
let getListProductToServer = function(){
	
	 $.ajax({
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			data: JSON.stringify({'category' : '11'}),
			contentType:"application/json",
			dataType:"json",
			url : "/product/lists",
			success : function(data){
				console.log("가져옴");
				/*let $list_content_dv = $("<div>").attr("id","$list_content_dv").addClass("d-flex flex-row");
				data.forEach(function(e, index){
					$("<div>").css("width",'25%').css('height','20em')
				});
				$product_content.append();*/
				data.forEach(function(e,index){
					$product_content.append($("<p>").text(e));
					
				})
			},
			error : function(data){
				
			}
		})
}
getListProductToServer();