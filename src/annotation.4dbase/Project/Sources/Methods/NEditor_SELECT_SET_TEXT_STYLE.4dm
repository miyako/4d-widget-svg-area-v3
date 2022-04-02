//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_TEXT:C284($2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1

C_BOOLEAN:C305($isItalic; $isBold; $isUnderline)
C_BOOLEAN:C305($shouldRemove)

Case of 
	: ($2="italic")
		
		$isItalic:=True:C214
		
	: ($2="italic-remove")
		
		$isItalic:=True:C214
		$shouldRemove:=True:C214
		
	: ($2="bold")
		
		$isBold:=True:C214
		
	: ($2="bold-remove")
		
		$isBold:=True:C214
		$shouldRemove:=True:C214
		
	: ($2="underline")
		
		$isUnderline:=True:C214
		
	: ($2="underline-remove")
		
		$isUnderline:=True:C214
		$shouldRemove:=True:C214
		
End case 

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)
$count:=Size of array:C274($selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i)

If (0#$count)
	
	NEditor_HISTORY_APPEND_SELECT
	
	For ($i; 1; $count)
		
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
			
			$class:="class-"+$objectId+"-textArea"
			$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
			
			If (OK=1)  //is an object with style
				
				C_TEXT:C284($data; $style)
				DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
				
				ARRAY LONGINT:C221($pos; 0)
				ARRAY LONGINT:C221($len; 0)
				
				If ($isUnderline)
					
					If ($shouldRemove)
						$textDecoration:="none"
					Else 
						$textDecoration:="underline"
					End if 
					
					If (Match regex:C1019("(?m)(.*text-decoration:)([^;]+)(;.*)"; $style; 1; $pos; $len))
						
						C_TEXT:C284($before; $stroke; $after)
						$before:=Substring:C12($style; $pos{1}; $len{1})
						$currentTextDecoration:=Substring:C12($style; $pos{2}; $len{2})
						$after:=Substring:C12($style; $pos{3}; $len{3})
						If ($textDecoration#$currentTextDecoration)
							DOM SET XML ELEMENT VALUE:C868($domStyle; $before+$textDecoration+$after; *)
							$shouldRedraw:=True:C214
						End if 
						
					End if 
					
				End if 
				
				If ($isItalic)
					
					If ($shouldRemove)
						$fontStyle:="normal"
					Else 
						$fontStyle:="oblique"
					End if 
					
					If (Match regex:C1019("(?m)(.*font-style:)([^;]+)(;.*)"; $style; 1; $pos; $len))
						
						C_TEXT:C284($before; $stroke; $after)
						$before:=Substring:C12($style; $pos{1}; $len{1})
						$currentFontStyle:=Substring:C12($style; $pos{2}; $len{2})
						$after:=Substring:C12($style; $pos{3}; $len{3})
						If ($fontStyle#$currentFontStyle)
							DOM SET XML ELEMENT VALUE:C868($domStyle; $before+$fontStyle+$after; *)
							$shouldRedraw:=True:C214
						End if 
						
					End if 
					
				End if 
				
				If ($isBold)
					
					If ($shouldRemove)
						$fontWeight:="normal"
					Else 
						$fontWeight:="bold"
					End if 
					
					If (Match regex:C1019("(?m)(.*font-weight:)([^;]+)(;.*)"; $style; 1; $pos; $len))
						
						C_TEXT:C284($before; $after)
						$before:=Substring:C12($style; $pos{1}; $len{1})
						$currentFontWeight:=Substring:C12($style; $pos{2}; $len{2})
						$after:=Substring:C12($style; $pos{3}; $len{3})
						If ($fontWeight#$currentFontWeight)
							DOM SET XML ELEMENT VALUE:C868($domStyle; $before+$fontWeight+$after; *)
							$shouldRedraw:=True:C214
						End if 
						
					End if 
					
				End if 
				
			End if 
			
		End if 
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 
