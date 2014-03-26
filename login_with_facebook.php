<?php
require('./oauth/http.php');
require('./oauth/oauth_client.php');

include 'Settings.php';
include './includes/tables.php';
include './includes/users.php';
include './includes/ucp/login.php';
include './includes/funcs.php';
include './includes/database/database.php';

$connection = -1;
$DB_CONNECTED = false;
$DB_CONNECTION = ConnectDataBase();

$client = new oauth_client_class;
$client->server = 'Facebook';
$client->debug = false;
$client->debug_http = true;
$client->redirect_uri = 'http://'.$_SERVER['HTTP_HOST'].dirname(strtok($_SERVER['REQUEST_URI'],'?')).'/login_with_facebook.php';
$client->client_id = '290640871099537';/*Client ID*/
$client->client_secret = '9d785a6fe82f457813eeafda45b9e551';/*Client Secret*/
$client->scope = 'email,user_about_me,user_birthday';
$application_line = __LINE__;
if(strlen($client->client_id) == 0 || strlen($client->client_secret) == 0){
 die('Please go to Facebook Apps page https://developers.facebook.com/apps , '.
  'create an application, and in the line '.$application_line.
  ' set the client_id to App ID/API Key and client_secret with App Secret');
}
if(($success = $client->Initialize())){
 if(($success = $client->Process())){
  if(strlen($client->authorization_error)){
   $client->error = $client->authorization_error;
   $success = false;
  }elseif(strlen($client->access_token)){
   $success = $client->CallAPI('https://graph.facebook.com/me', 'GET', array(), array('FailOnAccessError'=>true), $user);
   if($success){
   //print_r($user);
	if(FBUserExists($user->username) ==0){
		//print("1");
		UserAdd($user->name, 'None', $user->email, "" , time(), 0, 0, 0, true );
		$uid = _mysql_insert_id();
		//print($uid);
		$query = "INSERT INTO users_fb (id, uid, username, name) VALUES(NULL,'".$uid."','".$user->username."','".$user->name."')";//secure it!!
		//print_r($query);
		_mysql_query($query);
	}
		//print_r("sel");
		$query = "SELECT uid FROM users_fb WHERE username='".$user->username."'";
		$result = _mysql_query($query);
		$uid = _mysql_result($result,0);
		SessionNew($uid,true);
		$_GET['a'] = 'notification';
        $title = "Login";
        $Notification = "Facebook login successful!";
            header('Refresh: 5; URL=./');
		$file = ReplaceFile(str_replace("{FILE}","./template/".$_GET['a'].".html",file_get_contents("./template/main.html")));
		$file = TemplateReplace($file,array());
		print($file);

	//5print_r($user);
    $email=$user->email;
    $name=$user->name;
    $gender=$user->gender;
    $birthday=date('d/m/Y', strtotime($user->birthday));
    $image=get_headers("https://graph.facebook.com/me/picture?width=200&height=200&access_token=".$client->access_token,1);
    $image=$i['Location'];
   }
  }
 }
 $success = $client->Finalize($success);
}
if($client->exit){
 die("Something Happened"."<a href='".$client->redirect_uri."'>Try Again</a>");
}
if(!$success){
?>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
  <head>
   <title>Error</title>
  </head>
  <body>
   <h1>OAuth client error</h1>
   <pre>Error: <?php echo HtmlSpecialChars($client->error); ?></pre>
  </body>
 </html>
<?}?>