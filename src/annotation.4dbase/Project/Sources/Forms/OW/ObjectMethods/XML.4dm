If (Form event code:C388=On Clicked:K2:4)
	
	If (True:C214)
		$image:=NEditor_Get_image("Editor"; 0)
		$path:=System folder:C487(Desktop:K41:16)+"mode-0.svg"
		WRITE PICTURE FILE:C680($path; $image)
	Else 
		$path:=System folder:C487(Desktop:K41:16)+"mode-0.xml"
		$d:=OBJECT Get pointer:C1124(Object named:K67:5; "Editor")
		DOM EXPORT TO FILE:C862($d->; $path)
	End if 
	
	OPEN URL:C673($path)
	
End if 