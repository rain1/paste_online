<?php

function IsCrawler($agent){
    $Searchbot = Array(
        'Exabot',
        'Googlebot',
        'Yahoo',
        'msnbot',
        'setooz',
        'DotBot',
        'Cityreview',
        'SurveyBot',
        'Twiceler',
        'AddMe',
        'AppEngine-Google',
        'Baiduspider',
        'CatchBot',
        'Comodo-Certificates-Spider',
        'Content Crawler',
        'DLE_Spider.exe',
        'EC2LinkFinder',
        'findfiles.net',
        'findlinks',
        'gold crawler',
        'GSLFbot',
        'ia_archiver',
        'Jyxobot',
        'libwww-perl',
        'Mail.Ru',
        'bingbot',
        'DotBot',
        'MJ12bot',
        'NerdByNature',
        'ScoutJet',
        'SISTRIX',
        'WBSearchBot',
        'YandexBot',
        'YandexFavicon',
        'TwengaBot',
        'Google'
    );
   foreach ($Searchbot as $bot)
    {
        if (stristr($agent, $bot))
        {
            return($bot);
        }
    }

    return false;
}
function Login($User = '',$Password = '',$remember = false){
    $crawler = IsCrawler($_SERVER['HTTP_USER_AGENT']);
    if($crawler){return UserGetIDByName($crawler);}
    global $NOTICE;
    $uid = LoninCookie();
    if((!$uid || $uid == 1) && $User != '' && $Password != ''){

        try{
            $uid = LoginPassword($User,$Password);
        }catch (Exception $e){
            if($e->getCode() == 0){
                return 1;//return guest
            }
        }
        if ($uid > 0){
            SessionNew($uid,$remember,$hide);
        }
    }
    if(!$uid){SessionNew(1,true,false);$uid = 1;}//guest
    return $uid;
}

function LoginPassword($name,$password){
    $uid = UserGetIDByName($name);
    if(!$uid){throw new Exception('User not found',0);};
    $pass = UserGetInfoByID($uid,array('UserPassword'));
    $pass = $pass[0]['UserPassword'];
    if($pass != md5($password)){throw new Exception('Passwords does not match',1);}
    return $uid;
}

function SessionNew($uid,$remember)
{
    $SessionID = RandomString(15);
    $UserAgent = $_SERVER['HTTP_USER_AGENT'];
    $IP = $_SERVER['REMOTE_ADDR'];
    $Start = time();
    $End = time() + 3600*24*360*5; //5 years

    //$query = 'DELETE FROM sessions WHERE UserID = '.$uid; //allow only single login
    //@_mysql_query($query);

    $query = "INSERT INTO ".sessions." VALUES ('".$SessionID."', '".$uid."', '".$IP."', '".$UserAgent."', '".$Start."', '".$End."');";
    @_mysql_query($query);

    if(!$remember){
        $End = 0; //cookie will expire at the end of the session (when the browser closes).
    }
    setcookie("Session", $SessionID."\n".$uid, $End, "/");
}

function SessionDelete($uid){
    setcookie ("Session", "",  time()-3600,"/");
    $array = explode("\n",$_COOKIE['Session']);
    $sid = $array[0];
    $query = "DELETE FROM ".sessions." WHERE SessionID = '".$sid."'";
    return _mysql_query($query);
}

function LoninCookie(){
    $array = explode("\n",$_COOKIE['Session']);
    $query = 'SELECT * FROM '.sessions.' WHERE UserID = '.$array[1].' AND SessionID = \''.$array[0].'\'';
	$uid = $array[1];
    $result = @_mysql_query($query);
    if(UserGetInfoByID($uid)==""){
        SessionDelete($sid);//Delete invalid cookie
    }
    if ($result && _mysql_num_rows($result) != 0){
        $UserAgent = _mysql_result($result,0,'UserAgent');
        $End = _mysql_result($result,0,'End');
        if($End < time()){
            $query = 'DELETE FROM '.sessions.' WHERE UserID = '.$uid; //Delete expired session
            @_mysql_query($query);
            return false;
        }
        if ($UserAgent == $_SERVER['HTTP_USER_AGENT'] && $End > time())
        {
            return $uid;
        }
    }
    SessionDelete($sid);//Delete invalid cookie
    return false;
}

function GetLoginForm()
{
    if(IsCrawler($_SERVER['HTTP_USER_AGENT'])){return "";}
    global $TEMPLATE_PATHS,$CURRENT_USER;
    if ($CURRENT_USER['UID'] == 0 || $CURRENT_USER['UID'] == 1){
        return TemplateReplace(file_get_contents($TEMPLATE_PATHS['FORMS'].'/login.html'), array());
    }else{
        return TemplateReplace(file_get_contents($TEMPLATE_PATHS['FORMS'].'/loggedin.html'), array());
    }
}
?>