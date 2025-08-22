@extends('admin.layout')
@section('css')

<link rel="stylesheet" type="text/css"
href="{{asset('admin/assets/node_modules/datatables.net-bs4/css/dataTables.bootstrap4.css')}}">
<link rel="stylesheet" type="text/css"
href="{{asset('admin/assets/node_modules/datatables.net-bs4/css/responsive.dataTables.min.css')}}">
<link href="{{asset('admin/assets/node_modules/switchery/dist/switchery.min.css')}}" rel="stylesheet" type="text/css" />

<style>

    table td{
        /* border: 1px solid lightgray; */
    }

    table th{
        /* border: 1px solid lightgray; */
    }

    @media (max-width: 767px){
        .container-fluid, .container-sm, .container-md, .container-lg, .container-xl, .container-xxl {
            overflow: scroll!important;
        }
    }

</style>



   <style>

    @media (max-width: 767px){
        .container-fluid, .container-sm, .container-md, .container-lg, .container-xl, .container-xxl {

            overflow: scroll!important;
        }
    }
    #popupFormContainer {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #ffffff;
        padding: 20px;
        border: 1px solid #ccc;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        z-index: 1000;
    }

    /* Styles for the form inside the popup */
    #popupFormContainer form {
        width: 100%;
    }

    /* Styles for the form inputs */
    #popupFormContainer input[type="text"],
    #popupFormContainer input[type="file"],
    #popupFormContainer button {
        width: 100%;
        margin-bottom: 10px;
    }

    /* Styles for the buttons */
    #popupFormContainer button {
        padding: 10px;
        border: none;
        cursor: pointer;
    }

    /* Styles for the close button */
    #closePopupBtn {
        background-color: #ff0000;
        color: #ffffff;
    }
    header.card-header.bg-info {
    text-align: center;
    }
p.text-success, p.text-danger {
    text-align: center;
}
</style>

@endsection

@section('content')
    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h4 class="text-themecolor">ALL SUPPORT MESSAGE LIST
            </h4>
        </div>
        <div class="col-md-7 align-self-center text-end">
            <div class="d-flex justify-content-end align-items-center">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Support Message</li>
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
                                        <h4 class="mb-0 text-white" >All Support Message List</h4>
                                    </div>

                                </div>
                            </header>
                        <div class="card-body">
                          <div class="table-responsive">
                           <table id="example23" class="mydatatable display nowrap table table-hover table-striped border" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>IP</th>
                                        <th>Meg</th>
                                        <th>rep</th>
                                        <th>Status</th>
                                        <th class="hidden-phone">Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>

                    </div>
                    </div>
                </div>
           </section>
        </div>
      </div>
@include('admin.support.edit')
@endsection
 @section('js')


       <!-- This is data table -->
       <script src="{{asset('admin/assets/node_modules/datatables.net/js/jquery.dataTables.min.js')}}"></script>
       <script src="{{asset('admin/assets/node_modules/datatables.net-bs4/js/dataTables.responsive.min.js')}}"></script>
       <script src="{{asset('admin/assets/node_modules/switchery/dist/switchery.min.js')}}"></script>

<script src="https://js.pusher.com/8.0/pusher.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/laravel-echo/1.11.3/echo.iife.min.js"></script>

      <script>
$(function () {

    var application_table = $('.mydatatable').DataTable({
        processing: true,
        searching: true,
        fixedColumns: false,
        fixedHeader: false,
        scrollCollapse: false,
        scrollX: true,
        autoWidth: false,
        dom: 'lfrtip',
        serverSide: true,
        lengthMenu: [[10,25,50,100,500],[10,25,50,100,500]],
        ajax: {
            url: "{{URL::to('admin/support/index')}}",
            type: "GET",
            data: function ( d ) { }
        },
        initComplete: function () { }
    });

    application_table.on('draw', function () {
        $('.js-switch').each(function () {
           new Switchery($(this)[0], $(this).data());
        });
    });

    $("#searchButton").click(e => {
        application_table.search($('input[type=search]').val());
        application_table.draw();
    });

    // ===== Real-time updates via Pusher / Laravel Echo =====

        window.Pusher = Pusher;

    // Initialize Echo
    window.Echo = new Echo({
        broadcaster: 'pusher',
        key: 'c599e71aaa5ac1d3ef4d',
        cluster: 'mt1',
        forceTLS: true
    });
   window.Echo.channel('support')
    .listen('.support.sent', (e) => {
        console.log('New support message:', e.support);

        // Add row to DataTable
        let status = e.support.status === 'answered'
            ? '<span class="badge bg-success">Answered</span>'
            : '<span class="badge bg-danger">Pending</span>';

        let action = `<div class="btn-group">
            <button class="btn btn-info btn-sm openReplyPopup"
                data-id="${e.support.id}"
                data-message="${e.support.message}">Reply</button>
            <a class="btn btn-danger btn-sm deleteRecord"
                data-id="${e.support.id}"
                href="javascript:void(0);">Delete</a>
        </div>`;

        application_table.row.add([
            e.support.id,
            e.support.ip_address,
            e.support.message,
            e.support.reply ?? '',
            status,
            action,
        ]).draw(false);
    });

});




$(document).on("click", ".openReplyPopup", function () {
    var id = $(this).data("id");
    var message = $(this).data("message");

    // Hidden input में id डालो
    $("#popupSupportId").val(id);

    // Textarea में message डालो
    $("#popupMessage").val(message);

    // Popup show करो
    $("#popupFormContainer").fadeIn();
});

// Close button
$("#closePopupBtnn").on("click", function () {
    $("#popupFormContainer").fadeOut();
});


    </script>
@endsection
