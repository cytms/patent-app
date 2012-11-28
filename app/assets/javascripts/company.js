$("#companySubmit").click(function(){
	//console.log("pass "+ $("#companyIn").val());
	$.ajax({
		type : "GET", 
		url  : "/statistics/searchCompany",
		data : { companyIn : $("#companyIn").val() },
		dataType : 'text',
		success : function( results ){
			var arrayObj = JSON.parse(results);
			$('#nameSet').css('display', 'block');
			var total = arrayObj.length;
			var i = 0;
			//console.log(total);
			var optionResult = "";
			while( i < total )
			{
				var str =  arrayObj[i];
				var tmp = '<input class="aName" type="checkbox" name="Assignee" value="' + arrayObj[i] + '">' + arrayObj[i] + '</input></br>';
				optionResult += tmp;
				i += 1;
			}
			//alert(optionResult);
			$("#nameSet").html(optionResult);
		},
		error : function(){
			//console.log( 'something wrong happened' );
		}
	}).done(function(){
		//console.log("ending");
	});
});

/*
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
		console.log("submit: " + list["Assignee"] + list["Time"]);
	}
});
*/