If (Form event code:C388=On Clicked:K2:4)
	
	$path:=System folder:C487(Desktop:K41:16)+"test.svg"
	$formats:=".svg;.png;.jpg;.gif;.bmp;.tif;"+Choose:C955(Folder separator:K24:12=":"; ".pdf;.exr;"; ".emf;.xps;")
	$fileName:=Select document:C905($path; $formats; ""; Package open:K24:8 | File name entry:K24:17)
	
	If (OK=1)
		$image:=NEditor_Get_image("Editor"; 0)
		WRITE PICTURE FILE:C680(DOCUMENT; $image)
		OPEN URL:C673(DOCUMENT)
	End if 
	
End if 