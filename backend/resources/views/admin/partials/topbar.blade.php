<nav class="navbar top-navbar navbar-expand-md navbar-dark">
<div class="navbar-header text-center" style="padding:12px;">
    <a class="navbar-brand d-flex align-items-center justify-content-center"
       href="{{ URL::to('/admin/dashboard') }}"
       style="gap:12px; text-decoration:none;">

        <!-- Logo -->
        <img src="{{ asset('admin/assets/images/adminlogo.png') }}"
             alt="Admin Panel Logo"
             style="height:50px; width:50px; object-fit:contain; transform: scale(1.3);">

        <!-- Logo Text -->
        <span style="font-size:18px; font-weight:600; color:#34495E; letter-spacing:1px;">
            <span style="color:blue;">NL</span> - <span style="font-size:12px; color:white;"> Penal </span>
        </span>
    </a>
</div>


    <div class="navbar-collapse">
        <ul class="navbar-nav me-auto">
            <li class="nav-item"> <a class="nav-link nav-toggler d-block d-md-none waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
            <li class="nav-item"> <a class="nav-link sidebartoggler d-none d-lg-block d-md-block waves-effect waves-dark" href="javascript:void(0)"><i class="icon-menu"></i></a> </li>
        </ul>

        <ul class="navbar-nav my-lg-0">
            <li class="nav-item dropdown u-pro">
                <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  @if(auth()->user()->image && auth()->user()->image->filename)
                        <img src="/public/filemanager/{{ auth()->user()->image->filename }}" alt="user" class="">
                    @else
                        <img src="{{ asset('admin/assets/images/users/1.jpg') }}" alt="user" class="">
                    @endif
                  <span class="hidden-md-down">{{ Auth::user()->name }} &nbsp;<i class="fa fa-angle-down"></i></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end animated flipInY">
                    <a href="{{route("profile")}}" class="dropdown-item">
                        <i class="ti-user"></i> My Profile
                    </a>
                    <a href="javascript:void(0)" class="right-side-toggle dropdown-item"><i class="ti-settings"></i> Settings
                    </a>
                    <a href="{{URL::to('/admin/logout')}}" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
