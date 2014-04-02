<?php
//Author: rain
/*
TABLE OF CONTENTS
dbg
ErrorPushTitle
ErrorPushBody
ErrorCall
ArrayDisplay
FileRead
ConnectDataBase
Download
readfile_chunked
TemplateReplaceStrings
GetImageDetails
getDirectoryList
GetStyleList
CreateThumbsPage
CreateSlidePage
ParseAddressBar
GetGeneratlInfo
PicToPage
CreateNavigationBar
SlideView
table
PreChecks
DisplayError
IntToChecked
TemplateReplace
ReplaceUserInfo
StingReplaceFile
IsGroupMember
GetUserRights
ToBool
StringLeft
StringRight
StringTrimLeft
StringTrimRight
DBGetColumnsList
DBGetList
implode_string
SplitLines
GetDebugText
StingReplaceVar
GroupPermissionsManage
ArrayToCombo
ArrayCopyDimension
GetTableContents
ArrayToJS
ReplaceGroupsInfo
ReplaceGeneralInfo
ReplaceFile
DefineGlobals
DefineFooter
*/


function get_root_directory(){
    if(StringRight(getcwd(),3)=='lib'){
        return "..";
    }else{
        return ".";
    }
}


/**lo
/** /
l**/
//fun-ction NOP() {}


