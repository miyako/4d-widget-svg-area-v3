//%attributes = {"invisible":true}
C_TEXT:C284($1)

$dom:=$1

$Selects:=OBJECT Get pointer:C1124(Object named:K67:5; "Selects")

//remember selected object at mouse down event
ARRAY TEXT:C222($selectObjectIds; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "selects"); "editor:selects/editor:select"; $selectObjectIds)

C_LONGINT:C283($i)
C_TEXT:C284($objectId)

CLEAR VARIABLE:C89($Selects->)
For ($i; 1; Size of array:C274($selectObjectIds))
	DOM GET XML ATTRIBUTE BY NAME:C728($selectObjectIds{$i}; "editor:object-id"; $objectId)
	APPEND TO ARRAY:C911($Selects->; $objectId)
End for 

$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
$SelectionChanged->:=0