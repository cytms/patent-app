$("#companySubmit").click(function(){
	//console.log("pass "+ $("#companyIn").val());
	$.ajax({
		type : "GET", 
		url  : "/searchCompany",
		data : { companyIn : $("#companyIn").val() },
		dataType : 'text',
		success : function( results ){
			var arrayObj = JSON.parse(results);
			$('.after').css('display', 'block');
			var total = arrayObj.length;
			var i = 0;
			//console.log(total);
			while( i < total )
			{
				$("#analysisSubmit").before( '<input class="aName" type="checkbox" name="aName" value="' + arrayObj[i] + '">' + arrayObj[i] + '</input></br>');
				i += 1;
			}
		},
		error : function(){
			//console.log( 'something wrong happened' );
		}
	}).done(function(){
		//console.log("ending");
	});
});


$("#analysisSubmit").click(function() {
	var a = $("endTime").attr("value");
	var b = $("beginTime").attr("value");
	if ((a-b) < 0)
		window.alert("ending time should be later than beginning time");
	else{
		var list = new Object();
		list["Assignee"] = new Array();
		list["Time"] = new Array();
		$("input[name=aName]").each( function(){ 
			if(this.checked == true ){
				list["Assignee"].push(this.value);
			}
		});
		
		for( var i = $("#beginTime").attr("value"); i <= $("#endTime").attr("value"); i++ ){
			list["Time"].push(i);
		}

	/*
		$.ajax({
			type : "GET",
			url  : "/editfriend",
			data : { editfriend : list },
			dataType: 'text',
			success : function(friendlist){
				console.log("recall:"+ friendlist );
				console.log('searching ');
			},
			error : function(){
				console.log( 'something wrong happened' );
			}
		}).done(function(){
				console.log("complete!");
		});
	*/
		console.log("submit: " + list["Assignee"] + list["Time"]);
	}
});
