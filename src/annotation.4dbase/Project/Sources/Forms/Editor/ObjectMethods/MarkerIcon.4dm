If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$currentMarker:=NEditor_SELECT_Get_marker($Container)
	
	$menu:=NEditor_MENU_SET_MARKER(""; $currentMarker)
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="marker-@")
			
			$marker:=Replace string:C233($command; "marker-"; ""; *)
			
			If ($currentMarker#$marker)
				
				NEditor_SET_DEFAULT_MARKER($marker)
				
				If (Not:C34(Is nil pointer:C315($Container)))
					NEditor_SELECT_SET_MARKER($Container; $marker)
				End if 
				
			End if 
			
	End case 
	
End if 