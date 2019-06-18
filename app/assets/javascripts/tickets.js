$(function() {

    $('#tickets-table tfoot th').each( function () {
        let title = $(this).text();
        $(this).html( '<input type="text" class="form-control form-control-sm" placeholder="Поиск'+title+'" />' );
    } );


    let table = $('#tickets-table').DataTable({
        dom: 'Bfrtip',
        buttons: [
            { extend: 'excelHtml5', className: "btn btn-primary btn-sm" },
            { extend: 'csvHtml5', className: "btn btn-primary btn-sm" },
            { extend: 'pdfHtml5', className: "btn btn-primary btn-sm" },
            { extend: 'print', className: "btn btn-primary btn-sm" },
        ],
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
        initComplete: () => {
            $(".dt-buttons").addClass('btn-group btn-group-sm').css('float', 'left')
        }
    });

    // Apply the search
    table.columns().every( function () {
        var that = this;

        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );


});