/*  #FUNCTION# ;===============================================================================

Name...........: SuccessMessageEx
Description ...:
Syntax.........: SuccessMessageEx($bSuccess, $sSuccessMsg, $sFailMsg, $sSuccessBackLink, $sFailBackLink[, $sSuccessBackLinkText = "Go back"[, $sFailBackLinkText = "Go back"[, $SuccessForwardLink = ""[, $SuccessForwardLinkText = ""]]]])
Parameters ....: $bSuccess               -
                 $sSuccessMsg            -
                 $sFailMsg               -
                 $sSuccessBackLink       -
                 $sFailBackLink          -
                 $sSuccessBackLinkText   - [Optional]
                 $sFailBackLinkText      - [Optional]
                 $SuccessForwardLink     - [Optional]
                 $SuccessForwardLinkText - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function SuccessMessageEx($bSuccess, $sSuccessMsg, $sFailMsg, $sSuccessBackLink, $sFailBackLink, $sSuccessBackLinkText = "Go back", $sFailBackLinkText = "Go back", $SuccessForwardLink = "", $SuccessForwardLinkText = "")
{
//~ dbg('sSuccessBackLink '.$sSuccessBackLink,
            //~ 'sFailBackLink '.$sFailBackLink,
            //~ 'sSuccessBackLinkText '.$sSuccessBackLinkText,
            //~ 'sFailBackLinkText '.$sFailBackLinkText,
            //~ 'SuccessForwardLink '.$SuccessForwardLink,
            //~ 'SuccessForwardLinkText '.$SuccessForwardLinkText);
    if($bSuccess){
        $ACPACTION = "success.html";
        $Notification = $sSuccessMsg."<br><br>";
        if (strlen($SuccessForwardLink) > 0){
            $Notification .= "<a href='".$SuccessForwardLink."' style='Color: #EEEEEE;'><b>".$SuccessForwardLinkText."</b></a><br>";
        }
		$Notification .= "<a href='".$sSuccessBackLink."' style='Color: #EEEEEE;'><b>".$sSuccessBackLinkText."</b></a>";
    }
    else{
        $ACPACTION = "failure.html";
        $Notification=$sFailMsg."<br><br><a href='".$sFailBackLink."' style='Color: #EEEEEE;'><b>".$sFailBackLinkText."</b></a>";
    }
    return array($ACPACTION,$Notification);
}

function SetError($error)
{
    global $LAST_ERROR;
    $LAST_ERROR = $error;
}

function GetError($error)
{
    global $LAST_ERROR;
    return $LAST_ERROR;
}

function BitAndMessage($MessageArray,$nr){
    for($i = 0; $i < count($MessageArray); $i ++)
    {
        if(pow(2,$i) & $nr){
            $ret[] = $MessageArray[pow(2,$i)];
        }
    }
    return $ret;
}

function RandomString($len)
{
    $chr = array('q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j',
    'a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m','Q','W','E','R',
    'T','Y','U','I','O','P','A','S','D','F','G','H','J','A','S','D','F','G','H','J',
    'K','L','Z','X','C','V','B','N','M','1','2','3','4','5','6','7','8','9','0','.',
    ',','-','/','*','+',')','(','!','$','%','&','[',']','{','}','@');
    $str = "";
    for($i = 0;$i < $len;$i++)
    {
        $str .= $chr[rand(0, count($chr)-1)];
    }
    return $str;
}

/*  #FUNCTION# ;===============================================================================

Name...........: DBGetList
Description ...:
Syntax.........: DBGetList()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
//~ function DBGetList()
//~ {
	//~ global $DB_TABLES;
	//~ $keys = array_keys($DB_TABLES);
	//~ for($i = 0;$i < count($keys);$i++)
	//~ {
		//~ $sVarName = $DB_TABLES[$keys[$i]];
		//~ eval('global '.$sVarName.'; $aArray = '.$sVarName.';');
		//~ $ret[] = $aArray[this];
	//~ }
	//~ return $ret;
//~ }

/*ignore*/
function dbg($var1 = NULL, $var2 = NULL, $var3 = NULL, $var4 = NULL, $var5 = NULL, $var6 = NULL, $var7 = NULL, $var8 = NULL, $var9 = NULL, $var10 = NULL, $var11 = NULL, $var12 = NULL, $var13 = NULL, $var14 = NULL, $var15 = NULL, $var16 = NULL, $var17 = NULL, $var18 = NULL, $var19 = NULL, $var20 = NULL, $var21 = NULL, $var22 = NULL, $var23 = NULL, $var24 = NULL, $var25 = NULL, $var26 = NULL, $var27 = NULL, $var28 = NULL, $var29 = NULL, $var30 = NULL, $var31 = NULL, $var32 = NULL, $var33 = NULL, $var34 = NULL, $var35 = NULL, $var36 = NULL, $var37 = NULL, $var38 = NULL, $var39 = NULL, $var40 = NULL, $var41 = NULL, $var42 = NULL, $var43 = NULL, $var44 = NULL, $var45 = NULL, $var46 = NULL, $var47 = NULL, $var48 = NULL, $var49 = NULL, $var50 = NULL, $var51 = NULL, $var52 = NULL, $var53 = NULL, $var54 = NULL, $var55 = NULL, $var56 = NULL, $var57 = NULL, $var58 = NULL, $var59 = NULL, $var60 = NULL, $var61 = NULL, $var62 = NULL, $var63 = NULL, $var64 = NULL, $var65 = NULL, $var66 = NULL, $var67 = NULL, $var68 = NULL, $var69 = NULL, $var70 = NULL, $var71 = NULL, $var72 = NULL, $var73 = NULL, $var74 = NULL, $var75 = NULL, $var76 = NULL, $var77 = NULL, $var78 = NULL, $var79 = NULL, $var80 = NULL, $var81 = NULL, $var82 = NULL, $var83 = NULL, $var84 = NULL, $var85 = NULL, $var86 = NULL, $var87 = NULL, $var88 = NULL, $var89 = NULL, $var90 = NULL, $var91 = NULL, $var92 = NULL, $var93 = NULL, $var94 = NULL, $var95 = NULL, $var96 = NULL, $var97 = NULL, $var98 = NULL, $var99 = NULL, $var100 = NULL, $var101 = NULL, $var102 = NULL, $var103 = NULL, $var104 = NULL, $var105 = NULL, $var106 = NULL, $var107 = NULL, $var108 = NULL, $var109 = NULL, $var110 = NULL, $var111 = NULL, $var112 = NULL, $var113 = NULL, $var114 = NULL, $var115 = NULL, $var116 = NULL, $var117 = NULL, $var118 = NULL, $var119 = NULL, $var120 = NULL, $var121 = NULL, $var122 = NULL, $var123 = NULL, $var124 = NULL, $var125 = NULL, $var126 = NULL, $var127 = NULL, $var128 = NULL, $var129 = NULL, $var130 = NULL, $var131 = NULL, $var132 = NULL, $var133 = NULL, $var134 = NULL, $var135 = NULL, $var136 = NULL, $var137 = NULL, $var138 = NULL, $var139 = NULL, $var140 = NULL, $var141 = NULL, $var142 = NULL, $var143 = NULL, $var144 = NULL, $var145 = NULL, $var146 = NULL, $var147 = NULL, $var148 = NULL, $var149 = NULL, $var150 = NULL, $var151 = NULL, $var152 = NULL, $var153 = NULL, $var154 = NULL, $var155 = NULL, $var156 = NULL, $var157 = NULL, $var158 = NULL, $var159 = NULL, $var160 = NULL, $var161 = NULL, $var162 = NULL, $var163 = NULL, $var164 = NULL, $var165 = NULL, $var166 = NULL, $var167 = NULL, $var168 = NULL, $var169 = NULL, $var170 = NULL, $var171 = NULL, $var172 = NULL, $var173 = NULL, $var174 = NULL, $var175 = NULL, $var176 = NULL, $var177 = NULL, $var178 = NULL, $var179 = NULL, $var180 = NULL, $var181 = NULL, $var182 = NULL, $var183 = NULL, $var184 = NULL, $var185 = NULL, $var186 = NULL, $var187 = NULL, $var188 = NULL, $var189 = NULL, $var190 = NULL, $var191 = NULL, $var192 = NULL, $var193 = NULL, $var194 = NULL, $var195 = NULL, $var196 = NULL, $var197 = NULL, $var198 = NULL, $var199 = NULL, $var200 = NULL, $var201 = NULL, $var202 = NULL, $var203 = NULL, $var204 = NULL, $var205 = NULL, $var206 = NULL, $var207 = NULL, $var208 = NULL, $var209 = NULL, $var210 = NULL, $var211 = NULL, $var212 = NULL, $var213 = NULL, $var214 = NULL, $var215 = NULL, $var216 = NULL, $var217 = NULL, $var218 = NULL, $var219 = NULL, $var220 = NULL, $var221 = NULL, $var222 = NULL, $var223 = NULL, $var224 = NULL, $var225 = NULL, $var226 = NULL, $var227 = NULL, $var228 = NULL, $var229 = NULL, $var230 = NULL, $var231 = NULL, $var232 = NULL, $var233 = NULL, $var234 = NULL, $var235 = NULL, $var236 = NULL, $var237 = NULL, $var238 = NULL, $var239 = NULL, $var240 = NULL, $var241 = NULL, $var242 = NULL, $var243 = NULL, $var244 = NULL, $var245 = NULL, $var246 = NULL, $var247 = NULL, $var248 = NULL, $var249 = NULL, $var250 = NULL, $var251 = NULL, $var252 = NULL, $var253 = NULL, $var254 = NULL) {
	global $OPT_NO_DBG;
	if($OPT_NO_DBG !== true){
		for($i = 1 ;$i < 255;$i++) {
			eval('$var = $var'.$i.";");
			//echo '$var = $var'.$i."<br>";
			if($var !== NULL) {
				echo str_replace(array("\r\n","\r","\n"," "),array("\n","\n","<br>\r\n","&nbsp;"),htmlentities(GetDebugText($var)));
			}
		}
	}
}

