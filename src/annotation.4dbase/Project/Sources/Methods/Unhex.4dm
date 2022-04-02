//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($0)

If (Length:C16($1)=7)
	
	$hex:=Substring:C12($1; 2; 6)
	$code:="<!--4dtext 0x"+$hex+"-->"
	PROCESS 4D TAGS:C816($code; $code)
	$0:=Num:C11($code)
	
End if 
