/* countLineChart.js */
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "../graph/countLineChart",
		dataType : 'html',
		success : function(countLineChartHtml){
			$('#countLineChart').html(countLineChartHtml);
		},
		error : function(){
			console.log('something wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});