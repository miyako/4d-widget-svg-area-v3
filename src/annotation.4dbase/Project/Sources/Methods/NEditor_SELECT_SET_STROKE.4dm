//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_LONGINT:C283($2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1
$color:=$2-1

$colorHtml:=Hex(Color($color))

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
		
		C_TEXT:C284($type; $class; $attribute)
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
		
		Case of 
			: ($isText)
				$class:="class-"+$objectId+"-textArea"
				$attribute:="fill"
			: ($isImage)
				$class:="class-"+$objectId+"-rect"
				$attribute:="stroke"
			Else 
				$class:="class-"+$objectId
				$attribute:="stroke"
		End case 
		
		//If (Not($isImage))|True
		
		//DOM SET XML ATTRIBUTE($object;"color";$colorHtml;"alt-color";$colorHtml;"color-index";$color;"alt-color-index";$color)
		
		$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
		
		If (OK=1)  //is an object with style
			
			C_TEXT:C284($data; $style)
			DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
			
			ARRAY LONGINT:C221($pos; 0)
			ARRAY LONGINT:C221($len; 0)
			
			If (Match regex:C1019("(?m)(.*"+$attribute+":)([^;]+)(;.*)"; $style; 1; $pos; $len))
				
				C_TEXT:C284($before; $stroke; $after)
				$before:=Substring:C12($style; $pos{1}; $len{1})
				$stroke:=Substring:C12($style; $pos{2}; $len{2})
				$after:=Substring:C12($style; $pos{3}; $len{3})
				
				If ($stroke#$colorHtml)
					$style:=$before+$colorHtml+$after
					If (Match regex:C1019("(?m)(.*stroke-opacity:)([^;]+)(;.*)"; $style; 1; $pos; $len))
						$before:=Substring:C12($style; $pos{1}; $len{1})
						$after:=Substring:C12($style; $pos{3}; $len{3})
						If ($color=0) & (Not:C34($isText))
							$strokeOpacity:=0
						Else 
							$strokeOpacity:=NEditor_Get_default_opacity/100
						End if 
						$style:=$before+Str($strokeOpacity)+$after
					End if 
					
					DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
					$shouldRedraw:=True:C214
					
					If ($isText)
						$class:="class-"+$objectId+"-rect"
						$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
						DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
						$attribute:="stroke"
						If (Match regex:C1019("(?m)(.*"+$attribute+":)([^;]+)(;.*)"; $style; 1; $pos; $len))
							$before:=Substring:C12($style; $pos{1}; $len{1})
							$after:=Substring:C12($style; $pos{3}; $len{3})
							$style:=$before+$colorHtml+$after
							DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
						End if 
					End if 
					
				End if 
				
			End if 
			
			If ($type="line") | ($type="polyline")
				
				$class:="class-marker-"+$objectId
				$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
				
				C_TEXT:C284($data; $style)
				DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
				
				If (Match regex:C1019("(?m)(.*"+"fill"+":)([^;]+)(;.*)"; $style; 1; $pos; $len))
					
					C_TEXT:C284($before; $stroke; $after)
					$before:=Substring:C12($style; $pos{1}; $len{1})
					$stroke:=Substring:C12($style; $pos{2}; $len{2})
					$after:=Substring:C12($style; $pos{3}; $len{3})
					
					If ($stroke#$colorHtml)
						$style:=$before+$colorHtml+$after
						
						DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
						$shouldRedraw:=True:C214
						
					End if 
					
				End if 
				
			End if 
			
		End if 
		
		//End if 
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 
