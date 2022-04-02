//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)

$id:=$1

If (Match regex:C1019("select-.{2}-object-[\\d]+"; $id))
	
	NEditor_SET_HANDLE($id)
	
Else 
	
	NEditor_SET_HANDLE("")
	
End if 