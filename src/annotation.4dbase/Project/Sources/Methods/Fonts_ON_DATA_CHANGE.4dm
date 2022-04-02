//%attributes = {"invisible":true}
$Search:=OBJECT Get pointer:C1124(Object named:K67:5; "Search")
$Fonts:=OBJECT Get pointer:C1124(Object named:K67:5; "Fonts")

If (Type:C295($Fonts->)=Is longint:K8:6)
	If (Is a list:C621($Fonts->))
		CLEAR LIST:C377($Fonts->; *)
	End if 
End if 

$fontName:=Replace string:C233($Search->; "@"; ""; *)
$list:=Fonts_Create_list($fontName)
VARIABLE TO VARIABLE:C635(Current process:C322; $Fonts->; $list)

//$find:=Find in list($Fonts->;$fontName;0;*)
//If ($find#-1)
//SELECT LIST ITEMS BY REFERENCE($Fonts->;$find)
//end if