<?php
$MODE = 'mysqli';
$DB = NULL;

/*  #FUNCTION# ;===============================================================================

Name...........: ConnectDataBase
Description ...:
Syntax.........: ConnectDataBase()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ConnectDataBase()
{
	global $DB_CONNECTED;
	//Make sure that only 1 connection is created
	if($DB_CONNECTED != true) {
		global $DATABASE_SERVER;
		global $DATABASE_PORT;
		global $DATABASE_USER;
		global $DATABASE_NAME;
		global $DATABASE_PASSWORD;
        global $MODE;
		global $DB;
		//IF port set, use it
        if($MODE=='mysql'){
            if($DATABASE_PORT != "") {$DATABASE_SERVER = $DATABASE_SERVER.":".$DATABASE_PORT;}
            $DB = @mysql_connect($DATABASE_SERVER, $DATABASE_USER, $DATABASE_PASSWORD);
            if (!$DB) {errorPushTitle("Database error");ErrorPushBody("Unable to connect to: ".$DATABASE_SERVER);ErrorCall();}
            $sel = @mysql_select_db($DATABASE_NAME);
            if (!$sel) {errorPushTitle("Database error");ErrorPushBody("Unable to select database ".$DATABASE_NAME);ErrorCall();}
            $DB_CONNECTED = true;
        }elseif($MODE=='mysqli'){
            if($DATABASE_PORT != "") {$DATABASE_SERVER= $DATABASE_SERVER.":".$DATABASE_PORT;}
            $DB = new mysqli($DATABASE_SERVER, $DATABASE_USER, $DATABASE_PASSWORD, $DATABASE_NAME);
			if ($DB->connect_error) {
			   print("Not connected, error: " . $DB->connect_error . "<br>");
			}

        }
		return $DB;
	}else {return false;}
}

/*  #FUNCTION# ;===============================================================================

Name...........: DBGetColumnsList
Description ...:
Syntax.........: DBGetColumnsList($name)
Parameters ....: $name -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function DBGetColumnsList($name)
{
    global $MODE,$DB;
    $aColumns = array();
    if($MODE=='mysql'){
        $result = _mysql_query("SHOW COLUMNS FROM ".$name."");
        while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
            $aColumns[] = $row[0] ;
        }
    }elseif($MODE=='mysqli'){
        $result = $DB->mysqli_query("SHOW COLUMNS FROM ".$name."");
        while ($row = $DB->mysqli_fetch_array ($result, MYSQL_NUM)) {
            $aColumns[] = $row[0] ;
        }
    }
    return $aColumns;
}

/*  #FUNCTION# ;===============================================================================

Name...........: _mysql_query
Description ...:
Syntax.........: _mysql_query($sStr)
Parameters ....: $sStr -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function _mysql_query($query) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_query($query);
    }elseif($MODE=='mysqli'){
        $res = $DB->query($query);
    }
    return $res;
}

function _mysql_result($result,$row,$field= 0) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_result($result,$row,$field);
    }elseif($MODE=='mysqli'){
        if(gettype($field) == "integer" ){
            $row = mysqli_fetch_array($result, MYSQLI_NUM);
            $res = $row[$field];
            if($res == NULL){
                return false;
            }
        }else{
            mysqli_data_seek($result,$row);
            $row = mysqli_fetch_assoc($result);
            $res = $row[$field];
            if($res == NULL){
                return false;
            }
        }
    }
    return $res;
}

function _mysql_insert_id($link_identifier = NULL) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_insert_id($link_identifier);
    }elseif($MODE=='mysqli'){
        $res = mysqli_insert_id($DB);
    }
    return $res;
}

function _mysql_num_rows($result) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_num_rows($result);
    }elseif($MODE=='mysqli'){
        $res = mysqli_num_rows($result);
    }
    return $res;
}

function _mysql_fetch_array($result, $result_type=MYSQL_BOTH){
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_fetch_array($result,$result_type);
    }elseif($MODE=='mysqli'){
        $res = mysqli_fetch_array($result,$result_type);
        if($res == NULL){
            return false;
        }
    }
    return $res;
}

function _mysql_free_result($result) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_free_result($result);
    }elseif($MODE=='mysqli'){
        $res = mysqli_free_result($result);
    }
    return $res;
}

function _mysql_close($link_indentifier = NULL) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_close($link_indentifier);
    }elseif($MODE=='mysqli'){
        $res = mysqli_close($DB);
    }
    return $res;
}

function _mysql_fetch_assoc($result) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_fetch_assoc($result);
    }elseif($MODE=='mysqli'){
        $res = mysqli_fetch_assoc($result);
        if($res == NULL){
            return false;
        }
    }
    return $res;
}

function _mysql_num_fields($result) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_num_fields($result);
    }elseif($MODE=='mysqli'){
        $res = mysqli_num_fields($result);
        if($res == NULL){
            return false;
        }
    }
    return $res;
}

function _mysql_fetch_field($result) {
    global $MODE,$DB;
    if($MODE=='mysql'){
        $res = mysql_fetch_field($result);
    }elseif($MODE=='mysqli'){
        $res = mysqli_fetch_field($result);
        if($res == NULL){
            return false;
        }
    }
    return $res;
}

?>