If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$count:=NEditor_SELECT_Get_count($Container->)
	
	$menu:=NEditor_MENU_SET_ALIGN
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
			
		: ($command="align-vertical")
			
			NEditor_SELECT_ALIGN_VERTICAL($Container)
			
		: ($command="align-horizontal")
			
			NEditor_SELECT_ALIGN_HORIZONTAL($Container)
			
		: ($command="align-left")
			
			NEditor_SELECT_ALIGN_LEFT($Container)
			
		: ($command="align-right")
			
			NEditor_SELECT_ALIGN_RIGHT($Container)
			
		: ($command="align-top")
			
			NEditor_SELECT_ALIGN_TOP($Container)
			
		: ($command="align-bottom")
			
			NEditor_SELECT_ALIGN_BOTTOM($Container)
			
		: ($command="distribute-horizontal")
			
			NEditor_SELECT_DIST_HORIZONTAL($Container)
			
		: ($command="distribute-vertical")
			
			NEditor_SELECT_DIST_VERTICAL($Container)
			
	End case 
	
End if 