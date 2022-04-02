If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$isImageOnly:=False:C215
	$currentStrokeOpacity:=NEditor_SELECT_Get_opacity($Container; ->$isImageOnly)
	
	$menu:=NEditor_MENU_SET_OPACITY(""; $currentStrokeOpacity; $isImageOnly)
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
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