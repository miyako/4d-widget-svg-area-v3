//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)
C_TEXT:C284($0)

$Container:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

C_TEXT:C284($wordWrap)
C_BOOLEAN:C305($includesText)
C_BOOLEAN:C305($isUndefined)

$isUndefined:=True:C214

For ($i; 1; Size of array:C274($selects))
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
	
	C_TEXT:C284($type; $class)
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
		
		$includesText:=True:C214
		
		$thisWordWrap:=""
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:word-wrap"; $thisWordWrap)
		
		If ($isUndefined)
			$wordWrap:=$thisWordWrap
			$isUndefined:=False:C215
		Else 
			If ($thisWordWrap#$wordWrap)
				$wordWrap:=""
			End if 
		End if 
		
	End if 
	
End for 

$2->:=$includesText

$0:=$wordWrap
