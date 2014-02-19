<?php
include 'funcs.php';
if (strlen($_GET['a']) == 0){
	$_GET['a'] = 'new';
}

$file = ReplaceFile(str_replace("{FILE}","po_".$_GET['a'].".html",file_get_contents("main.html")));
print($file)
?>