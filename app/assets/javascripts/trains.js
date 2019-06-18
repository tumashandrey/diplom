$(function() {
    $('#trains-table').DataTable({
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
        lengthChange: false
    });

    let railwayStationsSelect = $('#railway_stations');
    railwayStationsSelect.multiSelect({
        keepOrder: true,
        afterSelect: (values) => {
            let trueValuesInput = $("#railway_stations_true");
            let storedValues = trueValuesInput.val().split(",");
            trueValuesInput.val(storedValues.concat(values).filter(n => n).join(","));
        },
        afterDeselect: (values) => {
            let trueValuesInput = $("#railway_stations_true");
            let storedValues = trueValuesInput.val().split(",");
            let newStoredValues = $(storedValues).not(values).get();
            trueValuesInput.val(newStoredValues.filter(n => n).join(","));
        }
    });
    let railwayStations = railwayStationsSelect.attr('data-railway-stations');
    if(railwayStations) {
        JSON.parse(railwayStations).sort((a,b) => {
            return a.position - b.position;
        }).map((element) => {
            railwayStationsSelect.multiSelect('select', element.railway_station_id.toString());
        });
    }

    $("[id^=railway-stations-time]").datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'HH:mm',
        controlType: 'select',
        oneLine: true,
        minDate: new Date(),
    });
});