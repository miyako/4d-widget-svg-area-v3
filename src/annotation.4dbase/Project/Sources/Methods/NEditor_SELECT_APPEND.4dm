//%attributes = {"invisible":true}
C_TEXT:C284($1; $2; $3)

$dom:=$1
$objectId:=$2
$objectType:=$3

$selects:=DOM Find XML element by ID:C1010($dom; "selects")
$select:=DOM Create XML element:C865($selects; "editor:select"; \
"editor:object-id"; $objectId; \
"editor:object-type"; $objectType)
