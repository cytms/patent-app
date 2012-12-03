/* patentList.js */
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "/statistics/patentList",
		dataType : 'html',
		success : function(patentListHtml){
			$('#patentList').html(patentListHtml);
		},
		error : function(){
			console.log('something wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});
