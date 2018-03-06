window.onload = function () {

    // Masque les elements de partie par defaut
    document.getElementById("partie").style.display = "none";
    
    //Chargement initial de la MAP
    var map = L.map('map').setView([14,-14.8883335],2);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
	
	//init droppable/draggable
	$( "#persodraggable" ).draggable({ snap: "#map", snapMode: "inner" });
	$( "#map" ).droppable({
		drop: function( event, ui ) {
		$( this )
			.addClass( "ui-state-highlight" )
			.find( "p" )
			.html( "Dropped!" );
		}
	});
	
	/* ne marche pas, essayer plutot de mettre la map en droppable et récupérer les coordonnées où est droppé la draggable
	var cz = L.circle([50.5, 30.5], {radius: 20});
	cz.addTo(map);
	cz.droppable({
		drop: function(event, ui) {
			alert("circle droppable");
		}		
			
	});
	*/
	
    /* key API google AIzaSyC6vrb1AQkk7wg9iduRGMUb4gwfBBJnYRQ */
    /* https://maps.googleapis.com/maps/api/streetview?size=600x300&location=Sagrada%20Familia%20Espagne&key=AIzaSyC6vrb1AQkk7wg9iduRGMUb4gwfBBJnYRQ */

	
	

}

