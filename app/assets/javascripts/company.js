/*$( ".aName" ).click(function() {
	if( !$(this).children("input[name=checkable]").is(':checked') ){
		$(this).children("input[name=checkable]").attr("checked", true);

	}
	else{
		$(this).children("input[name=checkable]").attr("checked", false);		
	};
});
*/
$("#companySubmit").click(function(){
	console.log("pass "+ $("#companyIn").val());
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
			console.log(total);
			while( i < total )
			{
				$("#possibleNames").append( '<input class="aName" type="checkbox" name="aName" value="' + arrayObj[i] + '">' + arrayObj[i] + '</input></br>');
				i += 1;
			}
		},
		error : function(){
			console.log( 'something wrong happened' );
		}
	}).done(function(){
		console.log("ending");
	});
});

$("#analysisSubmit").click(function() {

	var list = new Array();
	$("input[name=aName]").each( function(){ 
		if(this.checked == true ){
			list.push(this.value);
		}
	});
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
	console.log("submit: " + list);

});