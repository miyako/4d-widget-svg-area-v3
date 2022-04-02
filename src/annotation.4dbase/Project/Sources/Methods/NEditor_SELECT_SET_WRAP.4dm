//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_TEXT:C284($2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)
$count:=Size of array:C274($selects)

C_TEXT:C284($objectId)
C_TEXT:C284($wordWrap)
C_REAL:C285($lineHeight; $sy)

C_LONGINT:C283($i)

If (0#$count)
	
	NEditor_HISTORY_APPEND_SELECT
	
	For ($i; 1; $count)
		
		DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
		$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
		
		C_TEXT:C284($type)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $type)
		
		C_BOOLEAN:C305($isText)
		
		Case of 
			: ($type="text")
				$isText:=True:C214
			: ($type="variable")
				C_LONGINT:C283($fieldType)
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:field-type"; $fieldType)
				$isText:=($fieldType#Is picture:K8:10)
			Else 
				$isText:=False:C215
		End case 
		
		If ($isText)
			
			$dom:=DOM Find XML element by ID:C1010($Container->; $objectId+"-textArea")
			
			$wordWrap:=""
			DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:word-wrap"; $wordWrap)
			
			Case of 
				: ($wordWrap="true") & ($2="disabled")
					
					DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:line-height"; $lineHeight)
					DOM SET XML ATTRIBUTE:C866($dom; "height"; $lineHeight)
					DOM SET XML ATTRIBUTE:C866($object; "editor:word-wrap"; False:C215)
					
					$shouldRedraw:=True:C214
					
				: ($wordWrap="false") & ($2="enabled")
					
					DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $lineHeight)
					DOM SET XML ATTRIBUTE:C866($dom; "height"; $lineHeight)
					DOM SET XML ATTRIBUTE:C866($object; "editor:word-wrap"; True:C214)
					
					$shouldRedraw:=True:C214
					
			End case 
			
		End if 
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 