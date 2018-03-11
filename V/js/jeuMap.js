var mapJeu;
var latSelect;
var lngSelect;

$(document).ready(function() {

    var lieux;
    var numPartie;
    var nomPartie;
    
    // Masque les elements de partie par defaut
    document.getElementById("partie").style.display = "none";
    
    // Click sur un boutton de choix
    $(".btnChoix").click(function (){
        
        numPartie = $(this).attr('name');
        nomPartie = $(this).parent().parent().parent().find("h3").text();
        $("#nomPartie").text(nomPartie);
        
        // Affiche le jeux
        $("#choixPartie").css("display", "none");
        $("#partie").css("display", "block");

        // Désactive les boutons avant la requete
        $(".btnChoix").prop("disabled", true);
        requestLieux = $.ajax({
            url: "index.php?controle=user&action=getLieux",
            type: "post",
            data: {
                'partie': numPartie
            }
        });
        
        requestLieux.done(function(response, textStatus){
            lieux = response;
        });
        
        // Réactive les boutons
        requestLieux.always(function(){
            $(".btnChoix").prop("disabled", false);
        });
        
        // Recharge la carte
        mapJeu.invalidateSize();
		
		// Met en place la streetview du lieu
		var sv = new google.maps.StreetViewService();
        var panorama = new google.maps.StreetViewPanorama(document.getElementById('streetview'));
		//mettre ce qui suit dans une fonction qui prend en compte le numéro du lieu dans la partie
		sv.getPanorama({location: new LatLng(lieux[/**/][lattitude], lieux[/**/][longitude]), radius: 50}, function(data, status) {
			if (status === 'OK') {
				panorama.setPano(data.location.pano);
				panorama.setPov({
					heading: 270,
					pitch: 0
				});
			}
			else {
				alert('Street View data not found for this location.');
			}
		});
    });
    
    $("#btnValider").click(function(){
        alert('oui');
        getPays();
    });
    
    //Chargement initial de la MAP
    mapJeu = L.map('map').setView([51.505, -0.09], 13);
    
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
			'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery © <a href="http://mapbox.com">Mapbox</a>',
		id: 'mapbox.streets'
	}).addTo(mapJeu);

	
	//enregistrement des coordonnées en cas de click
	mapJeu.on('click', function(e) {
		latSelect = e.latlng.lat;
		lngSelect = e.latlng.lng;
	});
	
	/*
	$.each(lieux, function(i, obj) {
		alert(obj.ville);
	});
	*/
	
	//init droppable/draggable
	/*$( "#persodraggable" ).draggable({ snap: "#map", snapMode: "inner" });
	$( "#map" ).droppable({
		drop: function( event, ui ) {
		$( this )
			.addClass( "ui-state-highlight" )
			.find( "p" )
			.html( "Dropped!" );
		}
	});*/
    
    
	
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

	
	

});

function placerLieu() {
    L.marker([latSelect, lngSelect]).addTo(mapJeu);
}

function getPays() {
	requestPays = $.ajax({
        url: "https://maps.googleapis.com/maps/api/geocode/json",
        type: "get",
		data: {
			latlng: latSelect + "," + lngSelect,
			language: "fr",
			result_type: "country",
			key: "AIzaSyC7j_mUbyjKf3e2FXomIVbDoYDkGLreQO8"
		}	
          
    });
	requestPays.done(function(data, status) {
		alert(JSON.stringify(data));
        alert(data['results'][0]['address_components'][0]['long_name']);
    });
}







