function initMap(){function n(e){$("#building_longitude").val(e.lng()),$("#building_latitude").val(e.lat()),$("#building_longitude").trigger("change"),$("#building_latitude").trigger("change")}var e={lat:30.0444,lng:31.2357},o=new google.maps.Map(document.getElementById("map"),{zoom:8,center:e});google.maps.event.addListener(o,"click",function(e){marker&&marker.setMap(null),marker=new google.maps.Marker({position:e.latLng,map:o,draggable:!0}),n(e.latLng),marker.addListener("dragend",function(e){n(e.latLng)})}),o.addListener("center_changed",function(){window.setTimeout(function(){o.panTo(marker.getPosition())},3e3)});var t=document.getElementById("pac-input"),a=new google.maps.places.Autocomplete(t);a.bindTo("bounds",o);var g=new google.maps.InfoWindow;marker=new google.maps.Marker({map:o,anchorPoint:new google.maps.Point(0,-29),draggable:!0}),google.maps.event.addListener(a,"place_changed",function(){g.close();var e=a.getPlace();e.geometry&&(e.geometry.viewport?o.fitBounds(e.geometry.viewport):(o.setCenter(e.geometry.location),o.setZoom(17)),marker.setPosition(e.geometry.location),n(e.geometry.location))})}