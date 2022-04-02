//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_PICTURE:C286($0; $image)

$dom:=$1

$canvas:=DOM Find XML element by ID:C1010($dom; "canvas")

C_REAL:C285($tx; $ty; $sx; $sy; $r; $cx; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:cx"; $cx)
DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:cy"; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:r"; $r)

$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$sx:=$Zoom->
$sy:=$Zoom->

//use sx,sy instead of TRANSFORM PICTURE, for better sampling
$translate:="translate("+Str($tx)+","+Str($ty)+")"
$scale:="scale("+Str($sx)+","+Str($sy)+")"
$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
$transform:=$translate+" "+$scale+" "+$rotate

DOM SET XML ATTRIBUTE:C866($canvas; "editor:sx"; $sx; "editor:sy"; $sy; "transform"; $transform)

C_REAL:C285($width; $height)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:width"; $width)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $height)

DOM SET XML ATTRIBUTE:C866($dom; "width"; $width*$sx; "height"; $height*$sy)
SVG EXPORT TO PICTURE:C1017($dom; $image; Get XML data source:K45:16)

//CONVERT PICTURE($image;".png")

If (NEditor_Get_debug_mode)
	$Debug_Bg:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_Bg")
	$Debug_Bg->:=$Debug_Bg->+1
	$Debug_BgWidth:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgWidth")
	$Debug_BgHeight:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgHeight")
	PICTURE PROPERTIES:C457($image; $Debug_BgWidth->; $Debug_BgHeight->)
End if 

$0:=$image