//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

ARRAY TEXT:C222($selection; 0)
NEditor_SELECT_GET_LIST($Container->; ->$selection)

If (Size of array:C274($selection)#0)
	
	CLEAR PASTEBOARD:C402
	
	C_TEXT:C284($objectId; $objectType)
	C_TEXT:C284($placeHolder; $CDATA)
	C_TEXT:C284($marker)
	
	$dom:=DOM Create XML Ref:C861("editor:editor"; "http://www.4d.com/2014/editor"; \
		"xmlns:editor"; "http://www.4d.com/2014/editor")
	
	$count:=Size of array:C274($selection)
	$objects:=DOM Create XML element:C865($dom; "objects"; "id"; "objects")
	$styles:=DOM Create XML element:C865($dom; "styles"; "id"; "styles")
	
	DOM SET XML ATTRIBUTE:C866($objects; "count"; $count)
	
	For ($i; 1; $count)
		
		$objectId:=$selection{$i}
		$objectDom:=DOM Find XML element by ID:C1010($Container->; $objectId)
		$newDom:=DOM Append XML element:C1082($objects; $objectDom)
		
		$tempObjectId:="object-"+String:C10($i)
		$tempClassId:="class-"+$tempObjectId
		
		DOM SET XML ATTRIBUTE:C866($newDom; "id"; $tempObjectId)
		DOM SET XML ATTRIBUTE:C866($newDom; "editor:object-id"; $tempObjectId)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectDom; "editor:object-type"; $objectType)
		
		If ($objectType="text") | ($objectType="image")
			//g
		Else 
			DOM SET XML ATTRIBUTE:C866($newDom; "class"; $tempClassId)
		End if 
		
		Case of 
			: ($objectType="line") | ($objectType="polyline")
				
				$tempMarkerStartId:="marker-start-"+$tempObjectId
				$tempMarkerEndId:="marker-end-"+$tempObjectId
				$tempMarkerClassId:="class-marker-"+$tempObjectId
				$markerClassId:="class-marker-"+$objectId
				
				DOM GET XML ATTRIBUTE BY NAME:C728($objectDom; "editor:marker"; $marker)
				
				$classId:="class-"+$objectId
				$class:=DOM Find XML element by ID:C1010($Container->; $classId)
				$newDomClass:=DOM Append XML element:C1082($styles; $class)
				
				C_TEXT:C284($markerStartId; $markerEndId)
				
				Case of 
					: ($marker="none")
						$markerStartId:=""
						$markerEndId:=""
					: ($marker="both")
						$markerStartId:="url(#"+$tempMarkerStartId+")"
						$markerEndId:="url(#"+$tempMarkerEndId+")"
					: ($marker="start")
						$markerStartId:="url(#"+$tempMarkerStartId+")"
						$markerEndId:=""
					: ($marker="end")
						$markerStartId:=""
						$markerEndId:="url(#"+$tempMarkerEndId+")"
				End case 
				
				//object
				DOM SET XML ATTRIBUTE:C866($newDom; \
					"editor:marker-start-id"; $tempMarkerStartId; \
					"editor:marker-end-id"; $tempMarkerEndId; \
					"marker-start"; $markerStartId; \
					"marker-end"; $markerEndId)
				
				//class [id, editor:object-id, CDATA]
				DOM SET XML ATTRIBUTE:C866($newDomClass; \
					"id"; $tempClassId; \
					"editor:object-id"; $tempObjectId)
				DOM GET XML ELEMENT VALUE:C731($newDomClass; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $classId; $tempClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomClass; $CDATA; *)
				
				C_TEXT:C284($editorMarkerStartId; $editorMarkerEndId)
				
				//marker-start class[id, editor:object-id, class
				DOM GET XML ATTRIBUTE BY NAME:C728($objectDom; "editor:marker-start-id"; $editorMarkerStartId)
				$editorMarkerStart:=DOM Find XML element by ID:C1010($Container->; $editorMarkerStartId)
				$newDomMarkerStart:=DOM Append XML element:C1082($styles; $editorMarkerStart)
				DOM GET XML ELEMENT VALUE:C731($newDomMarkerStart; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $markerClassId; $tempMarkerClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomMarkerStart; $CDATA; *)
				DOM SET XML ATTRIBUTE:C866($newDomMarkerStart; \
					"id"; $tempMarkerStartId; \
					"editor:object-id"; $tempObjectId; \
					"class"; $tempMarkerClassId)
				
				//marker-end class[id, editor:object-id, class
				DOM GET XML ATTRIBUTE BY NAME:C728($objectDom; "editor:marker-end-id"; $editorMarkerEndId)
				$editorMarkerEnd:=DOM Find XML element by ID:C1010($Container->; $editorMarkerEndId)
				$newDomMarkerEnd:=DOM Append XML element:C1082($styles; $editorMarkerEnd)
				DOM GET XML ELEMENT VALUE:C731($newDomMarkerEnd; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $markerClassId; $tempMarkerClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomMarkerEnd; $CDATA; *)
				DOM SET XML ATTRIBUTE:C866($newDomMarkerEnd; \
					"id"; $tempMarkerEndId; \
					"editor:object-id"; $tempObjectId; \
					"class"; $tempMarkerClassId)
				
				//marker class[id, editor:object-id, CDATA]
				$class:=DOM Find XML element by ID:C1010($Container->; $markerClassId)
				$newDomClass:=DOM Append XML element:C1082($styles; $class)
				DOM GET XML ELEMENT VALUE:C731($newDomClass; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $markerClassId; $tempMarkerClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomClass; $CDATA; *)
				DOM SET XML ATTRIBUTE:C866($newDomClass; \
					"id"; $tempMarkerClassId; \
					"editor:object-id"; $tempObjectId)
				
			: ($objectType="ellipse") | ($objectType="rect")
				
				$classId:="class-"+$objectId
				$class:=DOM Find XML element by ID:C1010($Container->; $classId)
				$newDomClass:=DOM Append XML element:C1082($styles; $class)
				DOM SET XML ATTRIBUTE:C866($newDomClass; "id"; $tempClassId)
				DOM SET XML ATTRIBUTE:C866($newDomClass; "editor:object-id"; $tempObjectId)
				
				DOM GET XML ELEMENT VALUE:C731($newDomClass; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $classId; $tempClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomClass; $CDATA; *)
				
			: ($objectType="image")
				
				$classId:="class-"+$objectId+"-rect"
				$tempClassId:="class-"+$tempObjectId+"-rect"
				$class:=DOM Find XML element by ID:C1010($Container->; $classId)
				$newDomClass:=DOM Append XML element:C1082($styles; $class)
				DOM SET XML ATTRIBUTE:C866($newDomClass; "id"; $tempClassId; "editor:object-id"; $tempObjectId)
				DOM GET XML ELEMENT VALUE:C731($newDomClass; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $classId; $tempClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomClass; $CDATA; *)
				
				$imageId:=$objectId+"-data"
				$tempImageId:=$tempObjectId+"-data"
				$image:=DOM Find XML element by ID:C1010($Container->; $imageId)
				$newDomClass:=DOM Append XML element:C1082($styles; $image)
				DOM SET XML ATTRIBUTE:C866($newDomClass; "id"; $tempImageId; "editor:object-id"; $tempObjectId)
				
				//don't find subelements by id, the id is messed up
				$tempRectId:=$tempObjectId+"-rect"
				$tempImageId:=$tempObjectId+"-image"
				$tempRectClassId:="class-"+$tempObjectId+"-rect"
				
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newDom; "g/use"); "id"; $tempImageId; "editor:object-id"; $tempObjectId)
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newDom; "g/rect"); "id"; $tempRectId; "editor:object-id"; $tempObjectId; "class"; $tempRectClassId)
				
			: ($objectType="text")
				
				$classId:="class-"+$objectId+"-rect"
				$tempClassId:="class-"+$tempObjectId+"-rect"
				$class:=DOM Find XML element by ID:C1010($Container->; $classId)
				$newDomClass:=DOM Append XML element:C1082($styles; $class)
				DOM SET XML ATTRIBUTE:C866($newDomClass; "id"; $tempClassId; "editor:object-id"; $tempObjectId)
				DOM GET XML ELEMENT VALUE:C731($newDomClass; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $classId; $tempClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomClass; $CDATA; *)
				
				$classId:="class-"+$objectId+"-textArea"
				$tempClassId:="class-"+$tempObjectId+"-textArea"
				$class:=DOM Find XML element by ID:C1010($Container->; $classId)
				$newDomClass:=DOM Append XML element:C1082($styles; $class)
				DOM SET XML ATTRIBUTE:C866($newDomClass; "id"; $tempClassId; "editor:object-id"; $tempObjectId)
				DOM GET XML ELEMENT VALUE:C731($newDomClass; $placeHolder; $CDATA)
				$CDATA:=Replace string:C233($CDATA; $classId; $tempClassId; *)
				DOM SET XML ELEMENT VALUE:C868($newDomClass; $CDATA; *)
				
				//don't find subelements by id, the id is messed up
				$tempRectId:=$tempObjectId+"-rect"
				$tempTextAreaId:=$tempObjectId+"-textArea"
				$tempRectClassId:="class-"+$tempObjectId+"-rect"
				$tempTextAreaClassId:="class-"+$tempObjectId+"-textArea"
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newDom; "g/textArea"); "id"; $tempTextAreaId; "editor:object-id"; $tempObjectId; "class"; $tempTextAreaClassId)
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newDom; "g/rect"); "id"; $tempRectId; "editor:object-id"; $tempObjectId; "class"; $tempRectClassId)
				
		End case 
		
	End for 
	
	C_BLOB:C604($copiedObjectData)
	DOM EXPORT TO VAR:C863($dom; $copiedObjectData)
	DOM CLOSE XML:C722($dom)
	
	APPEND DATA TO PASTEBOARD:C403("public.utf8-plain-text"; $copiedObjectData)
	APPEND DATA TO PASTEBOARD:C403("com.4d.svg-editor.objects"; $copiedObjectData)
	
End if 