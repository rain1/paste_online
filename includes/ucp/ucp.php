<?php

function ProccessRegistration(){
    $_GET['a']='notification';
    global $TabsDataJS,$FILE_PATH,$CURRENT_MODULE,$Notification,$Loginform;

    $title = "none";
    $TabsDataJS = "var TabsData = [];TabsData[\"0\"] = [];TabsData[\"0\"][\"link\"] = \"15\";TabsData[\"0\"][\"text\"] = \"REGISTER\";";
    $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/register.html';
    print "s2";
    if($_POST['UserPassword'] != $_POST['UserPasswordConfirm']){
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/failure.html';
        $title = "Registration error!";
        $Notification = "Passwords mismatch <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        return;
    }
    if($_POST['UserPassword'] == "" || $_POST['UserName'] == ""|| $_POST['UserEmail'] == ""){
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/failure.html';
        $title = "Registration error!";
        $Notification = "You did not fill all the required fields <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        return;
    }
    if(UserGetIDByName($_POST['UserName'])!=""){
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/failure.html';
        $title = "Registration error!";
        $Notification = "User already exists <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        return;
    }
    /*if($_POST['agreement']!="1" || !isset($_POST['agreement'])){
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/failure.html';
        $Notification = "You did not accept terms of use <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        return;
    }*/
    /*if($_POST['confirmation']!="Precarious"){
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/failure.html';
        $Notification = "You did not answer confirmation code right <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        return;
    }*/
    if(!UserAdd($_POST['UserName'], $_POST['UserPassword'], $_POST['UserEmail'], "" , time(), 0, 0, 0 )){
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/failure.html';
        $title = "Registration error!";
        $Notification = "Account creation failed for unknown reason. <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
    }else{
        $FILE_PATH[$CURRENT_MODULE] = '../theme/default/UCP/success.html';
        $Notification = "Your account has been successfully created <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        $title = "Registration success!";
        $Notification = "Your account have been successfully created <br> <a href=\"#\" onclick=\"history.go(-1)\">Retry</a> or <a href=\"../\">Go to board index</a>";
        Login($_POST['UserName'],$_POST['UserPassword'],true, 0);
        $Loginform = GetLoginForm();
        //GroupAddMember(3, $_POST['UserName'], 1, true);//add user to registered users
        header('Refresh: 5; URL=../');
    }
    return;
}
    if($_GET['a'] == 'signin'){
         $_GET['a'] = 'notification';
        $title = "Login";
        $Notification = "Login successful!";
        $uid = Login($_POST['UserName'],$_POST['UserPassword'],CheckboxToBool($_POST['remember']));
        if($uid > 1){
            header('Refresh: 5; URL=./');
        }
    }


	if($_GET['a'] == 'settings'){
		$USER = UserGetInfoByID($CURRENT_USER['UID']);
	}
	if($_GET['a'] == 'updateacc'){
        $cmd = 'UPDATE users ';
        $update = "SET  UserAvatar='".$_POST['avatar']. "', UserEmail='".$_POST['email']. "' ";
        $cmdend = ' WHERE UserID='.$CURRENT_USER['UID'];
		if($_POST['newpassword'] == $_POST['newpasswordconf'] && strlen($_POST['newpassword'])> 3){
			$curr = UserGetInfoByID($CURRENT_USER['UID']);
			if($curr[0]['UserPassword'] == md5($_POST['password'])){
				$update .= ", UserPassword='".md5($_POST['newpassword'])."'";
			}
		}
		dbg($cmd.$update.$cmdend);
		_mysql_query($cmd.$update.$cmdend);
        header('Refresh: 5; URL=./?a=settings');
    }


    if($_GET['a'] == 'logout'){
        $_GET['a'] = 'notification';
        $title = "Logout";
        $Notification = "Logout successful!";
        SessionDelete($_COOKIE['Session']);
        header('Refresh: 5; URL=./');
    }

    if($_GET['a'] == 'register'){

    }
    if($_GET['a'] == 'registerconfirm'){
        ProccessRegistration();
    }

?>