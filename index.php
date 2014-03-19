<?php

include 'Settings.php';
include './includes/tables.php';
include './includes/users.php';
include './includes/ucp/login.php';
include './includes/funcs.php';
include './includes/database/database.php';

error_reporting(E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR|E_WARNING|E_PARSE|E_USER_WARNING|E_USER_ERROR);

$connection = -1;
$DB_CONNECTED = false;
$DB_CONNECTION = ConnectDataBase();
$title = "none";


if ($CURRENT_USER['UID'] == 0){
    $CURRENT_USER['UID'] = Login($_POST['UserName'], $_POST['UserPassword']);
    $CURRENT_USER['NAME'] = UserGetNameByID($CURRENT_USER['UID']);
    $CURRENT_USER['ISFOUNDER'] = UserIsFounder($CURRENT_USER['UID']);
}

if ($CURRENT_USER['UID'] < 38 && $_GET['a']=='settings'){
	$_GET['a'] = 'notification';
	$title = "Premission denied!";
    $Notification = "You must be logged in! <br><a href=\"../\">Go to board index</a>";
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

include './includes/ucp/ucp.php';


$CRITICAL_VAR = array();
if (strlen($_GET['a']) == 0){
	$_GET['a'] = 'new';
}

if ($_GET['a']=="paste"){





	$expiration_values = array(
    	"-1" => pow(2,31),
    	"0"  => 10*60,
	    "1"  => 1*3600,
	    "2"  => 1*3600*24,
	    "3"  => 1*3600*24*7,
	    "4"  => 1*3600*24*7*2,
	    "5"  => 1*3600*24*7*4,
	);



 $sql = "INSERT INTO pastes (title,paste,expiration,exposure,created,id,uid,language) VALUES ('".mysql_real_escape_string($_POST['name'])."','".mysql_real_escape_string($_POST['code'])."','".(time()+$expiration_values[$_POST['expiration']])."','".$_POST['exposure']."','".time()."','NULL','".$CURRENT_USER['UID']."','".$_POST['language']."')";
 _mysql_query($sql);
		$_GET['a'] = 'notification';
        $Notification = 'New paste have been created! <br>Click <a href="./?a=view&id='.$id.'" >here</a> if your browser does not automatically redirect you.';
		$id = _mysql_insert_id();
		header('Refresh: 0; URL=./?a=view&id='.$id);
 //dbg($sql);




}

if ($_GET['a']=="view"){
	$id = intval($_GET['id']);
	if(strlen($id)){
		$paste = GetTableContents('','','',false,'SELECT * FROM pastes JOIN users ON pastes.uid = users.UserID  WHERE id='.$id);
		$paste[0]['created'] = date("d M Y H:i:s",$paste[0]['created']);
		if($paste[0]['expiration'] == '2147483647'){
			$paste[0]['expiration']= "Never";
		}else{
			$paste[0]['expiration'] = date("d M Y H:i:s",$paste[0]['expiration']);
		}
		$lng = array(
			"as3"=>'AS3',
			"bash"=>'Bash',
			"cf"=>'ColdFusion',
			"csharp"=>'CSharp',
			"cpp"=>'Cpp',
			"css"=>'Css',
			"delphi"=>'Delphi',
			"diff"=>'Diff',
			"groovy"=>'Groovy',
			"js"=>'JScript',
			"java"=>'Java',
			"jfx"=>'JavaFX',
			"perl"=>'Perl',
			"php"=>'Php',
			"plain"=>'Plain',
			"ps"=>'PowerShell',
			"py"=>'Python',
			"ruby"=>'Ruby',
			"scala"=>'Scala',
			"sql"=>'Sql',
			"vb"=>'Vb',
			"xml"=>'xml'
		);

		//dbg($paste);
	}
}



$test="abc";

$file = ReplaceFile(str_replace("{FILE}","./template/".$_GET['a'].".html",file_get_contents("./template/main.html")));
$file = TemplateReplace($file,array());
print($file)
?>