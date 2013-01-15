// chart.js
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "/cluster/chart",
		dataType : 'html',
		success : function(IRContentHtml){
			$('#ir-content').html(IRContentHtml);
		},
		error : function(){
			console.log('listPatent wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});
$('div#listCartPatent').popover();
// $('#listCartPatent').live.tooltip();