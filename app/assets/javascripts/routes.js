$(function() {
    $('#routes-table').DataTable({
        language: {
            emptyTable: "Нет данных",
            paginate: {
                next: ">",
                previous: "<",
            },
            search: "Поиск",
            zeroRecords: "Нет данных",
            infoEmpty: "",
        },
        pageLength: 50,
        lengthChange: false,
    });

    $("#started_at, #finished_at").datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'HH:mm',
        controlType: 'select',
        oneLine: true,
        minDate: new Date(),
        hourMin: new Date().getHours() + 1,
    });

});