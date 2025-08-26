<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{$_s['site_title']}}</title>
    <link rel="icon" type="image/png" sizes="16x16" href="{{asset('admin/assets/images/favicon.png')}}">

    <!-- Plugins -->
    <link href="{{asset('admin/assets/node_modules/morrisjs/morris.css')}}" rel="stylesheet">
    <link href="{{asset('admin/assets/node_modules/sweetalert2/dist/sweetalert2.min.css')}}" rel="stylesheet">
    <link href="{{asset('admin/assets/node_modules/toast-master/css/jquery.toast.css')}}" rel="stylesheet">
    <link href="{{asset('admin/assets/css/style.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('admin/assets/node_modules/select2/dist/css/select2.css')}}">

    <!-- Custom Styling -->
    <style>
        body {
            background-color: #f3f4f6;
            font-family: "Inter", sans-serif;
            font-size: 14px;
        }

        /* Sidebar */
        .left-sidebar {
            background-color: #1f2937;
            color: #e5e7eb;
            transition: all 0.3s ease;
        }
        .left-sidebar .sidebar-nav ul li a {
            display: flex;
            align-items: center;
            padding: 10px 14px;
            border-radius: 6px;
            color: #d1d5db;
            transition: all 0.2s ease-in-out;
        }
        .left-sidebar .sidebar-nav ul li a:hover {
            background-color: #2563eb;
            color: #fff;
        }
        .left-sidebar .sidebar-nav ul li a i {
            margin-right: 10px;
            font-size: 16px;
        }
        .left-sidebar .active > a {
            background-color: #2563eb;
            color: #fff;
        }

        /* Topbar */
        .topbar {
            background: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.08);
            padding: 10px 20px;
        }

        /* Page Content */
        .page-wrapper {
            margin-left: 16rem; /* Sidebar width */
            padding: 20px;
            min-height: 100vh;
            transition: margin-left 0.3s ease;
        }
        .page-wrapper .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            padding: 20px;
        }

        /* Footer */
        .footer {
            background: #fff;
            padding: 12px 20px;
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            border-top: 1px solid #e5e7eb;
        }

        /* Buttons hover */
        .btn-primary, .waves-effect {
            transition: background-color 0.2s ease-in-out, transform 0.1s ease;
        }
        .btn-primary:hover {
            transform: scale(1.02);
        }
/* Navbar */
.top-navbar {
    background: #1f2937; /* Dark slate */
    padding: 8px 20px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    transition: background 0.3s ease;
}
.top-navbar .navbar-brand img {
    height: 32px;
    transition: transform 0.2s ease;
}
.top-navbar .navbar-brand:hover img {
    transform: scale(1.05);
}

/* Navbar Links */
.top-navbar .navbar-nav .nav-link {
    color: #e5e7eb;
    font-weight: 500;
    padding: 10px 14px;
    border-radius: 6px;
    transition: all 0.25s ease;
}
.top-navbar .navbar-nav .nav-link:hover {
    background: rgba(255,255,255,0.08);
    color: #fff;
}

/* Profile Dropdown */
.u-pro .profile-pic img {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 8px;
    border: 2px solid #2563eb;
}
.u-pro .nav-link {
    display: flex;
    align-items: center;
    font-weight: 500;
}
.u-pro .nav-link i {
    margin-left: 6px;
    font-size: 12px;
}

/* Dropdown */
.dropdown-menu {
    border: none;
    border-radius: 10px;
    padding: 6px 0;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    animation: dropdownFade 0.25s ease;
}
.dropdown-menu .dropdown-item {
    font-size: 14px;
    padding: 10px 16px;
    display: flex;
    align-items: center;
    gap: 10px;
    transition: all 0.2s ease;
}
.dropdown-menu .dropdown-item:hover {
    background: #2563eb;
    color: #fff;
}

/* Dropdown animation */
@keyframes dropdownFade {
    from { opacity: 0; transform: translateY(-8px); }
    to { opacity: 1; transform: translateY(0); }
}

    </style>
    @yield('css')
</head>

<body class="skin-blue fixed-layout">

    <!-- Preloader -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">{{$_s['site_title']}}</p>
        </div>
    </div>

    <!-- Main Wrapper -->
    <div id="main-wrapper">

        <!-- Topbar -->
        <header class="topbar">
            @include('admin.partials.topbar')
        </header>

        <!-- Sidebar -->
        <aside class="left-sidebar w-64 h-screen fixed">
            <div class="scroll-sidebar h-full overflow-y-auto px-3 py-4">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="space-y-1 text-sm">
                        @include('admin.partials.navbar')
                    </ul>
                </nav>
            </div>
        </aside>

        <!-- Page Content -->
        <div class="page-wrapper">
            <div class="container-fluid">
                @yield('content')
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            © 2024 {{$_s['site_title']}} | Developed by <a href="https://www.azamsolutions.com/">browndev.com</a>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="{{asset('admin/assets/node_modules/jquery/dist/jquery.min.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/select2/dist/js/select2.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/raphael/raphael-min.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/morrisjs/morris.min.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/jquery-sparkline/jquery.sparkline.min.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/toast-master/js/jquery.toast.js')}}"></script>
    <script src="{{asset('admin/assets/node_modules/sweetalert2/dist/sweetalert2.all.min.js')}}"></script>
    <script src="{{asset('admin/assets/js/perfect-scrollbar.jquery.min.js')}}"></script>
    <script src="{{asset('admin/assets/js/waves.js')}}"></script>
    <script src="{{asset('admin/assets/js/custom.js')}}"></script>
    <script src="{{asset('admin/tinymce/tinymce.min.js')}}"></script>
    <script src="{{asset('admin/assets/js/tinymce.js')}}"></script>

    @include('admin.partials.alert')
    @yield('js')

</body>
</html>
