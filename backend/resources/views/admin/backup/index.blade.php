@extends('admin.layout')
@section('css')

<link rel="stylesheet" type="text/css"
href="{{asset('admin/assets/node_modules/datatables.net-bs4/css/dataTables.bootstrap4.css')}}">
<link rel="stylesheet" type="text/css"
href="{{asset('admin/assets/node_modules/datatables.net-bs4/css/responsive.dataTables.min.css')}}">
<link href="{{asset('admin/assets/node_modules/switchery/dist/switchery.min.css')}}" rel="stylesheet" type="text/css" />

@endsection

@section('content')
    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h4 class="text-themecolor">ALL BACKUP LIST
            </h4>
        </div>
        <div class="col-md-7 align-self-center text-end">
            <div class="d-flex justify-content-end align-items-center">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Backup</li>
                </ol>
            </div>
        </div>
    </div>

    <!-- page start-->
                <div class="row">
                    <div class="col-sm-12">
                        <section class="card">
                            <header class="card-header bg-info">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="mb-0 text-white" >All Backup List</h4>
                                    </div>
                                    <div class="col-md-6 text-end">
                                    <button id="backupNow" class="btn btn-primary">Backup Now</button>

                                    </div>
                                </div>
                            </header>
                        <div class="card-body">
                          <div class="table-responsive">
                            <table id="example23" class="mydatatable display nowrap table table-hover table-striped border" cellspacing="0" width="100%">
                                    <thead>
                                        <tr class="" >
                                            <th>#</th>

                                            <th>Date</th>
                                            <th>Time</th>
                                            <th class="hidden-phone">Action</th>
                                        </tr>
                                     </thead>
                                    <tbody>
                             </tbody>
                        </table>
                    </div>
                    </div>
                </div>
           </section>
        </div>
      </div>

@endsection
 @section('js')


       <!-- This is data table -->
       <script src="{{asset('admin/assets/node_modules/datatables.net/js/jquery.dataTables.min.js')}}"></script>
       <script src="{{asset('admin/assets/node_modules/datatables.net-bs4/js/dataTables.responsive.min.js')}}"></script>
       <script src="{{asset('admin/assets/node_modules/switchery/dist/switchery.min.js')}}"></script>


       <script>
        $(function () {


            var application_table = $('.mydatatable').DataTable({
            processing: true,
            "searching": false,
            fixedColumns: false,
            fixedHeader: false,
            scrollCollapse: false,
            scrollX: true,
            // scrollY: '500px',
            autoWidth: false,
            dom: 'lfrtip',
            serverSide: true,
            lengthMenu: [[10,25, 50, 100,500],[10,25, 50, 100,500]],
            ajax: {
                url: "{{URL::to('admin/backup')}}",
                type: "GET",
                data: function ( d ) {

                }
            },
            initComplete: function () {

            }
        });

        application_table.on( 'draw', function () {
            $('.js-switch').each(function () {
               new Switchery($(this)[0], $(this).data());
            });
        } );



        // $('input[type=search]').unbind();
        $("#searchButton").click(e =>{
            application_table.search($('input[type=search]').val());
            application_table.draw();
        });



        $(".mydatatable").delegate(".is_enable", "change", function(){
            var isChecked = $(this).prop('checked');
            $.ajax({
                url: "{{URL::to('/admin/status')}}",
                data: {
                    id:$(this).data('id'),
                    table:'categories',
                    column:'is_enable',
                    value: $(this).prop('checked') ? 1: 0,
                },
                dataType: "json",
                success: function (response) {

                },
                errror:function (response) {

                },
            });
            console.log(isChecked);
        });


        $(".mydatatable").delegate(".is_featured", "change", function(){
            var isChecked = $(this).prop('checked');
            $.ajax({
                url: "{{URL::to('/admin/status')}}",
                data: {
                    id:$(this).data('id'),
                    table:'categories',
                    column:'is_featured',
                    value: $(this).prop('checked') ? 1: 0,
                },
                dataType: "json",
                success: function (response) {

                },
                errror:function (response) {

                },
            });
            console.log(isChecked);
        });



      });


       $('#backupNow').on('click', function () {
        let $btn = $(this);
        $btn.prop('disabled', true).text('Backing up...');

        $.ajax({
            url: "{{ route('admin.backup.download') }}",
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            xhrFields: {
                responseType: 'blob' // Handle file download
            },
            success: function (data, status, xhr) {
                const disposition = xhr.getResponseHeader('Content-Disposition');
                const match = disposition && disposition.match(/filename="(.+)"/);
                const filename = match ? match[1] : 'backup.sql';

                const blob = new Blob([data], { type: 'application/sql' });
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = filename;
                document.body.appendChild(a);
                a.click();
                a.remove();

                $('#backup-status').text('Backup completed and downloaded.');
                $btn.prop('disabled', false).text('Backup Now');
            },
            error: function () {
                alert('Backup failed. Please try again.');
                $btn.prop('disabled', false).text('Backup Now');
            }
        });
    });
    </script>
@endsection
