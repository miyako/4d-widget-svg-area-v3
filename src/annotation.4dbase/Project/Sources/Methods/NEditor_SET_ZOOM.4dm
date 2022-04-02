//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_REAL:C285($2)

$params:=Count parameters:C259

If ($params>1)
	
	If (Length:C16($1)#0)
		
		If ($2#NEditor_Get_zoom($1))
			
			EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; *; ""; $2)
			
		End if 
		
	Else 
		
		$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
		
		$Zoom->:=$2
		
		C_LONGINT:C283($left; $top; $right; $bottom)
		OBJECT GET COORDINATES:C663(*; "Image"; $left; $top; $right; $bottom)
		C_REAL:C285($objectWidth; $objectHeight)
		$objectWidth:=$right-$left
		$objectHeight:=$bottom-$top
		
		C_REAL:C285($scrH; $scrV; $scrX; $scrY)
		$ScrollH:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollH")
		$ScrollV:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollV")
		$ScrollX:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollX")
		$ScrollY:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollY")
		
		C_REAL:C285($centerH; $centerV)
		$ScrollCenterX:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollCenterX")
		$ScrollCenterY:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollCenterY")
		$centerH:=$ScrollCenterX->
		$centerV:=$ScrollCenterY->
		
		C_REAL:C285($imageWidth; $imageHeight)
		$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
		
		NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
		
		//compute the new image size
		$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		C_REAL:C285($imageWidth; $imageHeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($Container->; "width"; $imageWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($Container->; "height"; $imageHeight)
		$imageWidth:=$imageWidth*$Zoom->
		$imageHeight:=$imageHeight*$Zoom->
		
		//$DomBgImage:=OBJECT Get pointer(Object named;"DomBgImage")
		//$BgImage:=OBJECT Get pointer(Object named;"BgImage")
		
		//$Image->:=NEditor_Get_layer_image ($Container->)
		//$BgImage->:=NEditor_Get_background_image ($DomBgImage->)
		
		//C_REAL($imageWidth;$imageHeight)
		//PICTURE PROPERTIES($Image->;$imageWidth;$imageHeight)
		
		$cx:=$imageWidth*$centerH
		$cy:=$imageHeight*$centerV
		
		C_REAL:C285($objectWidthScrollbarVisible; $objectHeightScrollbarVisible)
		$ScrollbarSize:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarSize")
		$objectWidthScrollbarVisible:=$objectWidth-$ScrollbarSize->
		$objectHeightScrollbarVisible:=$objectHeight-$ScrollbarSize->
		
		Case of 
			: (True:C214)
				
				C_REAL:C285($show_rx; $show_ry; $show_tx; $show_ty)
				$show_rx:=$objectWidthScrollbarVisible/2/$Zoom->
				$show_tx:=$cx/$Zoom->
				$show_ry:=$objectHeightScrollbarVisible/2/$Zoom->
				$show_ty:=$cy/$Zoom->
				
				If (NEditor_Get_debug_mode)
					
					If ($imageWidth<=$objectWidth)
						SVG GET ATTRIBUTE:C1056($Image->; "show"; "editor:tx"; $show_tx)
					End if 
					
					If ($imageHeight<=$objectHeight)
						SVG GET ATTRIBUTE:C1056($Image->; "show"; "editor:ty"; $show_ty)
					End if 
					
					$show_translate:="translate("+Str($show_tx)+","+Str($show_ty)+")"
					$transform:=$show_translate
					
					If (False:C215)
						SVG SET ATTRIBUTE:C1055($Image->; "show"; \
							"rx"; $show_rx; "ry"; $show_ry; \
							"visibility"; "visible"; "transform"; $transform)
					Else 
						$show_width:=$show_rx*2
						$show_height:=$show_ry*2
						$show_x:=-$show_rx
						$show_y:=-$show_ry
						SVG SET ATTRIBUTE:C1055($Image->; "show"; \
							"width"; $show_width; "height"; $show_height; \
							"x"; $show_x; "y"; $show_y; \
							"visibility"; "visible"; "transform"; $transform)
					End if 
					
					$show:=DOM Find XML element by ID:C1010($Container->; "show")
					
					If (False:C215)
						DOM SET XML ATTRIBUTE:C866($show; "rx"; $show_rx; "ry"; $show_ry; "transform"; $transform)
					Else 
						DOM SET XML ATTRIBUTE:C866($show; \
							"width"; $show_width; "height"; $show_height; \
							"x"; $show_x; "y"; $show_y; "transform"; $transform)
					End if 
					
				End if 
				
				$scrH:=($show_tx-$show_rx)*$Zoom->
				$scrV:=($show_ty-$show_ry)*$Zoom->
				
			: (False:C215)  //center it
				
				$scrH:=($imageWidth-$objectWidth)/2
				$scrV:=($imageHeight-$objectHeight)/2
				
		End case 
		
		//can't do this before the object is re-rendered
		//NEditor_DISPLAY_SCROLLBAR (True)
		//OBJECT SET SCROLL POSITION(*;"Image";$scrV;$scrH;*)
		//OBJECT SET SCROLL POSITION(*;"BgImage";$scrV;$scrH;*)
		
		$ScrollH->:=$scrH
		$ScrollV->:=$scrV
		
		$IsZooming:=OBJECT Get pointer:C1124(Object named:K67:5; "IsZooming")
		$IsZooming->:=1
		
		SET TIMER:C645(NEditor_Get_timer_for_event)
		
	End if 
	
End if 