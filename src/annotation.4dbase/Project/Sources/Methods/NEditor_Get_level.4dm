//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_LONGINT:C283($0)

$id:=$1

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

If (Match regex:C1019("object-([\\d]+)"; $id; 1; $pos; $len))
	
	$0:=Num:C11(Substring:C12($id; $pos{1}; $len{1}))
	
End if 