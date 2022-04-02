//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)
C_REAL:C285($0)

$Container:=$1

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

C_REAL:C285($fillOpacity)
C_BOOLEAN:C305($includesObject)
C_BOOLEAN:C305($isUndefined)
C_BOOLEAN:C305($isImageOnly)

$isUndefined:=True:C214
$isImageOnly:=True:C214

For ($i; 1; Size of array:C274($selects))
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
	
	C_TEXT:C284($type; $class)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $type)
	
	C_BOOLEAN:C305($isText; $isImage)
	
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
	
	If ($isText) | ($isImage)
		$class:="class-"+$objectId+"-rect"
	Else 
		$class:="class-"+$objectId
	End if 
	
	$includesObject:=True:C214
	
	//If (Not($isImage))
	
	$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
	
	If (OK=1)  //is an object with style
		
		C_TEXT:C284($data; $style)
		DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
		
		ARRAY LONGINT:C221($pos; 0)
		ARRAY LONGINT:C221($len; 0)
		
		If (Match regex:C1019("(?:fill-opacity:)([^;]+)"; $style; 1; $pos; $len))
			
			$thisFillOpacity:=Num:C11(Substring:C12($style; $pos{1}; $len{1}))
			
			If ($isUndefined)
				$fillOpacity:=$thisFillOpacity
				$isUndefined:=False:C215
			Else 
				If ($thisFillOpacity#$fillOpacity)
					$fillOpacity:=0
				End if 
			End if 
			
		End if 
		
	End if 
	
	//End if 
	
	$isImageOnly:=$isImageOnly & $isImage
	
End for 

//$isImageOnly:=$isImageOnly&$includesObject
$isImageOnly:=Not:C34($includesObject)

$2->:=$isImageOnly

If (Not:C34($includesObject))
	$fillOpacity:=NEditor_Get_default_f_opacity/100
End if 

$0:=$fillOpacity

