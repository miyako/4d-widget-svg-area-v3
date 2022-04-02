//%attributes = {"invisible":true}
C_TEXT:C284($1; <>LABEL_FONT_NAME)
C_LONGINT:C283($2; $3)

$params:=Count parameters:C259

If ($params=0)
	<>LABEL_FONT_NAME:=_O_Font name:C462(0)
Else 
	<>LABEL_FONT_NAME:=$1
End if 

If ($params>2)
	$x:=$2
	$y:=$3
Else 
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
End if 

C_BOOLEAN:C305(<>LABEL_FONT_EDITOR_VISIBLE)

If (Not:C34(<>LABEL_FONT_EDITOR_VISIBLE))
	$windowId:=Open form window:C675("Fonts"; Palette form window:K39:9; $x; $y)
	DIALOG:C40("Fonts"; *)
End if 