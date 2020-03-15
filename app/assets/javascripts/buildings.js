(function() {
  function repeatCoordinationValidatedField() {
      var longitude = $('#building_form').find('#building_longitude').val(),
          latitude = $('#building_form').find('#building_latitude').val()

      // Set the dob field value
      $('#building_form').find('#building_coordinates').val(longitude === '' || latitude === '' ? '' : 'true');
  }

  $('#building_longitude, #building_latitude').on('change', function(e) {
    repeatCoordinationValidatedField();
      // Revalidate it
      // $('#exampleValidator').formValidation('revalidateField', 'coordinates');
  });
  $(document).ready(repeatCoordinationValidatedField);

})();
