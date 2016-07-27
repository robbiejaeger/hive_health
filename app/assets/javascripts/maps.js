$(document).ready(function(){

  $.ajax({
      url: "http://localhost:3000/api/v1/sites",
      method: "GET",
      dataType: "JSON",
      success: function(data){
                initMap(data);
              }
  });

});

function initMap(data){
  var mapDiv = document.getElementById('all-sites-map');

  var map = new google.maps.Map(mapDiv, {
      center: {lat: 39.83, lng: -98.58},
      zoom: 4
  });

  var setMarkers = function(data){
      for (var i = 0; i < data.length; i++){

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        var contentString = '<div id="content">'+
                  '<div id="siteNotice">'+
                  '</div>'+
                  '<h1 id="firstHeading" class="firstHeading">' + data[i].name + '</h1>'+
                  '<div id="bodyContent">'+
                  '<p>Marker content!</p>'+
                  '</div>'+
                  '</div>';

        var siteLatLng = {lng: parseFloat(data[i].latitude), lat: parseFloat(data[i].longitude)};

        var marker = new google.maps.Marker({
                position: siteLatLng,
                map: map,
                title: 'Hello World!',
                info: contentString
        });

        google.maps.event.addListener(marker, 'click', function(){
          infowindow.setContent(this.info);
          infowindow.open(map, this);
        });
      }
  };

  setMarkers(data);
};
