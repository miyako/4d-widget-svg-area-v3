If (Form event code:C388=On Clicked:K2:4)
	
	$path:=Get 4D folder:C485(Database folder:K5:14)+"test.jpg"
	READ PICTURE FILE:C678($path; $picture)
	
	NEditor_SET_IMAGE("Editor"; $picture)
	
End if 