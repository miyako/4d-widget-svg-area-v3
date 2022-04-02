//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)
C_TEXT:C284($0)

$Container:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

C_TEXT:C284($preserveAspectRatio)
C_BOOLEAN:C305($includesImage)

$isTrue:=True:C214

For ($i; 1; Size of array:C274($selects))
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
	
	C_TEXT:C284($type; $class)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $type)
	
	C_BOOLEAN:C305($isImage)
	
	Case of 
		: ($type="image")
			$isImage:=True:C214
		: ($type="variable")
			C_LONGINT:C283($fieldType)
			DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:field-type"; $fieldType)
			$isImage:=($fieldType=Is picture:K8:10)
		Else 
			$isImage:=False:C215
	End case 
	
	If ($isImage)
		
		$includesImage:=True:C214
		
		$object:=DOM Find XML element by ID:C1010($Container->; $objectId+"-data")
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "preserveAspectRatio"; $preserveAspectRatio)
		$isTrue:=$isTrue & ($preserveAspectRatio="xMidYMid")
		
	End if 
	
End for 

$2->:=$includesImage

If ($isTrue)
	$preserveAspectRatio:="true"
End if 

$0:=$preserveAspectRatio