$(document).ready(function() {
    initMap();
});

function initMap() {
  var mapDiv = document.getElementById('all-sites-map');
  var map = new google.maps.Map(mapDiv, {
      center: {lat: 39.8333333, lng: -98.585522},
      zoom: 4
  });
}
