If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$isImageOnly:=False:C215
	$currentFillOpacity:=NEditor_SELECT_Get_fill_opacity($Container; ->$isImageOnly)
	
	$menu:=NEditor_MENU_SET_FILL_OPACITY(""; $currentFillOpacity; $isImageOnly)
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="fill-opacity-@")
			
			$fillOpacity:=Num:C11(Replace string:C233($command; "fill-opacity-"; ""; *))
			
			If ($currentFillOpacity#$fillOpacity)
				
				NEditor_SET_DEFAULT_F_OPACITY($fillOpacity)
				
				If (Not:C34(Is nil pointer:C315($Container)))
					NEditor_SELECT_SET_FILL_OPACITY($Container; $fillOpacity)
				End if 
				
			End if 
			
	End case 
	
End if 