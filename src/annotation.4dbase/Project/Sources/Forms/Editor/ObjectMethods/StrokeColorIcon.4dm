If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$isImageOnly:=False:C215
	$stroke:=NEditor_SELECT_Get_stroke($Container; ->$isImageOnly)
	
	$color:=Color_Display_picker($stroke; $x+NEditor_Get_popup_offset_x; $y+NEditor_Get_popup_offset_y)
	
	If ($color#$stroke)
		
		NEditor_SET_DEFAULT_STROKE($color)
		
		$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		
		If (Not:C34(Is nil pointer:C315($Container)))
			NEditor_SELECT_SET_STROKE($Container; $color)
		End if 
		
	End if 
	
End if 