//%attributes = {"invisible":true}
C_BOOLEAN:C305($1; $isInternal)

If (Count parameters:C259#0)
	$isInternal:=$1
End if 

$IsScrollbarVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrollbarVisible")

If (1=$IsScrollbarVisible->)
	
	C_BOOLEAN:C305($horizontal_before; $vertical_before)
	OBJECT GET SCROLLBAR:C1076(*; "Image"; $horizontal_before; $vertical_before)
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	
	PICTURE PROPERTIES:C457($Image->; $imageWidth; $imageHeight)
	
	C_LONGINT:C283($left; $top; $right; $bottom)
	OBJECT GET COORDINATES:C663(*; "Image"; $left; $top; $right; $bottom)
	C_REAL:C285($objectWidth; $objectHeight)
	$objectWidth:=$right-$left
	$objectHeight:=$bottom-$top
	
	$ScrollbarSize:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarSize")
	
	$objectWidthScrollbarVisible:=$objectWidth-$ScrollbarSize->
	$objectHeightScrollbarVisible:=$objectHeight-$ScrollbarSize->
	
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
	
	If ($horizontal_before#$horizontal) | ($vertical#$vertical_before)
		OBJECT SET SCROLLBAR:C843(*; "Image"; $horizontal; $vertical)
		OBJECT SET SCROLLBAR:C843(*; "BgImage"; $horizontal; $vertical)
	End if 
	
Else 
	OBJECT SET SCROLLBAR:C843(*; "Image"; False:C215; False:C215)
	OBJECT SET SCROLLBAR:C843(*; "BgImage"; False:C215; False:C215)
End if 

If (Not:C34($isInternal))
	NEditor_ON_RESIZE
End if 