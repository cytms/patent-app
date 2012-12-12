$( "#submitINV" ).live("click",function(){
	//var x = document.forms["testForm"]["patentID"].value;
	//alert(x);
	$.ajax({
		type : "GET", 
		url: "/basic/searchINV",
		data: { INV: $('input[name="INV"]').val() },
		dataType: 'html',
		success: function(data){
		 	//alert("YA");
		 	$('#searchResult').html(data);
		 	console.log("yabi");
		},
		error: function(){
		console.log('something wrong happened');
		alert("oops");
		}
	});	
});