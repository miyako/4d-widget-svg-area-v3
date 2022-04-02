//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($0; $selectionChanged)

$dom:=$1
$selectionChanged:=1

ARRAY TEXT:C222($selectObjects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "selects"); "editor:selects/editor:select"; $selectObjects)

ARRAY TEXT:C222($previousSelectObjects; 0)
$Selects:=OBJECT Get pointer:C1124(Object named:K67:5; "Selects")
//%W-518.1
COPY ARRAY:C226($Selects->; $previousSelectObjects)
//%W+518.1
$selectedCount:=Size of array:C274($selectObjects)

If (Size of array:C274($previousSelectObjects)=$selectedCount)
	
	C_LONGINT:C283($i; $find)
	C_TEXT:C284($selectObjectId)
	
	For ($i; 1; $selectedCount)
		DOM GET XML ATTRIBUTE BY NAME:C728($selectObjects{$i}; "editor:object-id"; $selectObjectId)
		$find:=Find in array:C230($previousSelectObjects; $selectObjectId)
		If ($find#-1)
			DELETE FROM ARRAY:C228($previousSelectObjects; $find)
		End if 
	End for 
	If (0=Size of array:C274($previousSelectObjects))
		$selectionChanged:=0
	End if 
End if 

$0:=$selectionChanged