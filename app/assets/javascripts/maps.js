$(document).ready(function(){
  initMap();
});

function initMap(){
  var mapDiv = document.getElementById('all-sites-map');
  var map = new google.maps.Map(mapDiv, {
      center: {lat: 39.83, lng: -98.58},
      zoom: 4
  });
};