/*  #FUNCTION# ;===============================================================================

Name...........: GetDebugText
Description ...:
Syntax.........: GetDebugText($var)
Parameters ....: $var -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function GetDebugText($var) {
	if (is_bool($var)){
		$sStr = "false";
		if ($var){$sStr = "true";}
		return 'DEBUG: BOOL => "'.$sStr.'"'."\n";
	}
	if (is_int($var)){
		return 'DEBUG: INT => "'.$var.'"'."\n";
	}
	if (is_float($var)){
		return 'DEBUG: FLOAT => "'.$var.'"'."\n";
	}
	if (is_object($var)){
		return 'DEBUG: OBJECT => "'.$var.'"'."\n";
	}
	if (is_string($var)){
		return 'DEBUG: STR => "'.$var.'"'."\n";
	}
	if (is_resource($var)){
		return 'DEBUG: RESOURCE => "'.$var.'"'."\n";
	}
	if (is_array($var)){
		return 'DEBUG: ARRAY => "'.print_r($var,true).'"'."\n";
	}

}

/*  #FUNCTION# ;===============================================================================

Name...........: ErrorPushTitle
Description ...:
Syntax.........: ErrorPushTitle($sStr)
Parameters ....: $sStr -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ErrorPushTitle($sStr){global $error_title ;$error_title = $sStr;}
/*  #FUNCTION# ;===============================================================================

Name...........: ErrorPushBody
Description ...:
Syntax.........: ErrorPushBody($sStr)
Parameters ....: $sStr -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ErrorPushBody($sStr){global $error_msg ;$error_msg .= $sStr."<br>\n";}
/*  #FUNCTION# ;===============================================================================

Name...........: ErrorCall
Description ...:
Syntax.........: ErrorCall()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ErrorCall(){global $error_title,$error_msg;DisplayError($error_title,$error_msg);}

function ErrorGet(){global $error_title,$error_msg;return DisplayError($error_title,$error_msg,true);}

/*  #FUNCTION# ;===============================================================================

Name...........: implode_string
Description ...:
Syntax.........: implode_string($delimiter, $array[, $quote = "'"])
Parameters ....: $delimiter -
                 $array     -
                 $quote     - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function implode_string($delimiter, $array, $quote = "'")
{
    $str = '';
    for($i = 0;$i < count($array);$i++)
    {
        $str .= $quote.$array[$i].$quote.$delimiter;
    }
    $str =  StringTrimRight($str,strlen($delimiter));
    return $str;
}

/*  #FUNCTION# ;===============================================================================

Name...........: SplitLines
Description ...:
Syntax.........: SplitLines($string)
Parameters ....: $string -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function SplitLines($string)
{
    $string = str_replace("\r\n","\n",$string);
    $string = str_replace("\r","\n",$string);
    return explode("\n",$string);
}

/*  #FUNCTION# ;===============================================================================

Name...........: FileRead
Description ...:
Syntax.........: FileRead($sFile)
Parameters ....: $sFile -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function FileRead($sFile){
	$fd = fopen ($sFile , "r") ;
	if ($fd) {
		if (filesize($sFile) > 0){
			$fstring = fread ($fd , filesize ($sFile)) ;
			fclose($fd);
			return $fstring;
		}else{
			fclose($fd);
			return "";
			}
	}
	else{
		echo '<font color="#FF0000">ERROR:</font> Can not read file '.$sFile;
		return false;
	}
}

/*  #FUNCTION# ;===============================================================================

Name...........: readfile_chunked
Description ...:
Syntax.........: readfile_chunked($filename[, $retbytes = TRUE])
Parameters ....: $filename -
                 $retbytes - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function readfile_chunked($filename, $retbytes = TRUE) {
	$buffer = '';
	$cnt =0;
	$handle = fopen($filename, 'rb');
	if ($handle === false) {
		return false;
	}
	while (!feof($handle)) {
		$buffer = fread($handle, CHUNK_SIZE);
		echo $buffer;
		ob_flush();
		flush();
		if ($retbytes) {
			$cnt += strlen($buffer);
		}
	}
	$status = fclose($handle);
	if ($retbytes && $status) {
		return $cnt; // return num. bytes delivered like readfile() does.
	}
	return $status;
}


/*  #FUNCTION# ;===============================================================================

Name...........: StingReplaceVar
Description ...:
Syntax.........: StingReplaceVar($string)
Parameters ....: $string -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function StingReplaceVar($string){
	global $CRITICAL_VAR;
	$pattern = '/\{\%([\$\w\[\]\"\"\'\'\/\.]+)\%\}/s';

	preg_match_all($pattern, $string, $matches);

	foreach ($matches[0] as $key => $match) {
		$SquareBracket = strpos($matches[1][$key],"[");

		if ($SquareBracket) {
			$VarName = StringLeft($matches[1][$key],$SquareBracket);
			$VarDimension= StringTrimLeft($matches[1][$key],$SquareBracket);
		}
		else{$VarName = $matches[1][$key];}

		$data = "";
		$SecurityRisk = false;

		foreach($CRITICAL_VAR as $value){
			if($value == $VarName) {$SecurityRisk = true;}
		}

		if(!$SecurityRisk) {
			$cmd = 'global '. $VarName .'; $data = '.$matches[1][$key].';';
			if (strlen($VarDimension) > 0) {
				$VarDimension = str_replace("]","",$VarDimension);
				$arrayParts = explode("[",$VarDimension);
				for ($varlist = 0; $varlist < count($arrayParts); $varlist++){
					if (StringLeft($arrayParts[$varlist],1) == '$'){eval('global '.$arrayParts[$varlist].';');}
				}
			}
			eval ($cmd);
		}

		//~ global $SITE_GLOBALS; $data = $SITE_GLOBALS["views"];
		//~ dbg($cmd,$SITE_GLOBALS);
		$string = str_replace("{%".$matches[1][$key]."%}",$data,$string);
	}
	//~ dbg($string);
	return $string;
}

//Lists files in directory
// directory - directory to list
// filter - filter to use (string that file name must contain (ex: .jpg)
/*  #FUNCTION# ;===============================================================================

Name...........: getDirectoryList
Description ...:
Syntax.........: getDirectoryList($directory, $filter[, $bDirOnly = false])
Parameters ....: $directory -
                 $filter    -
                 $bDirOnly  - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function getDirectoryList($directory, $filter, $bDirOnly = false) {
	$results = array();
	$handler = opendir($directory);
	if(is_resource($handler)) {
	if ($bDirOnly == false){
		while ($file = readdir($handler)) {
			$ext = end(explode('.', $file));
			if ($file != "." && $file != ".." && stristr( $ext , $filter)) {
				$results[] = $file;
			}
		}
	}else {
		while ($file = readdir($handler)) {
			if ($file != "." && $file != "..") {
				if	(is_dir($directory."/".$file)){
					$results[] = $file;
				}
			}
		}
	}
	closedir($handler);
	}
	return $results;
}


function GetDirectoryFileList($directory,$filter = '*') {
	$results = array();
	$handler = opendir($directory);
	if(is_resource($handler)) {
		while ($file = readdir($handler)) {
			if ($file != "." && $file != "..") {
				if	(is_file($directory."/".$file) && ValidateFileName($file,$filter)){
					$results[] = $file;
				}
			}
		}

	closedir($handler);
	}
	return $results;
}

function ValidateFileName($file,$filter = '*')
{
    if($filter == '*'){return true;}
    $array = explode('|',$filter);
    $parts = explode('.',$file);
    $ext = end($parts);
    if (array_search($ext,$array)){return true;}
    return false;
}

/*  #FUNCTION# ;===============================================================================

Name...........: GetStyleList
Description ...:
Syntax.........: GetStyleList()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function GetStyleList() {
	if ( StringRight(getcwd(),3) == "lib"){
		return getDirectoryList("../theme","",true);
	}else{
		return getDirectoryList("./theme","",true);
	}
}

/*  #FUNCTION# ;===============================================================================

Name...........: CreateThumbsPage
Description ...:
Syntax.........: CreateThumbsPage()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function CreateThumbsPage(){
	PreChecks();
	global $General,$Page,$LinksData;
	if (strlen($Page) < 1) {$Page = 0;}
	if ($Pic >= 0) {$Page = (int)PicToPage();}
	$HTML = FileRead("thumbs.html");
	CreateNavigationBar();
	dbg("thumb");
	//dbg($GENERAL[this]);
}

/*  #FUNCTION# ;===============================================================================

Name...........: CreateSlidePage
Description ...:
Syntax.........: CreateSlidePage()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function CreateSlidePage(){
	PreChecks();
	global $MiniW,$MiniH,$LinksData;
	$HTML = FileRead("Large.html");
	CreateNavigationBar();
	dbg("slide");
	include_once "post.php";

}

//MAIN function
/*  #FUNCTION# ;===============================================================================

Name...........: ParseAddressBar
Description ...:
Syntax.........: ParseAddressBar()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ParseAddressBar(){
	global $pic,$Download,$files;
	if(strlen($Pic) >= 1) {
		CreateSlidePage();
	}else{
		CreateThumbsPage();
	}

	if (strlen($Download) >= 1) {Download($files[$Download]);}

	if (strlen($SearchKeyword) > 0) {
		$SearchResult = array_search( $SearchKeyword , $files );
		if ($SearchResult == false) {echo"File not found";}else {header("location:./index.php?pic=".$SearchResult);}
	}

	_mysql_close();
	exit();
}


/*  #FUNCTION# ;===============================================================================

Name...........: PicToPage
Description ...:
Syntax.........: PicToPage()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function PicToPage() {
	global $cols, $rows, $Pic;
	if ($Pic == 0) {
		return 0;
	}else {
		return $Pic/($cols*$rows);
	}
}

//Sets value for $LinksData
/*  #FUNCTION# ;===============================================================================

Name...........: CreateNavigationBar
Description ...:
Syntax.........: CreateNavigationBar()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function CreateNavigationBar(){
	global $LinksData,$files,$cols,$rows;
	$iFileCount = count($files);
	for ($i = 0 ; $i < $iFileCount/($cols*$rows); $i++) {
		if ($i == $Page) {$LinksData .= '<a href="?page='.$i .'">'.'<span style="background-color: #8DBAE1;">'.($i+1).'</span>'."</a>|";
		}else {$LinksData .= '<a href="?page='.$i.'">'.($i+1)."</a>|";}
	}
}

/*  #FUNCTION# ;===============================================================================

Name...........: SlideView
Description ...:
Syntax.........: SlideView($iPage)
Parameters ....: $iPage -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function SlideView($iPage) {
	global $cols, $rows, $files, $iFileCount;
	$iStart = $iPage*$cols*$rows;
	return "<!-- Main table Start-->\n".table($cols, $rows, $files, $iStart)."		<!-- Main table End-->\n";
}


/*  #FUNCTION# ;===============================================================================

Name...........: table
Description ...:
Syntax.........: table($iWidth, $iHeight, $aFiles, $iStart)
Parameters ....: $iWidth  -
                 $iHeight -
                 $aFiles  -
                 $iStart  -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function table($iWidth, $iHeight, $aFiles, $iStart) {
	global $PicWidth, $PicHeight, $ImagesBkColor, $ColWidth, $RowHeight ;
	$iFileCount = count($aFiles);
	$stable = '			<table align="center" cellpadding="0" cellspacing="6" border="0" bgcolor='.$ImagesBkColor .">\n				</tbody>";
	$iCounter = $iStart;
	for ($i = 1; $i <= $iHeight; $i++) {
		$stable .= '				<tr>'."\n";
		for ($n = 1; $n <= $iWidth; $n++) {
			if ($iCounter < $iFileCount) {
				$sText = "\n".' 					<table align="center" border="0" cellpadding="0" cellspacing="0" width="266">'."\n".'					<tbody><tr><td style="width: 266px; height: 206px; margin-left: auto; margin-right: auto; text-align: center;" class="thumb">'."\n".'					<a href=?pic='.$iCounter.'><img src="thumbs/'.$aFiles[$iCounter].'" alt="'.$aFiles[$iCounter].'" title="'.$aFiles[$iCounter].'" height="'.$PicHeight.'" width="'.$PicWidth .'"/>'."\n".'					</td></tr></tbody></table>'."\n";
			}else {$sText = "";}
			$stable .= '				<th style="width: '.$ColWidth.'; height: '.$RowHeight.';"  class="container1";>'.$sText.'				</th>'."\n";
			$iCounter +=1;
		}
		$stable .= '				</tr>'."\n";
	}
	$stable .= '			</tbody></table>'."\n";
	return  $stable;
}

/*  #FUNCTION# ;===============================================================================


/*  #FUNCTION# ;===============================================================================

Name...........: DisplayError
Description ...:
Syntax.........: DisplayError($sTitle, $sText)
Parameters ....: $sTitle -
                 $sText  -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function DisplayError($sTitle, $sText, $bReturn = false){
	global $LoginData,$ROOTDIR;
	$html = FileRead($ROOTDIR."/error.html");
	//$html = str_replace("{LOGIN}", $LoginData, $html);
	$html = str_replace("{ERROR_TITLE}", $sTitle, $html);
	$html = str_replace("{ERROR_TEXT}", $sText, $html);
    if($bReturn){
        return $html;
    }else{
        die($html);
    }
}

function DisplayErrormessage($bReturn = false){
    $e = GetLastError();
    ErrorPushTitle("Error: ".$e);
    ErrorPushBody("Message: ".GetErrorMessage());
    ErrorCall();
}

/*  #FUNCTION# ;===============================================================================

Name...........: IntToChecked
Description ...:
Syntax.........: IntToChecked($iVal)
Parameters ....: $iVal -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function IntToChecked($iVal){
	$iVal = intval($iVal, 10);
	if($iVal == 1) {return 'checked="checked"';}
	else {return "";}
}

/*  #FUNCTION# ;===============================================================================

Name...........: BoolToChecked
Description ...:
Syntax.........: BoolToChecked($bVal)
Parameters ....: $bVal -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function BoolToChecked($bVal){
	if($bVal) {return 'checked="checked"';}
	else {return "";}
}

//Template handler
/*  #FUNCTION# ;===============================================================================

Name...........: TemplateReplace
Description ...:
Syntax.........: TemplateReplace($sString, $aLoad)
Parameters ....: $sString -
                 $aLoad   -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function TemplateReplace($sString,$aLoad) {
	for ($i = 0;$i < count($aLoad);$i++){
		eval('$sString = Replace'.$aLoad[$i].'($sString);');
	}
	//~ $data = StingReplaceFile($sString,$path);
	$sString = StingReplaceVar($sString);
	//~ if($UserReplace != "") {$data = ReplaceUserInfo($data,$UserReplace );}
	//~ if (!$OPT_NO_ACP){$data = ReplaceGeneralInfo($data);}
	//~ if (!$OPT_NO_ACP){$data = ReplaceGroupsInfo($data,$iGroup);}
	return $sString;
}

/*  #FUNCTION# ;===============================================================================

Name...........: GroupPermissionsManage
Description ...:
Syntax.........: GroupPermissionsManage($sString)
Parameters ....: $sString -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function GroupPermissionsManage($sString){
return $sString;
}

/*  #FUNCTION# ;===============================================================================

Name...........: ArrayToCombo
Description ...:
Syntax.........: ArrayToCombo($aArray[, $sKey = "NULL"[, $sValueKey = "NULL"[, $iStartAt = 0[, $iEndAt = 0]]]])
Parameters ....: $aArray    -
                 $sKey      - [Optional]
                 $sValueKey - [Optional]
                 $iStartAt  - [Optional]
                 $iEndAt    - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ArrayToCombo($aArray, $sKey = "NULL", $sValueKey = "NULL", $iStartAt = 0, $iEndAt = 0){
	$str = "";
	if ($sKey == "NULL"){
		for ($i = $iStartAt; $i < max($iEndAt,count($aArray));$i++)
		{
			$str .= '<option value="'.$i.'">'.$aArray[$i].'</option>'."\n";
		}
	}elseif($sKey != "NULL" && $sValueKey != "NULL"){
		for ($i = $iStartAt; $i < max($iEndAt,count($aArray));$i++)
		{
			$str .= '<option value="'.$aArray[$i][$sValueKey].'">'.$aArray[$i][$sKey].'</option>'."\n";
		}
	}else{
		for ($i = $iStartAt; $i < max($iEndAt,count($aArray));$i++)
		{
			$str .= '<option value="'.$i.'">'.$aArray[$i][$sKey].'</option>'."\n";
		}
	}
	return $str;
}

/*  #FUNCTION# ;===============================================================================

Name...........: ArrayCopyDimension
Description ...:
Syntax.........: ArrayCopyDimension($aArray, $Dimension)
Parameters ....: $aArray    -
                 $Dimension -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ArrayCopyDimension($aArray,$Dimension)
{
	for ($i = 0;$i < count($aArray);$i++)
	{
		$aNew[$i] = $aArray[$i][$Dimension];
	}
	return $aNew;
}


/*  #FUNCTION# ;===============================================================================

Name...........: ArrayToJS
Description ...:
Syntax.........: ArrayToJS($aArray, $sArrayName[, $b2D = false[, $bWrapQuotes = false]])
Parameters ....: $aArray     -
                 $sArrayName -
                 $b2D        - [Optional]
                 $bWrapQuotes- Tells wether to wrap first dimensin in quotes or not
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ArrayToJS($aArray,$sArrayName,$b2D = false, $bWrapQuotes = false){
	$sRet = "var ".$sArrayName." = [];\n";
    if($aArray == null){return $sRet;}
	if ($b2D){
		$aMainKeys = array_keys($aArray);
		for ($i = 0; $i < count($aMainKeys);$i++)
		{
			$aSubKeys = array_keys($aArray[$aMainKeys[$i]]);
            if ($bWrapQuotes) {
                $sRet .= $sArrayName.'["'.$aMainKeys[$i].'"] = [];'."\n";
            }else{
                $sRet .= $sArrayName.'['.$aMainKeys[$i].'] = [];'."\n";
            }
			for ($j = 0; $j < count($aSubKeys);$j++)
			{
                if ($bWrapQuotes) {
                    $sRet .= $sArrayName.'["'.$aMainKeys[$i].'"]["'.$aSubKeys[$j].'"] = "'.str_replace(array('\\','"'),array('\\\\','\\"'),$aArray[$aMainKeys[$i]][$aSubKeys[$j]]).'";'."\n";
                }else{
                    $sRet .= $sArrayName.'['.$aMainKeys[$i].']["'.$aSubKeys[$j].'"] = "'.$aArray[$aMainKeys[$i]][$aSubKeys[$j]].'";'."\n";
                }
			}
		}

	}else{
		$aMainKeys = array_keys($aArray);
		for ($i = 0; $i < count($aMainKeys);$i++){
			$sRet .= $sArrayName.'['.$aMainKeys[$i].'] = "'.$aArray[$aMainKeys[$i]].'";'."\n";
		}
	}
	return $sRet;
}

/*  #FUNCTION# ;===============================================================================

Name...........: GetTableContents
Description ...:
Syntax.........: GetTableContents($sTable[, $aColumns = 'ALL'[, $sExtraSQL = '']])
Parameters ....: $sTable    -
                 $aColumns  - [Optional]
                 $sExtraSQL - [Optional]
				 $rawinput - if set overrides all other parameters
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function GetTableContents($sTable,$aColumns = 'ALL', $sExtraSQL = '', $debug = false, $rawinput = NULL)
{
   //~ if($sTable=='general'){$debug  = true;}
    $all = false;
    if($aColumns == 'ALL'){
        $all = true;
    }
    if(!is_array($aColumns) && $aColumns != 'ALL'){
        $aColumns = array($aColumns);
    }
    //SetLastError();

    if ($aColumns == 'ALL'){
        unset($aColumns);// We cant just use string array.
        $result = _mysql_query("SHOW COLUMNS FROM ".$sTable."");
        while ($row = _mysql_fetch_array($result, MYSQL_NUM)) {
            $aColumns[] = $row[0] ;
        }
    }

	if ($rawinput == NULL){
        if($all){
            $select = "*";
        }else{
            $select = implode(", ",$aColumns);
        }

            $Query = 'SELECT '.$select.' FROM '.$sTable.' '.$sExtraSQL;
	}else{
		$Query = $rawinput;
        $aColumns = array();
	}
    if($Query == ""){SetLastError(2);}
	$result = _mysql_query($Query);
    if ($debug){dbg("QUERY: ".$Query);}
	if (!$result){
                if ($debug){dbg("QUERY Error: ".mysql_error());}
		return false;
	}
	if ($rawinput != NULL){
		for($i = 0; $i < _mysql_num_fields($result); $i++) {
			$field_info =_mysql_fetch_field($result, $i);
			$aColumns[] = $field_info->name;
		}
	}
	$bSuccess = true;
	$iCount = 0;
	while($bSuccess) {
            if ($debug){
                $Data = _mysql_result($result, $iCount , $aColumns[0]);
            }else{
                $Data = @_mysql_result($result, $iCount , $aColumns[0]);
            }
            if ($debug){dbg("res: ".$result);}

            if($Data !== false) {
                    $aReturn[$iCount][$aColumns[0]] = $Data;
                    for($i = 1; $i < count($aColumns); $i++) {
                            $aReturn[$iCount][$aColumns[$i]] = @_mysql_result($result, $iCount , $aColumns[$i]);
                    }
            }else {$bSuccess = false;}
            $iCount ++;
	}
        if($debug){
            dbg("return ".$aReturn."end_return\n");
        }
    if(array_search($sTable,array(attachments,bans,forms,post,report,sessions,topic,users,warn,''))){
        $aReturn = IntToTime($sTable,$aReturn);
    }
	return $aReturn;

}


function IntToTime($table_name,$table_data){
    global $SITESETTINGS;
    $time_columns = array(
        attachments => 'time',
        bans => 'StartAt|EndAt',
        forms =>'Time',
        post=>'Time|EditTime',
        report=>'Time|CloseTime',
        sessions=>'Start|End',
        topic=>'Time|LastPostTime',
        users=>'UserJoinDate',
        warn=>'Time',
        ''=>'Time'
    );
    //dbg($table_name);
    $times = explode("|",$time_columns[$table_name]);
    for($i= 0;$i < count($table_data); $i++){
        for($j= 0;$j < count($times); $j++){
            if($SITESETTINGS['TIMEFORMAT']== "0"){
                $table_data[$i][$times[$j]."_timestamp"] = $table_data[$i][$times[$j]];
                $table_data[$i][$times[$j]] = "Never";
            }else{
                $table_data[$i][$times[$j]."_timestamp"] = $table_data[$i][$times[$j]];
                $table_data[$i][$times[$j]] = date($SITESETTINGS['TIMEFORMAT'],$table_data[$i][$times[$j]]);
            }
        }
    }
    return $table_data;
}

/*  #FUNCTION# ;===============================================================================

Name...........: ReplaceFile
Description ...:
Syntax.........: ReplaceFile($string[, $Path = ""])
Parameters ....: $string -
                 $Path   - [Optional]
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ReplaceFile($string,$Path = ""){
	$pattern = '/\{\{([\w+\/\.]+)\}\}/s';

	preg_match_all($pattern, $string, $matches);

	foreach ($matches[0] as $key => $match) {
		$data = ReplaceFile(file_get_contents($Path.$matches[1][$key]));
		$string = str_replace("{{".$matches[1][$key]."}}",$data,$string);
	}
	return $string;
}


/*  #FUNCTION# ;===============================================================================

Name...........: ToBool
Description ...:
Syntax.........: ToBool($Boolean)
Parameters ....: $Boolean -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function ToBool($Boolean) {
	$Boolean = intval($Boolean);
	if($Boolean == 1) {return true;}else {return false;}
}

/*  #FUNCTION# ;===============================================================================

Name...........: DefineGlobals
Description ...:
Syntax.........: DefineGlobals()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function DefineGlobals(){
	global $SITE_GLOBALS,$GENERAL;
	if (!$SITE_GLOBALS){
		$keys = array_keys($GENERAL);
		$result = _mysql_query('SELECT * FROM '.general);
		for($i = 1;$i < count($keys);$i++) {//0th is this
			$SITE_GLOBALS[$GENERAL[$keys[$i]]["Name"]] = _mysql_result($result, 0 , $GENERAL[$keys[$i]]["Name"]);
		}
	}
}

/*  #FUNCTION# ;===============================================================================

Name...........: DefineFooter
Description ...:
Syntax.........: DefineFooter()
Parameters ....:
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function DefineFooter(){
	DefineGlobals();
	global $SITE_FOOTER,$SITE_GLOBALS,$OPT_NO_DBG;
	$OPT_NO_DBG = false;
	if (!$SITE_FOOTER){
		$Status = file_get_contents("../theme/default/status.html");
		//dbg("called: ".$SITE_GLOBALS['Views']);
		$SITE_FOOTER = StingReplaceVar($Status);
	}
}

function array_toupper($array)
{
    foreach ($array as $key => $value) {
        $ret[$key] = strtoupper($value);
    }
    return $ret;
}

//http://www.autoitscript.com/autoit3/docs/functions.htm
/*  #FUNCTION# ;===============================================================================

Name...........: StringLeft
Description ...:
Syntax.........: StringLeft($sString, $iCount)
Parameters ....: $sString -
                 $iCount  -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function StringLeft($sString,$iCount)
{
	return substr ( $sString ,0, $iCount );
}

/*  #FUNCTION# ;===============================================================================

Name...........: StringRight
Description ...:
Syntax.........: StringRight($sString, $iCount)
Parameters ....: $sString -
                 $iCount  -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function StringRight($sString,$iCount)
{
	return substr ( $sString , strlen($sString) - $iCount, strlen($sString));
}

/*  #FUNCTION# ;===============================================================================

Name...........: StringTrimLeft
Description ...:
Syntax.........: StringTrimLeft($sString, $iCount)
Parameters ....: $sString -
                 $iCount  -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function StringTrimLeft($sString,$iCount)
{
	return substr ( $sString ,$iCount, strlen($sString) );
}

/*  #FUNCTION# ;===============================================================================

Name...........: StringTrimRight
Description ...:
Syntax.........: StringTrimRight($sString, $iCount)
Parameters ....: $sString -
                 $iCount  -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function StringTrimRight($sString,$iCount)
{
	return substr ( $sString ,0 , strlen($sString) - $iCount);
}


/*  #FUNCTION# ;===============================================================================

Name...........: CheckboxToInt
Description ...:
Syntax.........: CheckboxToInt($sStr)
Parameters ....: $sStr -
Author ........:
Modified.......:
Remarks .......:
Related .......:
Parameters ....:
Link ..........:
Example .......:
;==========================================================================================*/
function CheckboxToBool($sStr){
	if($sStr == "on") {return true;}
	return false;
}

//~ /*  #FUNCTION# ;===============================================================================

//~ Name...........: CheckboxToInt
//~ Description ...:
//~ Syntax.........: CheckboxToInt($sStr)
//~ Parameters ....: $sStr -
//~ Author ........:
//~ Modified.......:
//~ Remarks .......:
//~ Related .......:
//~ Parameters ....:
//~ Link ..........:
//~ Example .......:
//~ ;==========================================================================================*/
//~ function CheckboxToInt($sStr){
	//~ if($sStr == "on") {return 1;}
	//~ return 0;
//~ }



?>