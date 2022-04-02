If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$isImageOnly:=False:C215
	$fill:=NEditor_SELECT_Get_fill($Container; ->$isImageOnly)
	
	$color:=Color_Display_picker($fill; $x+NEditor_Get_popup_offset_x; $y+NEditor_Get_popup_offset_y)
	
	If ($color#$fill)
		
		NEditor_SET_DEFAULT_FILL($color)
		
		If (Not:C34(Is nil pointer:C315($Container)))
			NEditor_SELECT_SET_FILL($Container; $color)
		End if 
		
	End if 
	
End if 