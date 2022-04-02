//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1

$selects:=DOM Find XML element by ID:C1010($Container->; "selects")
$objects:=DOM Find XML element by ID:C1010($Container->; "objects")

ARRAY TEXT:C222($selectDoms; 0)
$select:=DOM Find XML element:C864($selects; "editor:selects/editor:select"; $selectDoms)

ARRAY TEXT:C222($objectDoms; 0)
$object:=DOM Find XML element:C864($objects; "editor:objects/editor:object"; $objectDoms)

C_TEXT:C284($selectObjectId; $objectId; $selectId)

C_LONGINT:C283($i; $level)

$objectCount:=DOM Count XML elements:C726($objects; "object")

NEditor_HISTORY_APPEND_SELECT

For ($i; 1; Size of array:C274($selectDoms))
	
	$selectDom:=$selectDoms{$i}
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selectDom; "editor:object-id"; $selectObjectId)
	
	$objectCount:=Size of array:C274($objectDoms)
	
	For ($j; 1; $objectCount)
		
		$objectDom:=$objectDoms{$j}
		
		DOM GET XML ATTRIBUTE BY NAME:C728($objectDom; "editor:object-id"; $objectId)
		$level:=NEditor_Get_level($objectId)
		If ($level#$objectCount)
			
			If ($selectObjectId=$objectId)
				DOM_ELEMENT_MOVE_TO_LAST($selectDom)
				DOM_ELEMENT_MOVE_TO_LAST($objectDom)
				DOM_ELEMENT_MOVE_TO_LAST(DOM Find XML element by ID:C1010($Container->; $objectId))
				$j:=$objectCount
				$shouldRedraw:=True:C214
			End if 
			
		End if 
		
	End for 
	
End for 

If ($shouldRedraw)
	
	NEditor_SELECT_UPDATE_ID($Container)
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	
	NEditor_HISTORY_APPEND
	
End if 