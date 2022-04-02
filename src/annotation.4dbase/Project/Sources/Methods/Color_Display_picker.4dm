//%attributes = {"invisible":true}
C_LONGINT:C283($1; $2; $3; $0)

$params:=Count parameters:C259

If ($params=0)
	$color:=0
Else 
	$color:=$1
End if 

If ($params>2)
	$x:=$2
	$y:=$3
Else 
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
End if 

//to avoid freeze in debugging
//$windowId:=Open form window("Legacy Color";Regular window;$x;$y)
$windowId:=Open form window:C675("Legacy Color"; Pop up form window:K39:11; $x; $y)
SET WINDOW TITLE:C213(Str($color); $windowId)
DIALOG:C40("Legacy Color")

If (OK=1)
	
	$0:=Num:C11(Get window title:C450($windowId))
	
Else 
	
	$0:=$color
	
End if 

CLOSE WINDOW:C154($windowId)