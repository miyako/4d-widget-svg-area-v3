//%attributes = {"invisible":true}
C_POINTER:C301($1; $2; $3; $4; $5)

$IsTracking:=$1
$IsResizing:=$2
$IsScrolling:=$3
$IsZooming:=$4
$IsRotating:=$5

If (1=$IsScrolling->)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$IsScrolling->:=0
	
	C_LONGINT:C283($imVisible; $bgVisible)
	
	C_BOOLEAN:C305($shouldRedraw)
	
	$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
	$use:=DOM Find XML element by ID:C1010($Container->; "use")
	
	C_TEXT:C284($visible)
	DOM GET XML ATTRIBUTE BY NAME:C728($use; "visibility"; $visible)
	
	If (0=$IsTracking->)
		OBJECT SET VISIBLE:C603(*; "BgImage"; False:C215)
		$imVisible:=1
		$bgVisible:=0
		If ($visible#"visible")
			DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")
			$shouldRedraw:=True:C214
		End if 
	Else 
		//scroll can happen while tracking; in that case, keep bg visible
		OBJECT SET VISIBLE:C603(*; "BgImage"; True:C214)
		$imVisible:=0
		$bgVisible:=1
		If ($visible#"hidden")
			DOM SET XML ATTRIBUTE:C866($use; "visibility"; "hidden")
			$shouldRedraw:=True:C214
		End if 
	End if 
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	
	If ($shouldRedraw)
		//basically doesn't happen
		$Image->:=NEditor_Get_layer_image($Container->)
	End if 
	
	If (NEditor_Get_debug_mode)
		$Debug_BgVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgVisible")
		$Debug_ImVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ImVisible")
		$Debug_BgVisible->:=$bgVisible
		$Debug_ImVisible->:=$imVisible
	End if 
	
	//If (NEditor_Get_debug_mode )
	//
	//C_LONGINT($left;$top;$right;$bottom)
	//OBJECT GET COORDINATES(*;"Image";$left;$top;$right;$bottom)
	//
	//C_REAL($objectWidth;$objectHeight)
	//$objectWidth:=$right-$left
	//$objectHeight:=$bottom-$top
	//
	//$Zoom:=OBJECT Get pointer(Object named;"Zoom")
	//$ScrollbarSize:=OBJECT Get pointer(Object named;"ScrollbarSize")
	//$objectWidthScrollbarVisible:=$objectWidth-$ScrollbarSize->
	//$objectHeightScrollbarVisible:=$objectHeight-$ScrollbarSize->
	//
	//$ScrollCenterX:=OBJECT Get pointer(Object named;"ScrollCenterX")
	//$ScrollCenterY:=OBJECT Get pointer(Object named;"ScrollCenterY")
	//$centerH:=$ScrollCenterX->
	//$centerV:=$ScrollCenterY->
	//
	//C_REAL($imageWidth;$imageHeight)
	//PICTURE PROPERTIES($Image->;$imageWidth;$imageHeight)
	//
	//$cx:=$imageWidth*$centerH
	//$cy:=$imageHeight*$centerV
	//
	//C_REAL($show_rx;$show_ry;$show_tx;$show_ty)
	//$show_rx:=$objectWidthScrollbarVisible/2/$Zoom->
	//$show_tx:=$cx/$Zoom->
	//$show_ry:=$objectHeightScrollbarVisible/2/$Zoom->
	//$show_ty:=$cy/$Zoom->
	//
	//C_REAL($show_rx;$show_ry;$show_tx;$show_ty)
	//If ($imageWidth<=$objectWidth)
	//SVG GET ATTRIBUTE($Image->;"show";"editor:tx";$show_tx)
	//End if 
	//
	//If ($imageHeight<=$objectHeight)
	//SVG GET ATTRIBUTE($Image->;"show";"editor:ty";$show_ty)
	//End if 
	//
	//$show_translate:="translate("+Str ($show_tx)+","+Str ($show_ty)+")"
	//$transform:=$show_translate
	//
	//SVG SET ATTRIBUTE($Image->;"show";"rx";$show_rx;"ry";$show_ry;"transform";$transform)
	//$show:=DOM Find XML element by ID($Container->;"show")
	//DOM SET XML ATTRIBUTE($show;"rx";$show_rx;"ry";$show_ry;"transform";$transform)
	//
	//End if 
	
	//sync here
	C_LONGINT:C283($scrH; $scrV)
	OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
	OBJECT SET SCROLL POSITION:C906(*; "BgImage"; $scrV; $scrH; *)
	
	If (0=$IsTracking->) & (0=$IsResizing->) & (0=$IsZooming->) & (0=$IsRotating->)
		
		SET TIMER:C645(0)
		
	End if 
	
End if 