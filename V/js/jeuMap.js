window.onload = function () {

    //Chargement initial de la MAP
    var map = L.map('map').setView([14,-14.8883335],4);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'PING'}).addTo(map);

}