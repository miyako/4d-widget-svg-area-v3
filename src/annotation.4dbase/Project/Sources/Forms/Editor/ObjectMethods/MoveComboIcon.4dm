If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$count:=NEditor_SELECT_Get_count($Container->)
	
	$menu:=NEditor_MENU_SET_MOVE
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="move-frontmost")
			
			NEditor_SELECT_MOVE_FRONT_MOST($Container)
			
		: ($command="move-backmost")
			
			NEditor_SELECT_MOVE_BACK_MOST($Container)
			
		: ($command="move-front")
			
			NEditor_SELECT_MOVE_FRONT($Container)
			
		: ($command="move-back")
			
			NEditor_SELECT_MOVE_BACK($Container)
			
	End case 
	
End if 