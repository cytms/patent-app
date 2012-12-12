$( "#submitID" ).live("click",function(){
	//var x = document.forms["testForm"]["patentID"].value;
	//alert(x);
	$.ajax({
		type : "GET", 
		url: "/basic/searchPID",
		data: { patentID: $('input[name="patentID"]').val() },
		dataType: 'html',
		success: function(data){
		 	$('#searchResult').html(data);
		 	console.log("yabi");
		},
		error: function(){
		console.log('something wrong happened');
		alert("oops");
		}
	});	
});