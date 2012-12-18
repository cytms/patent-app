$(document).ready(function() {
	for(var i=0; i<24; i++){
		for(var j=0; j<32; j++){
			var grid = '<div class="map-grid"></div>';
			if(i==0 && j==0){
				grid = '<div class="map-grid .grid-first-row grid-first-column"></div>';
			}
			else if(i==0){
				grid = '<div class="map-grid .grid-first-row"></div>';
			}
			else if(j==0){
				grid = '<div class="map-grid grid-first-column"></div>';
			}
			$('.map-content#1 .map-img').append(grid);
		}
	}
});