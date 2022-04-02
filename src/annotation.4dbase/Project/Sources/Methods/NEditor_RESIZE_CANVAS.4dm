//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

C_LONGINT:C283($left; $top; $right; $bottom)
OBJECT GET COORDINATES:C663(*; "Image"; $left; $top; $right; $bottom)
C_REAL:C285($objectWidth; $objectHeight)
$objectWidth:=$right-$left
$objectHeight:=$bottom-$top

$IsScrollbarVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrollbarVisible")

If (1=$IsScrollbarVisible->)
	
	$ScrollbarSize:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarSize")
	$offsetH:=$ScrollbarSize->
	$offsetV:=$ScrollbarSize->
	
Else 
	
	$offsetH:=0
	$offsetV:=0
	
End if 

$objectWidthScrollbarVisible:=$objectWidth-$offsetH
$objectHeightScrollbarVisible:=$objectHeight-$offsetV

C_REAL:C285($imageWidth; $imageHeight)

//best w,h
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
$size:=DOM Find XML element by ID:C1010($Container->; "size")
C_REAL:C285($documentWidth; $documentHeight)
DOM GET XML ATTRIBUTE BY NAME:C728($size; "width"; $documentWidth)
DOM GET XML ATTRIBUTE BY NAME:C728($size; "height"; $documentHeight)

$minWidth:=$documentWidth+$offsetV
$minHeight:=$documentHeight+$offsetH
$maxWidth:=$objectWidth
$maxHeight:=$objectHeight

$imageHeight:=$minHeight
$imageWidth:=$minWidth

//padding to max
If ($imageHeight<$maxHeight)
	$imageHeight:=$maxHeight
End if 

//padding to max
If ($imageWidth<$maxWidth)
	$imageWidth:=$maxWidth
End if 

C_BOOLEAN:C305($horizontal; $vertical)

Case of 
	: ($objectHeight>=$imageHeight) & ($objectWidth>=$imageWidth)
		
		//no v, no h
		$vertical:=False:C215
		$horizontal:=False:C215
		
	: ($objectHeight<$imageHeight) & ($objectWidthScrollbarVisible>=$imageWidth)
		
		//v
		$vertical:=True:C214
		$horizontal:=False:C215
		
	: ($objectHeight<$imageHeight) & ($objectWidthScrollbarVisible<$imageWidth)
		
		//v, h forced
		$vertical:=True:C214
		$horizontal:=True:C214
		
	: ($objectWidth<$imageWidth) & ($objectHeightScrollbarVisible>=$imageHeight)
		
		//h
		$vertical:=False:C215
		$horizontal:=True:C214
		
	: ($objectWidth<$imageWidth) & ($objectHeightScrollbarVisible<$imageHeight)
		
		//h, v forced
		$vertical:=True:C214
		$horizontal:=True:C214
		
	Else 
		
		//v, h
		$vertical:=True:C214
		$horizontal:=True:C214
		
End case 

If ($vertical)
	$imageWidth:=$imageWidth-$offsetH
End if 

If ($horizontal)
	$imageHeight:=$imageHeight-$offsetV
End if 

//could happen as result of the above
If ($objectHeight>=$imageHeight) & ($objectWidth>=$imageWidth)
	$imageWidth:=$maxWidth
	$imageHeight:=$maxHeight
End if 

$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
DOM SET XML ATTRIBUTE:C866($DomBgImage->; "width"; $imageWidth; "height"; $imageHeight; "editor:width"; $imageWidth; "editor:height"; $imageHeight)\

DOM SET XML ATTRIBUTE:C866($Container->; "width"; $imageWidth; "height"; $imageHeight)