If (Form event code:C388=On Clicked:K2:4)
	
	$path:=System folder:C487(Desktop:K41:16)+"test.svg"
	$formats:=".svg;.png;.jpg;.gif;.bmp;.tif;"+Choose:C955(Folder separator:K24:12=":"; ".pdf;.exr;"; ".emf;.xps;")
	$fileName:=Select document:C905($path; $formats; ""; Package open:K24:8)
	
	If (OK=1)
		C_PICTURE:C286($image)
		READ PICTURE FILE:C678(DOCUMENT; $image)
		NEditor_SET_IMAGE("Editor"; $image)
	End if 
	
End if 