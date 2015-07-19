
function initialize(){
  var myCenter=new google.maps.LatLng(40.705791,-74.008499);


  var mapProp = {
    center:myCenter,
    zoom:13,
    mapTypeId:google.maps.MapTypeId.ROADMAP
    };

  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

  var marker=new google.maps.Marker({
    position:myCenter,
    });

  marker.setMap(map);
}
