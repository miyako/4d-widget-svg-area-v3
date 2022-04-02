//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($0)

$0:=$1

$fontFamilyName:=Get localized string:C991("#"+$1)

If (Length:C16($fontFamilyName)#0)
	
	$0:=$fontFamilyName
	
End if 