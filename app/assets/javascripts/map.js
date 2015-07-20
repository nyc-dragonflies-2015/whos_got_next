var placeSearch, autocomplete, getDestination, map, pos, center;

function initialize() {

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
    center = new google.maps.LatLng(
            position.coords.latitude, position.coords.longitude);
    var mapOptions = {
      zoom: 15,
      center: center,
      mapTypeId:google.maps.MapTypeId.ROADMAP
    };
      map = new google.maps.Map(document.getElementById("googleMap"),mapOptions);
      var marker=new google.maps.Marker({
        position: center,
        });
      marker.setMap(map);
    });
  }

  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')));

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    getDestination = [autocomplete.gm_accessors_.place.Pc.place.geometry.location["A"],autocomplete.gm_accessors_.place.Pc.place.geometry.location["F"]]
  });
}

function geolocate() {

  var destination = $('#autocomplete').val();
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      pos = new google.maps.LatLng(
          position.coords.latitude, position.coords.longitude);
      var directionsService = new google.maps.DirectionsService();
      var directionsDisplay = new google.maps.DirectionsRenderer();
      directionsDisplay.setMap(map);
      directionsDisplay.setPanel(document.getElementById('map-canvas'));
      var request = {
        origin: pos,
        destination: destination,
        travelMode: google.maps.DirectionsTravelMode.TRANSIT
      };
     directionsService.route(request, function (response, status) {
         if (status == google.maps.DirectionsStatus.OK) {
           directionsDisplay.setDirections(response);
         }
       });
    });
  }
}