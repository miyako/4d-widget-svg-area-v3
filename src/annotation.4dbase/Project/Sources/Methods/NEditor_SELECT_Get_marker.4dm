//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)
C_TEXT:C284($0)

$Container:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

C_BOOLEAN:C305($includesObject)

For ($i; 1; Size of array:C274($selects))
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
	
	C_TEXT:C284($type; $class)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $type)
	
	If ($type="line") | ($type="polyline")
		$includesObject:=True:C214
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "marker"; $marker)
	End if 
	
End for 

If (Not:C34($includesObject))
	$marker:=NEditor_Get_default_marker
End if 

$2->:=$includesObject

$0:=$marker
