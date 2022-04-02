//%attributes = {"invisible":true}
C_TEXT:C284($1; $dom)

$dom:=$1

$domParent:=DOM Get parent XML element:C923($dom)

DOM_ELEMENT_CLEAR_ID($dom)

$newDom:=DOM Append XML element:C1082($domParent; $dom)

DOM REMOVE XML ELEMENT:C869($dom)

DOM_ELEMENT_RESTORE_ID($newDom)