//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)
C_TEXT:C284($0)

$Container:=$1
$DomCanvas:=$2

C_BOOLEAN:C305($isBefore; $isCenter; $isAfter)

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

C_TEXT:C284($displayAlign)
C_BOOLEAN:C305($includesText)

$isBefore:=True:C214
$isCenter:=True:C214
$isAfter:=True:C214

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
		
		$class:="class-"+$objectId+"-textArea"
		$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
		
		If (OK=1)  //is an object with style
			
			C_TEXT:C284($data; $style)
			DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
			
			ARRAY LONGINT:C221($pos; 0)
			ARRAY LONGINT:C221($len; 0)
			
			If (Match regex:C1019("(?:display-align:)([^;]+)"; $style; 1; $pos; $len))
				
				$displayAlign:=Substring:C12($style; $pos{1}; $len{1})
				
				$isBefore:=$isBefore & ($displayAlign="before")
				$isCenter:=$isCenter & ($displayAlign="center")
				$isAfter:=$isAfter & ($displayAlign="after")
				
			End if 
			
		End if 
		
	End if 
	
End for 

$2->:=$includesText

If ($isBefore)
	$displayAlign:="before"
End if 

If ($isCenter)
	$displayAlign:="center"
End if 

If ($isAfter)
	$displayAlign:="after"
End if 

$0:=$displayAlign
