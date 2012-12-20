/* list.js @cytms*/
$(document).ready(function(){
		//url  : "/cart/listPatent",
	$.ajax({
		type : "GET", 
		url  : "/cart/listPatent",
		dataType : 'html',
		success : function(listPatentHtml){
			$('#listFrame').html(listPatentHtml);
		},
		error : function(){
			console.log('listPatent wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});