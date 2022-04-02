//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_POINTER:C301($2)

ARRAY TEXT:C222($objectIds; 0)

$dom:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)
For ($i; 1; Size of array:C274($selects))
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	APPEND TO ARRAY:C911($objectIds; $objectId)
End for 

//%W-518.1
COPY ARRAY:C226($objectIds; $2->)
//%W+518.1