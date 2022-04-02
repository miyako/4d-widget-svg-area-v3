//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_TEXT:C284($0)

$0:="000000"+Replace string:C233(String:C10($1; "&x"); "0x"; ""; *)
$0:="#"+Substring:C12($0; Length:C16($0)-5; 6)