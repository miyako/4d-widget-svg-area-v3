//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_BOOLEAN:C305($0; $isSelected)

$dom:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i; $count)

$count:=Size of array:C274($selects)

For ($i; 1; $count)
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	
	If ($objectId=$2)
		$isSelected:=True:C214
		$i:=$count
	End if 
	
End for 

$0:=$isSelected