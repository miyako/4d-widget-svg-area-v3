//%attributes = {"invisible":true}
C_LONGINT:C283($0; $status)

$status:=-1


Case of 
	: (0<Pasteboard data size:C400("com.4d.svg-editor.objects"))
		$status:=0
		
	: (0<Pasteboard data size:C400("public.utf8-plain-text"))
		$status:=0
		
	: (0<Pasteboard data size:C400("public.utf16-plain-text"))
		$status:=0
		
	: (0<Pasteboard data size:C400("public.utf16-external-plain-text"))
		$status:=0
		
	: (0<Pasteboard data size:C400(Picture data:K20:3))
		$status:=0
		
	Else 
		
End case 

If ($status=-1)
	If (0<Pasteboard data size:C400("com.4d.image.png"))
		$status:=0
	End if 
End if 

CALL SUBFORM CONTAINER:C1086(-112)

$0:=$status