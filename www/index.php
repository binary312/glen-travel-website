<?php

// configurations
require_once('config/mysql.php');
require_once('config/settings.php');

// functions
require_once('func/mysql.php');
require_once('func/utils.php');

// page name
$page = isset($_GET['page']) && !empty($_GET['page']) ? $_GET['page'] : 'home';

if (!file_exists('view/page/' . $page . '.php')) {
	$page = 'nopage';
}

include('view/header.php');
include('view/page/' . $page . '.php');
include('view/footer.php');