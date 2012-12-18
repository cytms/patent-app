$( "#submitID" ).live("click",function(){
	//var x = document.forms["testForm"]["patentID"].value;
	//alert(x);
	$.ajax({
		type : "GET", 
		url: "/basic/searchPID",
		data: { patentID: $('input[name="patentID"]').val() },
		dataType: 'html',
		beforeSend: function(){
			$('.loader#basicPID').show();
		}, 
		success: function(data){
		 	$('#searchResult').html(data);
		 	console.log("yabi");
		},
		error: function(){
			$('.loader#basicTITLE').hide();
			$('#searchResult').html('<h4>Search Error.</h4>');
			console.log('something wrong happened');
		}
	}).done(function(){
		$('.loader#basicPID').hide();
		console.log("ending");
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
		beforeSend: function(){
			$('.loader#basicINV').show();
		}, 
		success: function(data){
		 	//alert("YA");
		 	$('#searchResult').html(data);
		 	console.log("yabi");
		},
		error: function(){
			$('.loader#basicTITLE').hide();
			$('#searchResult').html('<h4>Search Error.</h4>');
			console.log('something wrong happened');
		}
	}).done(function(){
		$('.loader#basicINV').hide();
		console.log("ending");
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
		beforeSend: function(){
			$('.loader#basicASS').show();
		}, 
		success: function(data){
		 	$('#searchResult').html(data);
		},
		error: function(){
			$('.loader#basicTITLE').hide();
			$('#searchResult').html('<h4>Search Error.</h4>');
			console.log('something wrong happened');
		}
	}).done(function(){
		$('.loader#basicASS').hide();
		console.log("ending");
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
		beforeSend: function(){
			$('.loader#basicTITLE').show();
		}, 
		success: function(data){
		 	//alert("YA");
		 	$('#searchResult').html(data);
		 	console.log("yabi");
		},
		error: function(){
			$('.loader#basicTITLE').hide();
			$('#searchResult').html('<h4>Search Error.</h4>');
			console.log('something wrong happened');
		}
	}).done(function(){
		$('.loader#basicTITLE').hide();
		console.log("ending");
	});	
});