$(document).ready(function(){
  var siteId = $('#site-show-map').data("id")

  if (top.location.pathname === '/sites/' + siteId)
  {
    $.ajax({
        url: '/api/v1/sites/' + siteId,
        method: "GET",
        dataType: "JSON",
        success: function(data){
                  initMap(data);
                }
    });

    function initMap(data){
      var mapDiv = document.getElementById('site-show-map');

      var map = new google.maps.Map(mapDiv, {
          center: {lng: parseFloat(data.longitude), lat: parseFloat(data.latitude)},
          zoom: 5
      });

      var setMarkers = function(data){

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        var contentString = '<div id="content">'+
                  '<div id="siteNotice">'+
                  '</div>'+
                  '<h1 id="firstHeading" class="firstHeading"><a href="/sites/' + data.id + '">' + data.name + '</a></h1>' +
                  '<div id="bodyContent">'+
                  '<p>' + data.description + '</p>'+
                  '</div>'+
                  '</div>';

        var siteLatLng = {lng: parseFloat(data.longitude), lat: parseFloat(data.latitude)};

        if (data.status === "Sick"){
          var statusMarkerIcon = 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
        } else {
          var statusMarkerIcon = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
        }

        var marker = new google.maps.Marker({
                position: siteLatLng,
                map: map,
                info: contentString,
                icon: statusMarkerIcon
        });

        google.maps.event.addListener(marker, 'click', function(){
          infowindow.setContent(this.info);
          infowindow.open(map, this);
        });
      };

      setMarkers(data);
    };
  }
});
