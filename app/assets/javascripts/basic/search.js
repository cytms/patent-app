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

$( "#submitASS" ).live("click",function(){
	//var x = document.forms["searchASS"]["companyIn"].value;
	//alert(x);
	$.ajax({
		type : "GET", 
		url: "/basic/searchASS",
		data: { ASS: $('input[name="companyIn"]').val() },
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

$( "#submitTITLE" ).live("click",function(){
	//var x = document.forms["searchASS"]["companyIn"].value;
	//alert(x);
	$.ajax({
		type : "GET", 
		url: "/basic/searchTITLE",
		data: { TITLE: $('input[name="TITLE"]').val() },
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