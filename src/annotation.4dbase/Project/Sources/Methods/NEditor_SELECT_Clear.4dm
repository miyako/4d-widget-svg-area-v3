//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($0; $shouldRedraw)

$dom:=$1

C_LONGINT:C283($count)
ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "selects"); "editor:selects/editor:select"; $selects)
$count:=Size of array:C274($selects)

If (0#$count)
	
	C_TEXT:C284($objectId)
	
	C_LONGINT:C283($i)
	For ($i; 1; $count)
		DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
		$selectId:="select-"+$objectId
		
		$selectObject:=DOM Find XML element by ID:C1010($dom; $selectId)
		
		If (Match regex:C1019("(?:[:HexDigit:]{16}(?<!0000000000000000)){1,2}"; $selectObject))
			DOM REMOVE XML ELEMENT:C869($selectObject)
		Else 
			//some objects were selected when the document was saved
		End if 
		
		DOM REMOVE XML ELEMENT:C869($selects{$i})
		
	End for 
	
	//new, change
	NEditor_GROW_CLEAR
	
	$shouldRedraw:=True:C214
	
End if 

$0:=$shouldRedraw