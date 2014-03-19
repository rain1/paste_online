<?php
include 'Settings.php';
include './includes/tables.php';
include './includes/users.php';
include './includes/ucp/login.php';
include './includes/funcs.php';
include './includes/database/database.php';

$connection = -1;
$DB_CONNECTED = false;
$DB_CONNECTION = ConnectDataBase();

$arr = GetTableContents(pastes,array('id','title','language','created'),' WHERE created >= '.$_GET['t']);
while(true){
	if(count($arr)>0){
		for($i = 0; $i < count($arr);$i++){
			$arr[$i]['created'] = date("d M Y H:i:s",$arr[$i]['created'] );
		}
		$arr['timestamp']=time();
		echo json_encode($arr);
		die();
	}else{
		sleep(1);
		$arr = GetTableContents(pastes,array('title','language','created'),' WHERE created >= '.$_GET['t']);
	}
}
//dbg($arr);

$arr = array(
	1=>array(
		'lng' => 'Cpp',
		'title' => 'title',
		'time'=> 'time'
	),
	2=>array(
		'lng' => 'CS',
		'title' => 'title2',
		'time'=> 'time2'
	)
);



?>
