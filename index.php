<?php

include 'Settings.php';
include 'tables.php';
include 'users.php';
include 'login.php';
include 'funcs.php';
include 'database.php';

error_reporting(E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR|E_WARNING|E_PARSE|E_USER_WARNING|E_USER_ERROR);

$connection = -1;
$DB_CONNECTED = false;
$DB_CONNECTION = ConnectDataBase();


if ($CURRENT_USER['UID'] == 0){
    $CURRENT_USER['UID'] = Login($_POST['UserName'], $_POST['UserPassword']);
    $CURRENT_USER['NAME'] = UserGetNameByID($CURRENT_USER['UID']);
    $CURRENT_USER['ISFOUNDER'] = UserIsFounder($CURRENT_USER['UID']);
}

$LOGIN_BAR = "";

if ($CURRENT_USER['UID'] < 2){
	$LOGIN_BAR .= '<a href="./?a=register">Register</a> | <a href="./?a=login">Login</a>';
}else{
	$LOGIN_BAR .= ' <a href="./?a=settings">settings</a> | <a href="./?a=logout">Logout</a> ';
}

if($CURRENT_USER['ISFOUNDER'] ){
$LOGIN_BAR .= '| <a href="./?a=acp_users">ACP</a>';
}

include 'ucp.php';


$CRITICAL_VAR = array();
if (strlen($_GET['a']) == 0){
	$_GET['a'] = 'new';
}
$test="abc";
$file = ReplaceFile(str_replace("{FILE}","po_".$_GET['a'].".html",file_get_contents("main.html")));
$file = TemplateReplace($file,array());
print($file)
?>