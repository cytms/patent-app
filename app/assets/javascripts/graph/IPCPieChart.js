/* IPCPieChart.js */
$.ajax({
	type : "GET", 
	url  : "../graph/IPCPieChart",
	dataType : 'html',
	success : function(IPCPieChartHtml){
		$('#IPCPieChart').html(IPCPieChartHtml);
		console.log('success!');
		console.log(IPCPieChartHtml);
		console.log(bodyHtml);
	},
	error : function(){
		console.log('something wrong happened');
	}
}).done(function(){
	console.log("ending");
});