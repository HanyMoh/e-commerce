if ($('.gates').val().length > 0) {
  var gates = JSON.parse($('.gates').val());
}
if ($('.beacons').val().length > 0) {
  var beacons = JSON.parse($('.beacons').val());
}
if ($('.corridors').val().length > 0) {
  var corridors = JSON.parse($('.corridors').val());
}

(function(){
    DebugOverlay.prototype = new google.maps.OverlayView();

    function initialize() {
      var mapOptions = {
        zoom: 13,
        center: loc_center
      };

      var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      var swBound = new google.maps.LatLng(loc_center.lat() - k_diff, loc_center.lng() - D_diff);
      var neBound = new google.maps.LatLng(loc_center.lat() + k_diff, loc_center.lng() + D_diff);
      var bounds = new google.maps.LatLngBounds(swBound, neBound);

      var srcImage = $('#map-canvas').attr('data-image');

      overlay = new DebugOverlay(bounds, srcImage, map);

      //Center marker
      var center_marker = new google.maps.Marker({
        position: loc_center,
        icon: "/move.svg",
        map: map,
        draggable: true,
      });

      google.maps.event.addListener(center_marker,'drag',function() {
        var newPointA = new google.maps.LatLng(center_marker.getPosition().lat() - k_diff, center_marker.getPosition().lng() - D_diff);
        var newPointB = new google.maps.LatLng(center_marker.getPosition().lat() + k_diff, center_marker.getPosition().lng() + D_diff);
        var newBounds = new google.maps.LatLngBounds(newPointA, newPointB);
        var newPointR = new google.maps.LatLng(center_marker.getPosition().lat() + (Math.cos(rot * Math.PI / 180) * 0.005), center_marker.getPosition().lng() + (Math.sin(rot * Math.PI / 180) * 0.005));             
        size_marker.setPosition(newPointB);         
        rotation_marker.setPosition(newPointR);

        overlay.updateBounds(newBounds);
      });

      google.maps.event.addListener(center_marker, 'dragend', function () {
        var newPointA = new google.maps.LatLng(center_marker.getPosition().lat() - k_diff, center_marker.getPosition().lng() - D_diff);
        var newPointB = new google.maps.LatLng(center_marker.getPosition().lat() + k_diff, center_marker.getPosition().lng() + D_diff);

        console.log("point1"+ newPointA);
        console.log("point2"+ newPointB);
      });

      var size_marker = new google.maps.Marker({
        position: new google.maps.LatLng(loc_center.lat() + k_diff, loc_center.lng() + D_diff),
        map: map,
        draggable: true,
        icon: "/resize.svg"
      });

      google.maps.event.addListener(size_marker, 'drag', function() {
        k_diff = (size_marker.getPosition().lat() - center_marker.getPosition().lat());
        D_diff = (size_marker.getPosition().lng() - center_marker.getPosition().lng());

        var newPointA = new google.maps.LatLng(center_marker.getPosition().lat() - k_diff, center_marker.getPosition().lng() - D_diff);
        var newPointB = new google.maps.LatLng(center_marker.getPosition().lat() + k_diff, center_marker.getPosition().lng() + D_diff);
        var newBounds = new google.maps.LatLngBounds(newPointA, newPointB);

        console.log("newBounds", newBounds);
        overlay.updateBounds(newBounds);
      });

      google.maps.event.addListener(size_marker, 'dragend', function() {
        var newPointA = new google.maps.LatLng(center_marker.getPosition().lat() - k_diff, center_marker.getPosition().lng() - D_diff);
        var newPointB = new google.maps.LatLng(center_marker.getPosition().lat() + k_diff, center_marker.getPosition().lng() + D_diff);

        console.log("point1" + newPointA);
        console.log("point2" + newPointB);
      });

      var rotation_marker = new google.maps.Marker({
        position: new google.maps.LatLng(loc_center.lat() + k_diff, loc_center.lng()),
        map: map,
        draggable: true,
        icon: "/rotate.svg"
      });

      google.maps.event.addListener(rotation_marker, 'drag', function() {
        k_rotation_diff = rotation_marker.getPosition().lat() - center_marker.getPosition().lat();
        D_rotation_diff = rotation_marker.getPosition().lng() - center_marker.getPosition().lng();
        rot = Math.atan2(D_rotation_diff, k_rotation_diff) * 180 / Math.PI;
        overlay.updateRotation();
      });

      var drawingManager = new google.maps.drawing.DrawingManager({
        drawingControl: true,
        drawingControlOptions: {
          position: google.maps.ControlPosition.TOP_CENTER,
          drawingModes: []
        },
        polygonOptions: {
          fillColor: '#ffff00',
          fillOpacity: 0.6,
          strokeWeight: 1,
          clickable: false,
          editable: true,
          zIndex: 1
        },
        markerOptions: {
          draggable: true
        }
      });
      drawingManager.setMap(map);


      google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
        all_overlays.push(e.overlay);

        var newShape = e.overlay;

        newShape.type = e.type;

        if (e.type !== google.maps.drawing.OverlayType.MARKER) {
          // Switch back to non-drawing mode after drawing a shape.
          drawingManager.setDrawingMode(null);
          // Add an event listener that selects the newly-drawn shape when the user
          // mouses down on it.
          google.maps.event.addListener(newShape, 'click', function (e) {
            if (e.vertex !== undefined) {
              if (newShape.type === google.maps.drawing.OverlayType.POLYGON) {
                var path = newShape.getPaths().getAt(e.path);
                path.removeAt(e.vertex);
                if (path.length < 3) {
                  newShape.setMap(null);
                }
              }
              if (newShape.type === google.maps.drawing.OverlayType.POLYLINE) {
                var path = newShape.getPath();
                path.removeAt(e.vertex);
                if (path.length < 2) {
                  newShape.setMap(null);
                }
              }
            }
            setSelection(newShape);
          });
          setSelection(newShape);
        }
        else {
          google.maps.event.addListener(newShape, 'click', function (e) {
            setSelection(newShape);
          });
          setSelection(newShape);
        }
      });

      // draw retieve beacos data from db 
      beacons.forEach(function(marker) {
        var myLatLng = {lat: marker.latitude, lng: marker.longitude};
        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          label: "B"
        });
      });

      // draw retieve beacos data from db 
      gates.forEach(function(marker) {
        var myLatLng = {lat: marker.latitude, lng: marker.longitude};
        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          label: "G"
        });
      });

      // drwing corridors 
      // Define the LatLng coordinates for the polygon's path.
      var corridorsCoords = [];
      corridors.forEach(function(corridor) {
        corridorsCoords.push({lat: corridor.latitude, lng: corridor.longitude});
      });

      // Construct the polygon.
      var corridorsShape = new google.maps.Polygon({
        paths: corridorsCoords,
        fillColor: '#ffff00',
        fillOpacity: 0.6,
        strokeWeight: 1,
        clickable: false,
        editable: true,
        zIndex: 1
      });
      corridorsShape.setMap(map);



      google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
      google.maps.event.addListener(map, 'click', clearSelection);
      google.maps.event.addDomListener(document.getElementById('deleteButton'), 'click', deleteSelectedShape);
      google.maps.event.addDomListener(document.getElementById('deleteAllButton'), 'click', deleteAllShape);


      // custom btn to draw ways
      $("#custom-BtnPolygon").click(function() {
        drawingManager.setDrawingMode(google.maps.drawing.OverlayType.POLYGON);
      });

      // custom btn to draw ways
      $("#custom-BtnHand").click(function() {
        drawingManager.setDrawingMode(null);
      });

      // custom btn to add gates
      $("#custom-BtnGate").click(function() {
        drawingManager.setOptions({
          markerOptions: {
            label: "G"
          }
        })
        drawingManager.setDrawingMode(google.maps.drawing.OverlayType.MARKER);
      });

      // custom btn to add Bicons
      $("#custom-BtnBicons").click(function() {
        drawingManager.setOptions({
          markerOptions: {
            label: "B",
          }
        })
        drawingManager.setDrawingMode(google.maps.drawing.OverlayType.MARKER);
      });

      //stop draging image
      $("#custom-BtnImg").click(function() {
        center_marker.setDraggable(false);
        rotation_marker.setDraggable(false);
        size_marker.setDraggable(false);
        $("#bgopacity").val("100");
        $("#bgopacity").prop('disabled', true);
        $('#theImg').css({
          opacity: $("#bgopacity").val() * '.01'
        });
      });


      //retrive data
      var removeMarker_flag;
      var currentMarker;

      google.maps.event.addListener(drawingManager, 'markercomplete', function(marker) {
        lat = marker.getPosition().lat();
        lng = marker.getPosition().lng();

        currentMarker = marker;

        // if it's beacon
        if (marker.getLabel() === "B") {
          $('#beaconsModal').modal();
        } 
        removeMarker_flag = true;
      });


      function addBeacons(id){
        currentMarker.location_id = id;
        console.log("currentMarker", currentMarker);

        removeMarker_flag = false;
        $('#beaconsModal').modal('hide');
      }


      function removeBeacons(){
        $('#beaconsModal').modal('hide');
      }


      $('#beaconsModal').on('hidden.bs.modal', function () {
        console.log("removeMarker_flag", removeMarker_flag);

        if (removeMarker_flag) {
          setSelection(currentMarker);
          deleteSelectedShape();
        }
        removeMarker_flag = true;
      })


      $('body').on("click","#submitButton",function(e) {
        var major =  $("input[name=major]").val();
        var minor =  $("input[name=minor]").val();
        var brand_id =  $("select[name=brand_id]").val();
        var originUrl = window.location.origin;
        var currentUrl = window.location.pathname;
        var buildingID = currentUrl.split("/")[3];

        var beaconsURL = window.location.origin +'/admin/buildings/' + buildingID + '/building_levels/get_beacon?major=' + major + '&minor=' + minor + '&brand_id=' + brand_id;

        $(".beaconsModal-loading").show();
        $(".beaconsModal-content").hide();

        $.ajax({type: "GET",
          url: beaconsURL,
          dataType:'json',
          success : function(data) {
            addBeacons(data.beacon.brand_id);
            $(".beaconsModal-loading").hide();
            $(".alert").hide();
            $(".beaconsModal-message").append('<div class="alert alert-success" role="alert"> beacon has been added successfully</div>');
            $(".beaconsModal-content").show();
          },
          error : function(error)
          {
            console.log("error", error.responseText);
            $(".beaconsModal-loading").hide();
            $(".alert").hide();
            $(".beaconsModal-message").append('<div class="alert alert-danger" role="alert">No beacon with this major/minor</div>');
            $(".beaconsModal-content").show();
            removeBeacons();
          }
        });
      });

    }

    function DebugOverlay(bounds, image, map) {
      this.bounds_ = bounds;
      this.image_ = image;
      this.map_ = map;
      this.div_ = null;
      this.setMap(map);
    }

    DebugOverlay.prototype.onAdd = function() {
      var div = document.createElement('div');
      div.style.borderStyle = 'none';
      div.style.borderWidth = '0px';
      div.style.position = 'absolute';
      var img = document.createElement('img');
      img.src = this.image_;
      img.style.width = '100%';
      img.style.height = '100%';
      img.style.opacity = '0.9';
      img.style.position = 'absolute';
      img.style.transform = 'rotate(0deg)';
      img.setAttribute("id", "theImg");
      div.appendChild(img);
      this.div_ = div;
      var panes = this.getPanes();
      panes.overlayLayer.appendChild(div);
    };

    DebugOverlay.prototype.draw = function() {
      var overlayProjection = this.getProjection();
      var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
      var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());
      var div = this.div_;
      var currentPositionData = {};

      if ($('.imagePosition').val().length > 0) {
        var currentPositionData = JSON.parse( $('.imagePosition').val());
      }

      console.log("currentPositionData", currentPositionData.width);
      console.log("$('.imagePosition').val().length > 0");
      console.log(Boolean($('.imagePosition').val().length > 0));

      if ($('.imagePosition').val().length > 0) {
        div.style.width = currentPositionData.width + 'px';
        div.style.height = currentPositionData.height + 'px';
        div.style.left = currentPositionData.left + 'px';
        div.style.top = currentPositionData.top + 'px';
      }else{
        div.style.width = (ne.x - sw.x) + 'px';
        div.style.height = (sw.y - ne.y) + 'px';
        div.style.left = sw.x + 'px';
        div.style.top = ne.y + 'px';
      }

      div.style.transform = 'rotate(' + rot + 'deg)';

      var imgWidth =  ne.x - sw.x;
      var imgHeight =  sw.y - ne.y;
      var imgLeft =  sw.x;
      var imgTop =  ne.y;

      console.log("width");
      console.log((ne.x - sw.x) + 'px');

      console.log("height");
      console.log((sw.y - ne.y) + 'px');

      var imagePositionData = {
        width: imgWidth,
        height: imgHeight,
        left: imgLeft,
        top: imgTop,
      }

      $(".imagePosition").val(JSON.stringify(imagePositionData));

      console.log("rotate");
      console.log('rotate(' + rot + 'deg)');
      $(".rotation").val(rot);
    };

    DebugOverlay.prototype.updateBounds = function(bounds) {
      this.bounds_ = bounds;
      this.draw();
    };

    DebugOverlay.prototype.updateRotation = function() {
      this.draw();
    };

    DebugOverlay.prototype.onRemove = function() {
      this.div_.parentNode.removeChild(this.div_);
      this.div_ = null;
    };

    initialize();
})();


