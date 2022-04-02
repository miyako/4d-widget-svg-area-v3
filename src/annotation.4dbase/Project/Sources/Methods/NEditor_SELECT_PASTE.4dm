//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$pasteX:=NEditor_Get_paste_x
$pasteY:=NEditor_Get_paste_y

C_BOOLEAN:C305($1; $doNotIncrement)

If (Count parameters:C259#0)
	$doNotIncrement:=$1
End if 

GET MOUSE:C468($x; $y; $b)

C_LONGINT:C283($scrH; $scrV)
OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)

$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")
$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")

$MouseX:=$x-$OffsetX->+$scrH
$MouseY:=$y-$OffsetY->+$scrV

C_BLOB:C604($copiedObjectData)
C_BOOLEAN:C305($isAccepted)

Case of 
	: (0<Pasteboard data size:C400(Picture data:K20:3))
		
	: (0<Pasteboard data size:C400("com.4d.svg-editor.objects"))
		GET PASTEBOARD DATA:C401("com.4d.svg-editor.objects"; $copiedObjectData)
		
	: (0<Pasteboard data size:C400("public.utf8-plain-text"))
		GET PASTEBOARD DATA:C401("public.utf8-plain-text"; $copiedObjectData)
		
	: (0<Pasteboard data size:C400("public.utf16-plain-text"))
		GET PASTEBOARD DATA:C401("public.utf8-plain-text"; $copiedObjectData)
		
	: (0<Pasteboard data size:C400("public.utf16-external-plain-text"))
		GET PASTEBOARD DATA:C401("public.utf8-plain-text"; $copiedObjectData)
		
	Else 
		
End case 

