document.addEventListener('DOMContentLoaded', function () {
  if (document.querySelectorAll('#map').length > 0)
  {
    if (document.querySelector('html').lang)
      lang = document.querySelector('html').lang;
    else
      lang = 'en';

    var js_file = document.createElement('script');
    js_file.type = 'text/javascript';
    js_file.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBw8_a2A3kQG70-XYPjd6jowVpHaj0xasQ&callback=initMap&language=' + lang;
    document.getElementsByTagName('head')[0].appendChild(js_file);
  }
});

function initMap() {
   var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 18,
      center: {lat: 32.709507, lng: -117.157984},
      mapTypeControl: true,
      mapTypeControlOptions: {
          style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
          position: google.maps.ControlPosition.TOP_CENTER
      },
      zoomControl: true,
      zoomControlOptions: {
          position: google.maps.ControlPosition.LEFT_CENTER
      },
      scaleControl: true,
      streetViewControl: true,
      streetViewControlOptions: {
          position: google.maps.ControlPosition.LEFT_TOP
      },
      fullscreenControl: true,
      animation: google.maps.Animation.DROP,
      title: 'Hello World!'

  });

  fetch('/condos.json', { credentials: 'include' })
  .then(function(response){return response.json()})
  .then(plotMarkers);
}

var markers;
var bounds;
function plotMarkers(m) {
    // If statement to show the default map when there is no markers
    if (m.length == 0){
      return
    }
    markers = [];
    bounds = new google.maps.LatLngBounds();

    m.forEach(function (marker) {
      var position = new google.maps.LatLng(marker.latittude, marker.longitude);

      markers.push(
        new google.maps.Marker({
          position: position,
          map: map,
          zoom: 1,
          animation: google.maps.Animation.DROP
        })
      );
      bounds.extend(position);
    });
    map.fitBounds(bounds);

}
