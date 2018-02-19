<html>
<head>
	<script src="../js/jeuMap.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
			$( "#persodraggable" ).draggable();
			$( "#map" ).droppable({
				drop: function( event, ui ) {
					$( this )
					.addClass( "ui-state-highlight" )
					.find( "p" )
					.html( "Dropped!" );
				}
			});
		} );
	</script>
</head>

<body>
	<div id="map" class="ui-widget-header" style="width: 150px; height: 150px; padding: 0.5em; float: left; margin: 10px;"></div>
	<div id="persodraggable" class="ui-widget-content" style="width: 100px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0;"></div>
</body>
</html>