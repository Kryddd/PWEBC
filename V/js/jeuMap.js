var mapJeu;
var latSelect;
var lngSelect;
var lieux;
var countLieu;
var clickedCountry;

$(document).ready(function() {


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
            console.log(lieux["data"].length);
            countLieu = 0;
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
                $("#alert").text("Oui!");
            }
            else {
                $("#alert").text("Non!");
            }
        });
        requestPays.fail(function() {
            clickedCountry = "";
        });

    });

    loadMap();


    /* key API google AIzaSyC6vrb1AQkk7wg9iduRGMUb4gwfBBJnYRQ */
    /* https://maps.googleapis.com/maps/api/streetview?size=600x300&location=Sagrada%20Familia%20Espagne&key=AIzaSyC6vrb1AQkk7wg9iduRGMUb4gwfBBJnYRQ */




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


    //enregistrement des coordonnées en cas de click
    var marker = null;
    mapJeu.on('click', function(e) {
        latSelect = e.latlng.lat;
        lngSelect = e.latlng.lng;
        if(marker !== null) {
            mapJeu.removeLayer(marker);
        }
        marker = placerLieu();
    });
}







