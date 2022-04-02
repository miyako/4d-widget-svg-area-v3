//%attributes = {"invisible":true}
C_REAL:C285($1; $scrV; $2; $scrH)

$scrV:=$1
$scrH:=$2

$ScrollH:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollH")
$ScrollV:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollV")
$ScrollH->:=$scrH
$ScrollV->:=$scrV

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$size:=DOM Find XML element by ID:C1010($Container->; "size")
C_REAL:C285($documentWidth; $documentHeight)
DOM GET XML ATTRIBUTE BY NAME:C728($size; "width"; $documentWidth)
DOM GET XML ATTRIBUTE BY NAME:C728($size; "height"; $documentHeight)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
C_REAL:C285($imageWidth; $imageHeight)
PICTURE PROPERTIES:C457($Image->; $imageWidth; $imageHeight)
C_LONGINT:C283($left; $top; $right; $bottom)
OBJECT GET COORDINATES:C663(*; "Image"; $left; $top; $right; $bottom)
C_REAL:C285($objectWidth; $objectHeight)
$objectWidth:=$right-$left
$objectHeight:=$bottom-$top

$ScrollbarSize:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarSize")
$objectWidthScrollbarVisible:=$objectWidth-$ScrollbarSize->
$objectHeightScrollbarVisible:=$objectHeight-$ScrollbarSize->

C_REAL:C285($scrTx; $scrTy)

If ($objectWidthScrollbarVisible<$imageWidth)
	
	$hiddenH:=$imageWidth-$objectWidthScrollbarVisible-$scrH
	
Else   //no scroll bar
	
	$hiddenH:=$imageWidth-$objectWidth-$scrH
	
End if 

$centerH:=$scrH+(($imageWidth-$hiddenH-$scrH)/2)

If ($objectHeightScrollbarVisible<$imageHeight)
	
	$hiddenV:=$imageHeight-$objectHeightScrollbarVisible-$scrV
	
Else   //no scroll bar
	
	$hiddenV:=$imageHeight-$objectHeight-$scrV
	
End if 

$centerV:=$scrV+(($imageHeight-$hiddenV-$scrV)/2)

$ScrollCenterX:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollCenterX")
$ScrollCenterY:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollCenterY")
$ScrollCenterX->:=$centerH/$imageWidth
$ScrollCenterY->:=$centerV/$imageHeight

If (NEditor_Get_debug_mode)
	
	$Debug_ScrollX0:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollX0")
	$Debug_ScrollY0:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollY0")
	$Debug_ScrollX0->:=$scrH
	$Debug_ScrollY0->:=$scrV
	
	$Debug_ScrollX1:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollX1")
	$Debug_ScrollY1:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollY1")
	$Debug_ScrollX1->:=$centerH
	$Debug_ScrollY1->:=$centerV
	
	$Debug_ScrollX3:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollX3")
	$Debug_ScrollY3:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollY3")
	$Debug_ScrollX3->:=$centerH/$imageWidth
	$Debug_ScrollY3->:=$centerV/$imageHeight
	
	$Debug_ScrollX2:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollX2")
	$Debug_ScrollY2:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ScrollY2")
	$Debug_ScrollX2->:=$hiddenH
	$Debug_ScrollY2->:=$hiddenV
	
End if 