If (BLOB size:C605($copiedObjectData)#0)
	
	$old:=Method called on error:C704
	ON ERR CALL:C155("LABEL_ON_ERROR_CALL")
	$dom:=DOM Parse XML variable:C720($copiedObjectData)
	ON ERR CALL:C155($old)
	
	C_TEXT:C284($objectType; $tempObjectId; $tempClassId; $classId; $placeHolder; $CDATA; $marker; $tempMarkerClassId)
	
	If (OK=1)
		
		C_TEXT:C284($rootObjectName)
		DOM GET XML ELEMENT NAME:C730($dom; $rootObjectName)
		
		If ($rootObjectName="editor:editor")
			
			$containerObjects:=DOM Find XML element by ID:C1010($Container->; "objects")
			$countObjects:=DOM Count XML elements:C726($containerObjects; "editor:object")
			$defs:=DOM Find XML element by ID:C1010($Container->; "defs")
			
			ARRAY TEXT:C222($objectTypes; 0)
			ARRAY TEXT:C222($objectDoms; 0)
			ARRAY TEXT:C222($objectIds; 0)
			
			$objects:=DOM Find XML element by ID:C1010($dom; "objects")
			
			C_LONGINT:C283($i; $count)
			DOM GET XML ATTRIBUTE BY NAME:C728($objects; "count"; $count)
			
			$object:=DOM Get first child XML element:C723($objects)
			$annotation:=DOM Find XML element by ID:C1010($Container->; "annotation")
			
			For ($i; 1; $count)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "id"; $tempObjectId)
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $objectType)
				$newObject:=DOM Append XML element:C1082($annotation; $object)
				
				$objectId:="object-"+String:C10($countObjects+$i)
				$classId:="class-"+$objectId
				$tempClassId:="class-"+$tempObjectId
				
				C_REAL:C285($x; $y; $width; $height; $tx; $ty; $sx; $sy; $r; $cx; $cy)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:x"; $x)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:y"; $y)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:width"; $width)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:height"; $height)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:tx"; $tx)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:ty"; $ty)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:sx"; $sx)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:sy"; $sy)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:cx"; $cx)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:cy"; $cy)
				DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:r"; $r)
				
				$tx:=$tx+($pasteX/$Zoom->)
				$ty:=$ty+($pasteY/$Zoom->)
				
				$translate:="translate("+Str($tx)+","+Str($ty)+")"
				$scale:="scale("+Str($sx)+","+Str($sy)+")"
				$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
				
				$transform:=$translate+" "+$scale+" "+$rotate
				
				DOM SET XML ATTRIBUTE:C866($newObject; "editor:tx"; $tx; "editor:ty"; $ty; "transform"; $transform; "id"; $objectId; "editor:object-id"; $objectId)
				
				If ($objectType="text") | ($objectType="image")
					//g
				Else 
					DOM SET XML ATTRIBUTE:C866($newObject; "class"; $classId)
				End if 
				
				$containerObject:=DOM Create XML element:C865($containerObjects; "editor:object"; "editor:object-id"; $objectId; "editor:object-type"; $objectType)
				
				Case of 
					: ($objectType="line") | ($objectType="polyline")
						
						DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:marker"; $marker)
						
						$markerClassId:="class-marker-"+$objectId
						$editorMarkerStartId:="marker-start-"+$objectId
						$editorMarkerEndId:="marker-end-"+$objectId
						$tempMarkerClassId:="class-marker-"+$tempObjectId
						
						C_TEXT:C284($markerStartId; $markerEndId)
						
						Case of 
							: ($marker="none")
								$markerStartId:=""
								$markerEndId:=""
							: ($marker="both")
								$markerStartId:="url(#"+$editorMarkerStartId+")"
								$markerEndId:="url(#"+$editorMarkerEndId+")"
							: ($marker="start")
								$markerStartId:="url(#"+$editorMarkerStartId+")"
								$markerEndId:=""
							: ($marker="end")
								$markerStartId:=""
								$markerEndId:="url(#"+$editorMarkerEndId+")"
						End case 
						
						C_TEXT:C284($tempMarkerStartId; $tempMarkerEndId)
						DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:marker-start-id"; $tempMarkerStartId)
						DOM GET XML ATTRIBUTE BY NAME:C728($newObject; "editor:marker-end-id"; $tempMarkerEndId)
						
						//object
						DOM SET XML ATTRIBUTE:C866($newObject; "editor:marker-start-id"; $editorMarkerStartId; "editor:marker-end-id"; $editorMarkerEndId; "marker-start"; $markerStartId; "marker-end"; $markerEndId)
						
						//!class must appear before marker in defs
						
						//class [id, editor:object-id, CDATA]
						$class:=DOM Find XML element by ID:C1010($dom; $tempClassId)
						DOM GET XML ELEMENT VALUE:C731($class; $placeHolder; $CDATA)
						$CDATA:=Replace string:C233($CDATA; $tempClassId; $classId; *)
						$class:=DOM Append XML element:C1082($defs; $class)
						DOM SET XML ELEMENT VALUE:C868($class; $CDATA; *)  //CDATA
						DOM SET XML ATTRIBUTE:C866($class; "id"; $classId; "editor:object-id"; $objectId)
						
						//marker class[id, editor:object-id, CDATA]
						$class:=DOM Find XML element by ID:C1010($dom; $tempMarkerClassId)
						DOM GET XML ELEMENT VALUE:C731($class; $placeHolder; $CDATA)
						$CDATA:=Replace string:C233($CDATA; $tempMarkerClassId; $markerClassId; *)
						$class:=DOM Append XML element:C1082($defs; $class)
						DOM SET XML ELEMENT VALUE:C868($class; $CDATA; *)  //CDATA
						DOM SET XML ATTRIBUTE:C866($class; "id"; $markerClassId; "editor:object-id"; $objectId)
						
						//marker-start class[id, editor:object-id, class
						$markerStart:=DOM Find XML element by ID:C1010($dom; $tempMarkerStartId)
						$markerStart:=DOM Append XML element:C1082($defs; $markerStart)
						DOM SET XML ATTRIBUTE:C866($markerStart; "id"; $editorMarkerStartId; "editor:object-id"; $objectId; "class"; $markerClassId)
						
						//marker-end class[id, editor:object-id, class
						$markerEnd:=DOM Find XML element by ID:C1010($dom; $tempMarkerEndId)
						$markerEnd:=DOM Append XML element:C1082($defs; $markerEnd)
						DOM SET XML ATTRIBUTE:C866($markerEnd; "id"; $editorMarkerEndId; "editor:object-id"; $objectId; "class"; $markerClassId)
						
					: ($objectType="ellipse") | ($objectType="rect")
						
						$class:=DOM Find XML element by ID:C1010($dom; $tempClassId)
						DOM GET XML ELEMENT VALUE:C731($class; $placeHolder; $CDATA)
						$CDATA:=Replace string:C233($CDATA; $tempClassId; $classId; *)
						$class:=DOM Append XML element:C1082($defs; $class)
						DOM SET XML ELEMENT VALUE:C868($class; $CDATA; *)  //CDATA
						
						DOM SET XML ATTRIBUTE:C866($class; "id"; $classId; "editor:object-id"; $objectId)
						
					: ($objectType="image")
						
						$imageId:=$objectId+"-image"
						$rectId:=$objectId+"-rect"
						
						$imageDataId:=$objectId+"-data"
						$rectClassId:="class-"+$objectId+"-rect"
						$tempRectClassId:="class-"+$tempObjectId+"-rect"
						$tempImageId:=$tempObjectId+"-data"
						$imageHref:="#"+$objectId+"-data"
						
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newObject; "g/use"); "id"; $imageId; "editor:object-id"; $objectId; "xlink:href"; $imageHref)
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newObject; "g/rect"); "id"; $rectId; "editor:object-id"; $objectId; "class"; $rectClassId)
						
						$class:=DOM Find XML element by ID:C1010($dom; $tempRectClassId)
						DOM GET XML ELEMENT VALUE:C731($class; $placeHolder; $CDATA)
						$CDATA:=Replace string:C233($CDATA; $tempRectClassId; $rectClassId; *)
						$class:=DOM Append XML element:C1082($defs; $class)
						DOM SET XML ELEMENT VALUE:C868($class; $CDATA; *)  //CDATA
						DOM SET XML ATTRIBUTE:C866($class; "id"; $rectClassId; "editor:object-id"; $objectId)
						
						$image:=DOM Find XML element by ID:C1010($dom; $tempImageId)
						$image:=DOM Append XML element:C1082($defs; $image)
						DOM SET XML ATTRIBUTE:C866($image; "id"; $imageDataId; "editor:object-id"; $objectId)
						
					: ($objectType="text")
						
						$textAreaId:=$objectId+"-textArea"
						$rectId:=$objectId+"-rect"
						$rectClassId:="class-"+$objectId+"-rect"
						$tempRectClassId:="class-"+$tempObjectId+"-rect"
						$textAreaClassId:="class-"+$objectId+"-textArea"
						$tempTextAreaClassId:="class-"+$tempObjectId+"-textArea"
						
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newObject; "g/textArea"); "id"; $textAreaId; "editor:object-id"; $objectId; "class"; $textAreaClassId)
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element:C864($newObject; "g/rect"); "id"; $rectId; "editor:object-id"; $objectId; "class"; $rectClassId)
						
						$class:=DOM Find XML element by ID:C1010($dom; $tempRectClassId)
						DOM GET XML ELEMENT VALUE:C731($class; $placeHolder; $CDATA)
						$CDATA:=Replace string:C233($CDATA; $tempRectClassId; $rectClassId; *)
						$class:=DOM Append XML element:C1082($defs; $class)
						DOM SET XML ELEMENT VALUE:C868($class; $CDATA; *)  //CDATA
						DOM SET XML ATTRIBUTE:C866($class; "id"; $rectClassId; "editor:object-id"; $objectId)
						
						$class:=DOM Find XML element by ID:C1010($dom; $tempTextAreaClassId)
						DOM GET XML ELEMENT VALUE:C731($class; $placeHolder; $CDATA)
						$CDATA:=Replace string:C233($CDATA; $tempTextAreaClassId; $textAreaClassId; *)
						$class:=DOM Append XML element:C1082($defs; $class)
						DOM SET XML ELEMENT VALUE:C868($class; $CDATA; *)  //CDATA
						DOM SET XML ATTRIBUTE:C866($class; "id"; $textAreaClassId; "editor:object-id"; $objectId)
						
				End case 
				
				Case of 
					: ($objectType="ellipse")
						
						NEditor_SELECT_Ellipse($newObject; $objectId)
						
					: ($objectType="line")
						
						NEditor_SELECT_Line($newObject; $objectId)
						
					: ($objectType="polyline")
						
						NEditor_SELECT_Polyline($newObject; $objectId)
						
					: ($objectType="rect")
						
						NEditor_SELECT_Rect($newObject; $objectId)
						
					: ($objectType="text")
						
						NEditor_SELECT_Text($newObject; $objectId)
						
					: ($objectType="image")
						
						NEditor_SELECT_Image($newObject; $objectId)
						
				End case 
				
				$object:=DOM Get next sibling XML element:C724($object)
				
			End for 
			
			DOM CLOSE XML:C722($dom)
			
			NEditor_ON_DATA_CHANGE
			
			If (Not:C34($doNotIncrement))
				NEditor_INCREMENT_OFFSET
			End if 
			
			NEditor_TOOL_UPDATE
			
			CALL SUBFORM CONTAINER:C1086(-103)
			
			$isAccepted:=True:C214
			
		End if 
		
	End if 
	
	If (Not:C34($isAccepted))
		
		$isAccepted:=NEditor_TEXT_Create($MouseX; $MouseY)
		
	End if 
	
End if 

If (Not:C34($isAccepted))
	
	Case of 
		: (0<Pasteboard data size:C400(Picture data:K20:3))
			
			$isAccepted:=NEditor_IMAGE_Create($MouseX; $MouseY)
			
	End case 
	
End if 