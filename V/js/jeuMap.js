var mapJeu;
var latSelect;
var lngSelect;
var lieux;
var countLieu;
var clickedCountry;
var marker;
var score;

$(document).ready(function() {


    var numPartie;
    var nomPartie;
    score = 0;

    // Masque les elements de partie par defaut
    $("#partie").hide();

    // Click sur un boutton de choix
    $(".btnChoix").click(function (){

        numPartie = $(this).attr('name');
        nomPartie = $(this).parent().parent().parent().find("h3").text();
        $("#nomPartie").text(nomPartie);

        // Affiche le jeux
        $("#choixPartie").hide();
        $("#partie").show();

        // Désactive les boutons avant la requete
        $(".btnChoix").prop("disabled", true);

        // Requete des lieux
        requestLieux = $.ajax({
            url: "index.php?controle=user&action=getLieux",
            type: "post",
            data: {
                'partie': numPartie
            }
        });

        requestLieux.done(function(response, textStatus){
            lieux = JSON.parse(response);
            countLieu = 0;
            
            // Affiche le num du lieu en cours
            $("#lieuEnCours").text((countLieu + 1) + " / " + lieux["data"].length);
            
            // Charge le streetview
            initializeSV();
        });

        // Réactive les boutons
        requestLieux.always(function(){
            $(".btnChoix").prop("disabled", false);
        });

        // Recharge la carte
        mapJeu.invalidateSize();

    });

    $("#btnValider").click(function(){
        // Récupère le pays cliqué
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
            clickedCountry = data['results'][0]['address_components'][0]['long_name'];
            if(clickedCountry == lieux['data'][countLieu]['pays']) {
                // Bonne réponse
                $("#alert").text("Oui!");
                
                // Rajoute un point
                score++;
            }
            else {
                // Mauvaise réponse
                $("#alert").text("Non!");
            }
            // Ajoute le corrigé
            $("#alert").text($("#alert").text() + " Le Lieu était : " + 
                             lieux['data'][countLieu]['nomLieu'] + " , " +
                             lieux['data'][countLieu]['pays']);
            
            // Passe au lieu suivant
            countLieu++;
            if(countLieu < lieux['data'].length) {
                // Change le num du lieu affiché
                $("#lieuEnCours").text((countLieu + 1) + " / " + lieux["data"].length);
                
                // Rechargement du streetview
                initializeSV()
            }
            else {
                // Fin de partie
                
                // Masque les controles
                $("#lieuEnCours").text("Fin du jeu! score : " + score + " / " + lieux['data'].length);
                $("#map").hide();
                $("#blockBetween").hide();
                $("#streetview").hide();
                
                // Ajax pour l'enregistrement du score
                requestSave = $.ajax({
                    url: "index.php?controle=user&action=savePartie",
                    type: "post",
                    data: {
                        idPartie: numPartie,
                        scoreJoueur: score
                    }
                });
            }
        });
        requestPays.fail(function() {
            clickedCountry = "";
        });

    });

    loadMap();


    /* key API google AIzaSyC6vrb1AQkk7wg9iduRGMUb4gwfBBJnYRQ */
    /* https://maps.googleapis.com/maps/api/streetview?size=600x300&location=Sagrada%20Familia%20Espagne&key=AIzaSyC6vrb1AQkk7wg9iduRGMUb4gwfBBJnYRQ */

    //enregistrement des coordonnées en cas de click
    marker = null;
    mapJeu.on('click', function(e) {
        //enregistrement des coordonnées en cas de click
        latSelect = e.latlng.lat;
        lngSelect = e.latlng.lng;
        if(marker !== null) {
            mapJeu.removeLayer(marker);
        }
        marker = placerLieu();
        
        // Afichage du nom du pays
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
            clickedCountry = data['results'][0]['address_components'][0]['long_name'];
        });
        requestPays.fail(function() {
            clickedCountry = "";
        });
        requestPays.always(function() {
            $("#textPays").text(clickedCountry);
        });
    });


});

function placerLieu() {
    return L.marker([latSelect, lngSelect]).addTo(mapJeu);
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
        clickedCountry = data['results'][0]['address_components'][0]['long_name'];
    });
    requestPays.fail(function() {
        clickedCountry = "";
    });
}

function initializeSV() {
    var posSV = {lat: parseFloat(lieux['data'][countLieu]['lattitude']), lng: parseFloat(lieux['data'][countLieu]['longitude'])};

    var panorama = new google.maps.StreetViewPanorama(
        document.getElementById('streetview'), {
            position: posSV,
            pov: {
                heading: 34,
                pitch: 10
            },
            motionTracking: false,
            motionTrackingControl: false,
            addressControl: false,
            zoomControl: false,
            fullscreenControl: false,
            linksControl: false,
            imageDateControl: false
        });
}

function loadMap() {
    //Chargement initial de la MAP
    mapJeu = L.map('map').setView([51.505, -0.09], 2);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        maxZoom: 18,
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
        id: 'mapbox.dark'
    }).addTo(mapJeu);


    
}







