//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_PICTURE:C286($0; $image)

$dom:=$1

SVG EXPORT TO PICTURE:C1017($dom; $image; Copy XML data source:K45:17)

//because this is pure vector, no need to re-export 
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
TRANSFORM PICTURE:C988($image; Scale:K61:2; $Zoom->; $Zoom->)

If (NEditor_Get_debug_mode)
	$Debug_Redraw:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_Redraw")
	$Debug_Redraw->:=$Debug_Redraw->+1
	$Debug_CanvasWidth:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_CanvasWidth")
	$Debug_CanvasHeight:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_CanvasHeight")
	PICTURE PROPERTIES:C457($image; $Debug_CanvasWidth->; $Debug_CanvasHeight->)
End if 

$0:=$image