If (Form event code:C388=On Clicked:K2:4)
	
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	$Zoom->:=100
	NEditor_SET_ZOOM("Editor"; 1)
	
End if 