//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($2)
C_TEXT:C284($0)

$dom:=$1
$position:=$2

$selects:=DOM Find XML element by ID:C1010($dom; "selects")
C_TEXT:C284($value; $objectId)
$object:=DOM Get XML element:C725($selects; "editor:select"; $position; $value)
DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-id"; $objectId)

$0:=$objectId
