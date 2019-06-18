$(function() {

    $('#users-table').DataTable({
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
});