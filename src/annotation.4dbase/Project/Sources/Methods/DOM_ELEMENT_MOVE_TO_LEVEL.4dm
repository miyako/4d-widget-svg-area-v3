//%attributes = {"invisible":true}
C_TEXT:C284($1; $dom)
C_LONGINT:C283($2; $level)

$dom:=$1
$level:=$2

$domParent:=DOM Get parent XML element:C923($dom)

DOM_ELEMENT_CLEAR_ID($dom)

$newDom:=DOM Insert XML element:C1083($domParent; $dom; $level)

DOM REMOVE XML ELEMENT:C869($dom)

DOM_ELEMENT_RESTORE_ID($newDom)