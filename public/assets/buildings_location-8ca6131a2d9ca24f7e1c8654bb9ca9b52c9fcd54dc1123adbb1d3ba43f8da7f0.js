function initMap() {

  var myLatlng = {lat: 30.0444, lng: 31.2357};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: myLatlng
  });

  google.maps.event.addListener(map, 'click', function(event) {

    // if the previousMarker exists, remove it
    if (marker)
      marker.setMap(null);

    marker = new google.maps.Marker({
      position: event.latLng,
      map: map,
      draggable: true
    });

    updateLocation(event.latLng);

     marker.addListener('dragend', function(event) {
      updateLocation(event.latLng);
    });
  });



  map.addListener('center_changed', function() {
    // 3 seconds after the center of the map has changed, pan back to the
    // marker.
    window.setTimeout(function() {
      map.panTo(marker.getPosition());
    }, 3000);
  });



  // get places auto-complete when user type in location-text-box
  var input = (document.getElementById('pac-input'));

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29),
    draggable: true
  });


  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    // marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17); // Why 17? Because it looks good.
    }

    marker.setPosition(place.geometry.location);
    // marker.setVisible(true);

    // update location
    updateLocation(place.geometry.location);
  });

  function updateLocation(evt){
    $('#building_longitude').val(evt.lng());
    $('#building_latitude').val(evt.lat());
    $('#building_longitude').trigger('change');
    $('#building_latitude').trigger('change');
  }


}
;
