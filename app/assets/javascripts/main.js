$( document ).ready(function() {
  $.get( "/posts", function( data ) {
    initializeMap(data);
  });
});

function initializeMap(crumbs) {
  var handler = Gmaps.build('Google');

  handler.buildMap(
    { provider: {}, internal: {id: 'map'} },
    function(){
      var markers = handler.addMarkers(
        crumbs.map( function(crumb){
          return {
            "lat": crumb.latitude,
            "lng": crumb.longitude,
            "infowindow": crumb.title + "<img class='info-image' src=" + crumb.image_url + " alt='Marker info' position= 'absolute' height='100%' width='100%'>"
          }
        })
      );
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
}
