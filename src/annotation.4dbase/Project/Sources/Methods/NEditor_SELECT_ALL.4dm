//%attributes = {"invisible":true}
C_BOOLEAN:C305($1; $clearObjects)
C_BOOLEAN:C305($shouldRedraw)

$params:=Count parameters:C259

If ($params#0)
	$clearObjects:=$1
End if 

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

ARRAY TEXT:C222($oldSelection; 0)
NEditor_SELECT_GET_LIST($Container->; ->$oldSelection)

C_LONGINT:C283($oldCount; $newCount)
$oldCount:=Size of array:C274($oldSelection)

NEditor_SELECT_Clear($Container->)

ARRAY TEXT:C222($objectsInRect; 0)
$object:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "objects"); "editor:objects/editor:object"; $objectsInRect)

If (Size of array:C274($objectsInRect)#0)
	C_LONGINT:C283($i; $f)
	C_TEXT:C284($objectId)
	For ($i; 1; Size of array:C274($objectsInRect))
		DOM GET XML ATTRIBUTE BY NAME:C728($objectsInRect{$i}; "editor:object-id"; $objectId)
		$f:=Find in array:C230($oldSelection; $objectId)
		If ($f#-1)
			DELETE FROM ARRAY:C228($oldSelection; $f)
		Else 
			$shouldRedraw:=True:C214
		End if 
		$newCount:=$newCount+Num:C11(NEditor_SELECT_Add($objectId; True:C214))
	End for 
	$shouldRedraw:=$shouldRedraw | ($oldCount#$newCount)
End if 

$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")

If ($shouldRedraw) & (Not:C34($clearObjects))
	$SelectionChanged->:=1
	NEditor_SET_TOOL("select")
	NEditor_TOOL_UPDATE
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	CALL SUBFORM CONTAINER:C1086(-112)
Else 
	$SelectionChanged->:=0
End if 