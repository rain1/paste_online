#include <IE.au3>
;DirRemove ( "E:\Software\xampp\mysql\data\paste" ,1 )
DirCopy(@ScriptDir&"\paste","E:\Software\xampp\mysql\data\paste",1)


$oIE = _IECreate("http://localhost/?a=register")
$oForm = _IEFormGetObjByName($oIE, "paste")
$oText = _IEFormElementGetObjByName($oForm, "UserName")
_IEFormElementSetValue($oText, "User32")
$oText = _IEFormElementGetObjByName($oForm, "UserEmail")
_IEFormElementSetValue($oText, "root@gmail.com")
$oText = _IEFormElementGetObjByName($oForm, "UserPassword")
_IEFormElementSetValue($oText, "pass")
$oText = _IEFormElementGetObjByName($oForm, "UserPasswordConfirm")
_IEFormElementSetValue($oText, "pass")
_IEFormSubmit($oForm)

_IENavigate($oIE,"http://localhost/?a=login",1)
$oForm = _IEFormGetObjByName($oIE, "signin")
$oText = _IEFormElementGetObjByName($oForm, "UserName")
_IEFormElementSetValue($oText, "User32")
$oText = _IEFormElementGetObjByName($oForm, "UserPassword")
_IEFormElementSetValue($oText, "pass")
_IEFormSubmit($oForm)


_IENavigate($oIE,"http://localhost/",1)
$oForm = _IEFormGetObjByName($oIE, "paste")
$oText = _IEFormElementGetObjByName($oForm, "code")
_IEFormElementSetValue($oText, "Sample code")
$oText = _IEFormElementGetObjByName($oForm, "language")
_IEFormElementSetValue($oText, "cpp")
$oText = _IEFormElementGetObjByName($oForm, "expiration")
_IEFormElementSetValue($oText, "0")
$oText = _IEFormElementGetObjByName($oForm, "exposure")
_IEFormElementSetValue($oText, "1")
$oText = _IEFormElementGetObjByName($oForm, "name")
_IEFormElementSetValue($oText, "Sample title")
_IEFormSubmit($oForm,1)

Sleep(1000)

$html = _IEBodyReadHTML($oIE)
ConsoleWrite($html & @LF)
If StringInStr($html,"By User32") and StringInStr($html,"Sample code") Then
	ConsoleWrite("Success"&@CRLF)
Else
	ConsoleWrite("Fail"&@CRLF)
EndIf

_IENavigate($oIE,"http://localhost/?a=logout",1)

_IEQuit($oIE)


DirCopy(@ScriptDir&"\paste","E:\Software\xampp\mysql\data\paste",1) ; taastame seisu