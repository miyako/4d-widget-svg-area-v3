//%attributes = {"invisible":true}
C_LONGINT:C283($1; $2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$moveX:=$1
$moveY:=$2

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)
$count:=Size of array:C274($selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

If (0#$count)
	
	NEditor_HISTORY_APPEND_SELECT
	
	For ($i; 1; $count)
		
		DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
		$shouldRedraw:=$shouldRedraw | NEditor_SELECT_Move($objectId; $moveX; $moveY; True:C214; False:C215)
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 