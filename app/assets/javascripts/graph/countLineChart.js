/* countLineChart.js */
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "/statistics/countLineChart",
		dataType : 'html',
		data : { 'assigneeName': $('#assigneeName').attr('value'),
				 'beginTime': $('#beginTime').attr('value'),
				 'endTime': $('#endTime').attr('value') },
		success : function(countLineChartHtml){
			$('#countLineChart').html(countLineChartHtml);
		},
		error : function(){
			console.log('countLineChart wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});
