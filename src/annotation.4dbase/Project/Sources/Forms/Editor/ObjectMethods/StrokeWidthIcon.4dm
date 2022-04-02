If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$isImageOnly:=False:C215
	$currentStrokeWidth:=NEditor_SELECT_Get_stroke_width($Container; ->$isImageOnly)
	
	$menu:=NEditor_MENU_SET_STROKE_WIDTH(""; $currentStrokeWidth; $isImageOnly)
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="stroke-width-@")
			
			$strokeWidth:=Num:C11(Replace string:C233($command; "stroke-width-"; ""; *))
			
			If ($currentStrokeWidth#$strokeWidth)
				
				NEditor_SET_DEFAULT_WIDTH($strokeWidth)
				
				$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
				
				If (Not:C34(Is nil pointer:C315($Container)))
					NEditor_SELECT_SET_STROKE_WIDTH($Container; $strokeWidth)
				End if 
				
			End if 
			
	End case 
	
End if 