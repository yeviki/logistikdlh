<nav class="navbar fixed-top navbar-dark primary-color double-nav top-nav-collapse">
    <div class="navbar-left">
        <button class="btn btn-title btn-sidebar-toggler" type="button">
            <span class="bar"></span>
        </button>
        <a class="navbar-brand pl-2" href="<?= site_url('home') ?>">
            <?= isset($app_name) ? $app_name : ''; ?>
        </a>
    </div>
    <ul class="navbar-nav ml-auto nav-flex-icons">
        <!-- <li class="nav-item dropdown">
            <a class="nav-link nav-link-lg message-toggle beep waves-effect waves-light" data-toggle="dropdown" aria-expanded="false" id="navbarMessage">
                <i class="far fa-envelope"></i>
            </a>
            <div class="dropdown-menu dropdown-list dropdown-menu-lg-right" aria-labelledby="navbarMessage">
                <div class="dropdown-header">
                    Messages
                    <a href="#">Mark All As Read</a>
                </div>
                <div class="dropdown-list-content dropdown-list-message">
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-avatar">
                            <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle"
                                 alt="avatar image">
                            <div class="is-online"></div>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Kusnaedi</b>
                            <p>Hello, Bro!</p>
                            <div class="time">10 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-avatar">
                            <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle"
                                 alt="avatar image">
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Dedik Sugiharto</b>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                            <div class="time">12 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-avatar">
                            <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle"
                                 alt="avatar image">
                            <div class="is-online"></div>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Agung Ardiansyah</b>
                            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            <div class="time">12 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-avatar">
                            <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle"
                                 alt="avatar image">
                            <div class="is-online"></div>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Ardian Rahardiansyah</b>
                            <p>Duis aute irure dolor in reprehenderit in voluptate velit ess</p>
                            <div class="time">16 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-avatar">
                            <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle"
                                 alt="avatar image">
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Alfa Zulkarnain</b>
                            <p>Exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                            <div class="time">Yesterday</div>
                        </div>
                    </a>
                </div>
                <div class="dropdown-footer text-center">
                    <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                </div>
            </div>
        </li> -->
        <!-- <li class="nav-item dropdown">
            <a class="nav-link nav-link-lg notification-toggle beep waves-effect waves-light" data-toggle="dropdown" aria-expanded="false" id="navbarNotification">
                <i class="far fa-bell"></i>
            </a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right" aria-labelledby="navbarNotification">
                <div class="dropdown-header">
                    Notifications
                    <a href="#">Mark All As Read</a>
                </div>
                <div class="dropdown-list-content dropdown-list-icons">
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-icon bg-primary text-white">
                            <i class="fas fa-code"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            Template update is available now!
                            <div class="time text-primary">2 Min Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-info text-white">
                            <i class="far fa-user"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>You</b> and <b>Dedik Sugiharto</b> are now friends
                            <div class="time">10 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-success text-white">
                            <i class="fas fa-check"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Kusnaedi</b> has moved task <b>Fix bug header</b> to <b>Done</b>
                            <div class="time">12 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-danger text-white">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            Low disk space. Let's clean it!
                            <div class="time">17 Hours Ago</div>
                        </div>
                    </a>
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-info text-white">
                            <i class="fas fa-bell"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            Welcome to Stisla template!
                            <div class="time">Yesterday</div>
                        </div>
                    </a>
                </div>
                <div class="dropdown-footer text-center">
                    <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                </div>
            </div>
        </li> -->
        <li class="nav-item dropdown">
            <a class="nav-link nav-link-lg dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false" id="navbarMenuLink">
                <?php echo $this->asset->image('avatar/'.currentFotoUser(), '', array('class'=>'rounded-circle z-depth-0 mr-1', 'height'=>'35', 'alt'=>'Foto User')); ?>
                <div class="d-flex d-inline-flex">Hi, <?php echo $this->app_loader->current_name(); ?></div>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarMenuLink">
                <a href="<?php echo site_url('home/account'); ?>" class="dropdown-item has-icon">
                    Ubah Password
                    <i class="fas fa-cog"></i>
                </a>
                <div class="dropdown-divider"></div>
                <a href="<?= site_url('auth/signin/logout'); ?>" class="dropdown-item has-icon text-danger">
                    Logout
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </div>
        </li>
    </ul>
</nav>