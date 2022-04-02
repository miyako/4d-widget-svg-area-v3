//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_TEXT:C284($2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1
$preserveAspectRatio:=$2

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)
$count:=Size of array:C274($selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

If (0#$count)
	
	NEditor_HISTORY_APPEND_SELECT
	
	For ($i; 1; $count)
		
		DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
		$object:=DOM Find XML element by ID:C1010($Container->; $objectId+"-data")
		
		C_TEXT:C284($type)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $type)
		
		C_TEXT:C284($oldValue)
		
		Case of 
			: ($type="image")
				
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "preserveAspectRatio"; $oldValue)
				
				If ($preserveAspectRatio#$oldValue)
					If ($preserveAspectRatio="true")
						DOM SET XML ATTRIBUTE:C866($object; "preserveAspectRatio"; "xMidYMid")
					Else 
						DOM SET XML ATTRIBUTE:C866($object; "preserveAspectRatio"; "none")
					End if 
					
					$shouldRedraw:=True:C214
				End if 
				
			: ($type="variable")
				
				C_LONGINT:C283($fieldType)
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:field-type"; $fieldType)
				
				If ($fieldType=Is picture:K8:10)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($object; "preserve-aspect-ratio"; $oldValue)
					
					If ($preserveAspectRatio#$oldValue)
						DOM SET XML ATTRIBUTE:C866($object; "preserve-aspect-ratio"; $preserveAspectRatio)
						$shouldRedraw:=True:C214
					End if 
					
				End if 
				
		End case 
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 
