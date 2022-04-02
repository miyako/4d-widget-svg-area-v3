If (Form event code:C388=On Clicked:K2:4)
	
	$image:=NEditor_Get_image("Editor"; 1)
	
	$path:=System folder:C487(Desktop:K41:16)+"mode-1.png"
	WRITE PICTURE FILE:C680($path; $image)
	
	OPEN URL:C673($path)
	
End if 