/* patentList.js */
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "/statistics/patentList",
		dataType : 'html',
		data : { 'assigneeName': $('#assigneeName').attr('value'),
				 'beginTime': $('#beginTime').attr('value'),
				 'endTime': $('#endTime').attr('value') },
		success : function(patentListHtml){
			$('#patentList').html(patentListHtml);
		},
		error : function(){
			console.log('patentList wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});
