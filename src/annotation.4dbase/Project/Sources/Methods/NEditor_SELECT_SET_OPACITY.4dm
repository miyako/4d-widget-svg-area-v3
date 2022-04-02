//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_REAL:C285($2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1
$strokeOpacity:=($2/100)

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
		
		C_BOOLEAN:C305($ignore)
		
		Case of 
			: ($type="line")
				$class:="class-"+$objectId
				$ignore:=False:C215
			: ($type="polyline")
				$class:="class-"+$objectId
				$ignore:=False:C215
			: ($type="ellipse")
				$class:="class-"+$objectId
				$ignore:=False:C215
			: ($type="rect")
				$class:="class-"+$objectId
				$ignore:=False:C215
			: ($type="round-rect")
				$class:="class-"+$objectId
				$ignore:=False:C215
			: ($type="text")
				$class:="class-"+$objectId+"-rect"
				$ignore:=False:C215
			: ($type="variable")
				C_LONGINT:C283($fieldType)
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:field-type"; $fieldType)
				$class:="class-"+$objectId+"-rect"
				$ignore:=($fieldType=Is picture:K8:10)
			: ($type="image")
				$class:="class-"+$objectId+"-rect"
				$ignore:=False:C215
		End case 
		
		If (Not:C34($ignore))
			
			$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
			
			If (OK=1)  //is an object with style
				
				C_TEXT:C284($data; $style)
				DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
				
				ARRAY LONGINT:C221($pos; 0)
				ARRAY LONGINT:C221($len; 0)
				
				If (Match regex:C1019("(?m)(.*stroke-opacity:)([^;]+)(;.*)"; $style; 1; $pos; $len))
					
					C_TEXT:C284($before; $after)
					$before:=Substring:C12($style; $pos{1}; $len{1})
					$currentStrokeOpacity:=Num:C11(Substring:C12($style; $pos{2}; $len{2}))
					$after:=Substring:C12($style; $pos{3}; $len{3})
					If ($strokeOpacity#$currentStrokeOpacity)
						$style:=$before+Str($strokeOpacity)+$after
						DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
						
						If ($type="line") | ($type="polyline")
							
							$class:="class-marker-"+$objectId
							$domStyle:=DOM Find XML element by ID:C1010($Container->; $class)
							
							If (OK=1)
								
								C_TEXT:C284($data; $style)
								DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
								
								If (Match regex:C1019("(?m)(.*fill-opacity:)([^;]+)(;.*)"; $style; 1; $pos; $len))
									
									C_TEXT:C284($before; $after)
									$before:=Substring:C12($style; $pos{1}; $len{1})
									$currentFillOpacity:=Num:C11(Substring:C12($style; $pos{2}; $len{2}))
									$after:=Substring:C12($style; $pos{3}; $len{3})
									
									If ($strokeOpacity#$currentFillOpacity)
										$style:=$before+Str($strokeOpacity)+$after
										DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
										
									End if 
									
								End if 
								
							End if 
							
						End if 
						
						$shouldRedraw:=True:C214
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
