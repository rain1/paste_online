<?php
function UserValidateName($name)
{
    if (strlen($name) > 0){
        return true;
    }
    return false;
}

function UserValidateMail($mail)
{
    if (strlen($mail) > 3){
        if(strstr($mail,'@')){
            return true;
        }
        return false;
    }
    return false;
}

function UserGetGroups($uid)
{
    $groups = GetTableContents(usergroups,array('UserGroupID'),'WHERE UserID='.$uid);
    if(!is_array($groups)){return array();}
    return ArrayCopyDimension($groups,'UserGroupID');
}

function UserGetPermissions($uid,$ForumID = 0){
    $groups = UserGetGroups($uid);
    if($groups == array()){return array();}
    $permission = array();
    for ($i = 0; $i < count($groups);$i++)
    {
        $permission = array_merge(GroupListPermissions($groups[$i],$ForumID),$permission);
    }

    return $permission;
}

function UserHasPermission($permission,$ForumID  = 'GLOBAL')
{
    global $CURRENT_USER;
    if($CURRENT_USER['PERMISSIONS'][$ForumID] == NULL){return false;}
    if(strstr($permission,'|')){
        $permission = explode('|',$permission);
    }elseif (!is_array($permission)) {
        $permission = array($permission);
    }
    for($i =0;$i < count($permission);$i++){
        if(!array_search($permission[$i],$CURRENT_USER['PERMISSIONS'][$ForumID]) && $CURRENT_USER['PERMISSIONS'][$ForumID][0]!=$permission[$i]){//crappy fix
            return false;
        }
    }
    return true;

}

function UserGetDefaultGroup($uid)
{
    $ret = UserGetInfoByID($uid, array('UserDefaultGroup'));
    return $ret[0]['UserDefaultGroup'];
}

function UserGetRank($uid)
{
    $ret = UserGetInfoByID($uid, array('UserRank'));
    return $ret[0]['UserRank'];
}

function UserSetDefaultGroup($member,$gid)
{
    return GroupSetDefault($member,$gid);
}

function UserGetFirstGroup($uid)
{
    if(is_array($uid)){return $uid[0];}
    $groups = GetTableContents(usergroups,array('UserGroupID'),'WHERE UserID='.$uid.' LIMIT 1');
    return $groups[0]['UserGroupID'];
}

function UserGetNameByID($uid)
{
    $ret = UserGetInfoByID($uid, array('UserName'));
    return $ret[0]['UserName'];
}

function UserGetIDByName($uid)
{
    if(is_array($uid)){
        return UserGetInfoByID( array_toupper($uid),array('UserID'), 'upper(UserName)', 'STR');
    }else{
        $ret = UserGetInfoByID(strtoupper($uid), array('UserID'), 'upper(UserName)', 'STR');
        return $ret[0]['UserID'];
    }
}

function UserGetLastGroup($uid)
{
    $result = _mysql_query('SELECT UserGroupID FROM '.usergroups.' WHERE UserID IN ('.$uid.') ORDER BY UserGroupID DESC');
    $group = @_mysql_result($result,0);
    if(!$group){throw new Exception('Failed to get user last group UserGetLastGroup('.$uid.')');}
    return $group;
}

function UserIsFounder($uid){
    $founder = UserGetInfoByID($uid,array('UserFounder'));
    $founder = ToBool($founder[0]['UserFounder']);
    return $founder;
}


/*  #FUNCTION# ;===============================================================================

Name...........: UserGetInfoByID
Description ...:
Syntax.........: UserGetInfoByID($uid[, $aFields = 'ALL'[, $column = 'UserID']])
Parameters ....: $uid     -
                 $aFields - [Optional]
                 $column  - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function UserGetInfoByID($uid,$aFields = 'ALL', $column = 'UserID',$type = 'INT',$debug = false){
    if (is_array($uid)){
        if($type == 'STR'){$condition = implode_string(',',$uid);}
        else{$condition = implode(',',$uid);}
        return GetTableContents(users,$aFields,' WHERE '.$column.' IN ('.$condition.')', $debug);
    }else{
        if($type == 'STR'){$uid = "'".$uid."'";}
        return GetTableContents(users,$aFields,' WHERE '.$column.' = '.$uid, $debug);
    }
}

function UserExists($uid)
{
    $result = _mysql_query('SELECT UserID FROM '.users.' WHERE UserID = '.$uid);
    return _mysql_num_rows($result);
}

function UserAdd($Name, $Password='password', $Email='', $Avatar='', $Joindate=0, $PostCount=0, $IsFounder=0, $IsAdmin=0 )
{
    if(UserGetIDByName($Name)){
        return false;
    }
    $query = 'INSERT INTO '.users. "(UserID, UserName, UserPassword, UserEmail, UserAvatar, UserJoinDate, UserPostCount, UserFounder, UserAdmin)
    VALUES('NULL','".$Name."','".md5($Password)."','".$Email."','".$Avatar."','".$Joindate."','".$PostCount."','".$IsFounder."','".$IsAdmin."')";//secure it!!
    
    $result = _mysql_query($query);
    if (!$result){return false;}
    return $result;
}

function UserList($start,$end)
{
    return GetTableContents(users,array('UserID','UserName','UserEmail','UserPostCount','UserJoinDate'),'ORDER BY UserName ASC LIMIT '.$start.', '.$end);
}


?>