// function initialize(){
//   var map;
//   var pos;

//   var mapOptions = {
//     zoom: 13,
//     center: pos
//   };

//   // When the user selects an address from the dropdown,
//   // populate the address fields in the form.

//   map = new google.maps.Map(document.getElementById('googleMap'),
//       mapOptions);

//   if(navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
//       var directionsService = new google.maps.DirectionsService();
//       var directionsDisplay = new google.maps.DirectionsRenderer();
//       directionsDisplay.setMap(map);
//       directionsDisplay.setPanel(document.getElementById('map-canvas'));
//       var request = {
//         origin: pos,
//         destination: "55 clark street",
//         travelMode: google.maps.DirectionsTravelMode.TRANSIT
//       };

//    directionsService.route(request, function (response, status) {
//          if (status == google.maps.DirectionsStatus.OK) {
//            directionsDisplay.setDirections(response);
//          }
//        });
//       map.setCenter(pos);
//     }, function() {
//       handleNoGeolocation(true);
//     });
//   } else {
//     handleNoGeolocation(false);
//   }
// }

// function handleNoGeolocation(errorFlag) {
//   if (errorFlag) {
//     var content = 'Error: The Geolocation service failed.';
//   } else {
//     var content = 'Error: Your browser doesn\'t support geolocation.';
//   }

//   var options = {
//     map: map,
//     position: new google.maps.LatLng(60, 105),
//     content: content
//   };

//   var infowindow = new google.maps.InfoWindow(options);
//   map.setCenter(options.position);
// }
var placeSearch, autocomplete, getDestination, map, pos;

function initialize(event) {
  var destination = $('#autocomplete').val();

  var mapOptions = {
    zoom: 13,
    center: pos
  };

    map = new google.maps.Map(document.getElementById('googleMap'),
      mapOptions);

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