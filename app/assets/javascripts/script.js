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
// Initialize the Google map to a certain location
function initMap() {
   var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 18,
      center: {lat: 32.709507, lng: -117.157984},
      mapTypeControl: true,
      // Map/Satellite button control
      mapTypeControlOptions: {
          style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
          position: google.maps.ControlPosition.TOP_CENTER
      },
      // Zoom control
      zoomControl: true,
      // Zoom Position
      zoomControlOptions: {
          position: google.maps.ControlPosition.LEFT_CENTER
      },
      //Scale of the map
      scaleControl: true,
      // Street view control
      streetViewControl: true,
      // Street view position
      streetViewControlOptions: {
          position: google.maps.ControlPosition.LEFT_TOP
      }
  });

// Get the json file for the list of the markers
  fetch('/condos.json', { credentials: 'include' })
  .then(function(response){return response.json()})
  .then(plotMarkers);
}

var markers;
var bounds;

// Plots all the markers depending on the json file/DB
function plotMarkers(m) {
    // If statement to show the default map when there is no markers
    if (m.length == 0){
      return
    }
    markers = [];
    bounds = new google.maps.LatLngBounds();
    // Run thru the list of condos to pull the Lat and Lng
    m.forEach(function (marker) {
      var position = new google.maps.LatLng(marker.latittude, marker.longitude);
      // Adds the marker to the map
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
    // Fits the map to center over all the markers
    map.fitBounds(bounds);

}
