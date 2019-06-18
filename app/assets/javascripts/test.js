$(function() {

    $.datetimepicker.setDateFormatter({
        parseDate: function (date, format) {
            var d = moment(date, format);
            return d.isValid() ? d.toDate() : false;
        },
        formatDate: function (date, format) {
            return moment(date).format(format);
        },
    });
    $("#datetimepicker4").datetimepicker({
        timepicker: false,
        format:'Y/M/D',
        minDate: new Date()
    });

});