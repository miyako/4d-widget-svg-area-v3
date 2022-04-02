If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$count:=NEditor_SELECT_Get_count($Container->)
	
	$menu:=Create menu:C408
	
	$isImage:=False:C215
	$isText:=False:C215
	$includesText:=False:C215
	$includesImage:=False:C215
	$includesLine:=False:C215
	$isImageOnly:=False:C215
	
	$stroke:=NEditor_SELECT_Get_stroke($Container; ->$isImageOnly)
	$currentStrokeOpacity:=NEditor_SELECT_Get_opacity($Container; ->$isImageOnly)
	$currentStrokeWidth:=NEditor_SELECT_Get_stroke_width($Container; ->$isImageOnly)
	
	NEditor_MENU_SET_OPACITY($menu; $currentStrokeOpacity; False:C215)
	NEditor_MENU_SET_STROKE_WIDTH($menu; $currentStrokeWidth; False:C215)
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_COLOR($menu; False:C215; False:C215; True:C214)
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="stroke-color")
			
			$color:=Color_Display_picker($stroke; $x; $y)
			
			If ($color#$stroke)
				NEditor_SET_DEFAULT_STROKE($color)
				NEditor_SELECT_SET_STROKE($Container; $color)
			End if 
			
		: ($command="stroke-width-@")
			
			$width:=Num:C11(Replace string:C233($command; "stroke-width-"; ""; *))
			
			NEditor_SET_DEFAULT_WIDTH($width)
			NEditor_SELECT_SET_STROKE_WIDTH($Container; $width)
			
		: ($command="stroke-opacity-@")
			
			$strokeOpacity:=Num:C11(Replace string:C233($command; "stroke-opacity-"; ""; *))
			
			If ($currentStrokeOpacity#$strokeOpacity)
				
				NEditor_SET_DEFAULT_OPACITY($strokeOpacity)
				
				If (Not:C34(Is nil pointer:C315($Container)))
					NEditor_SELECT_SET_OPACITY($Container; $strokeOpacity)
				End if 
				
			End if 
			
	End case 
	
End if 