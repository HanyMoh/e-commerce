$(document).ready(function () {

    'use strict';


    /*
        --------------------------------------------------------------------------
        Dashbaord JS
        --------------------------------------------------------------------------
    */
    $('#barcodeSearch').on('change', function () {
        $('.add-barcode').fadeToggle();
    });

    $('.side-nav .collapse').on("show.bs.collapse", function () {
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");
    });

    $("#sidebar").mCustomScrollbar({
        theme: "minimal"
    });

    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
    });

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });

    $('#multiShops').on('click', function () {

        $('#chooseShops').fadeToggle()

    });


    $('select').niceSelect();


    $('.chooseMuiltiShops').on('click', function () {

        $(this).toggleClass('checked')

    });

    $('.delete').on('click', function () {

        swal({
                title: "Are you sure?",
                text: "You will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, delete it!",
                cancelButtonText: "No, cancel plx!",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                } else {
                    swal("Cancelled", "Your imaginary file is safe :)", "error");
                }
            });

    });

    $('.submit').on('click', function () {

        swal("Done!", "Submited!", "success")

    });

    $('.cancel').on('click', function () {

        swal({
                title: "Are you sure?",
                text: "Your will Cancel This",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, Cancel !",
                closeOnConfirm: false
            },
            function () {
                swal("Canceld!", "Your imaginary file has been Canceled.", "success");
            });
    });

    var quantitiy = 0;
    $('.quantity-right-plus').click(function (e) {

        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());

        // If is not undefined

        $('#quantity').val(quantity + 1);


        // Increment

    });

    $('.quantity-left-minus').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());

        // If is not undefined

        // Increment
        if (quantity > 0) {
            $('#quantity').val(quantity - 1);
        }
    });

    $('.timeDrop').timeDropper();
    /*
        --------------------------------------------------------------------------
        End Dashbaord JS
        --------------------------------------------------------------------------
    */

});
