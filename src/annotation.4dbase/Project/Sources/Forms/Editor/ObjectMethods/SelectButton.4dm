If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$menu:=NEditor_MENU_SET_TOOL
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="@-tool")
			
			NEditor_SET_TOOL(Replace string:C233($command; "-tool"; ""; *))
			
	End case 
	
End if 