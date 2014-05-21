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


$arr = $paste = GetTableContents('','','',false,"SELECT p.id, p.title, p.language, p.created FROM (SELECT id,title, language, created FROM pastes WHERE created >= ".$_GET['t']." ORDER BY created DESC) AS p limit 10 ");

while(true){
	if(count($arr)>0){
		for($i = 0; $i < count($arr);$i++){
			$arr[$i]['created'] = date("d M Y H:i:s",$arr[$i]['created'] );
		}
		$arr['timestamp']=time();
		echo json_encode($arr);
		file_put_contents ( "dbg.txt" , print_r("ret",true));
		die();
	}else{
		sleep(1);
		$arr = GetTableContents(pastes,array('id','title','language','created'),' WHERE created > '.($_GET['t']));
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
