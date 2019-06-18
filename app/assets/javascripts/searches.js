$(function() {

    $("#input-date").datetimepicker({
        dateFormat: 'yy-mm-dd',
        controlType: 'select',
        oneLine: true,
        minDate: new Date(),
        timepicker: false,
        datepicker: true,
    });

});