$("#addCartPatent").live("click",function(){
	$.ajax({
		type : "GET", 
		url  : "/cart/addPatent",
		data : { patentID : $("#patentID").text().split(":")[1].replace(/^\s+|\s+$/g, ''),
				 year : $("#issued_date").text().split(":")[1].replace(/^\s+|\s+$/g, '').split("-")[0],
				 title : $("#title").text().split(":")[1].replace(/^\s+|\s+$/g, ''),
				 assignee : $("#assignee").text().split(":")[1].replace(/^\s+|\s+$/g, '') },
		dataType : 'json',
		beforeSend: function(){
			$('.loader').show();
		}, 
		success: function( results ){
			console.log(results);
			$("#addCartPatent").html('<i class="icon-shopping-cart"></i>Added into My Patent Cart')
			//turn to unclickable?
			
		},
		error: function(){
			console.log( 'addCart: something wrong happened' );
		}
	}).done(function(){
		$('.loader').hide();
	});
});