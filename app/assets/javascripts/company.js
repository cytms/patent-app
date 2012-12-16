$('a#companySubmit').popover();


$("#companySubmit").click(function(){
	if($("#companyIn").val()){
		$("#nameSet .span6").slideUp('slow');
		$("#companySubmit").attr('disabled', 'disabled');	
		$.ajax({
			type : "GET", 
			url  : "/statistics/searchCompany",
			data : { companyIn : $("#companyIn").val() },
			dataType : 'json',
			beforeSend: function(){
				$('.loader').show();
			}, 
			success: function( results ){
				console.log(results);
				var optionResult = '<div class="assigneeOpt"><input class="aName" type="checkbox" name="assigneeName[]" value="'+$("#companyIn").val()+'"><span class="aNameSpan" id="0">' + $("#companyIn").val() + '</span></input></div>';
				for(var i=0; i<results.length; i++){
					var tmp = '<div class="assigneeOpt"><input class="aName" type="checkbox" name="assigneeName[]" value="'+results[i]+'"><span class="aNameSpan" id="'+(i+1)+'">' + results[i] + '</span></input></div>';
					optionResult += tmp;
				}
				$("#nameSet .span6").html(optionResult);
				$("#nameSet .span6").slideDown('slow');
			},
			error: function(){
				//console.log( 'something wrong happened' );
			}
		}).done(function(){
			$("#companySubmit").removeAttr("disabled");
			$('.loader').hide();
			//console.log("ending");
		});
	}
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