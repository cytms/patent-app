/* IPCPieChart.js */
$.ajax({
	type : "GET", 
	url  : "/statistics/IPCPieChart",
	dataType : 'html',
	data : { 'assigneeName': $('#assigneeName').attr('value'),
				 'beginTime': $('#beginTime').attr('value'),
				 'endTime': $('#endTime').attr('value') },
	success : function(IPCPieChartHtml){
		$('#IPCPieChart').html(IPCPieChartHtml);
	},
	error : function(){
		console.log('IPCPieChart wrong happened');
	}
}).done(function(){
	console.log("ending");
});