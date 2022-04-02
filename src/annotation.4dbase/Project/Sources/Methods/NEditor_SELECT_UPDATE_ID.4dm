//%attributes = {"invisible":true}
C_POINTER:C301($1)

$Container:=$1

C_LONGINT:C283($i; $countObjects; $countSelects)

ARRAY TEXT:C222($objects; 0)
$objectsDom:=DOM Find XML element by ID:C1010($Container->; "objects")
$object:=DOM Find XML element:C864($objectsDom; "editor:objects/editor:object"; $objects)
$countObjects:=Size of array:C274($objects)

ARRAY TEXT:C222($selects; 0)
$selectsDom:=DOM Find XML element by ID:C1010($Container->; "selects")
$select:=DOM Find XML element:C864($selectsDom; "editor:selects/editor:select"; $selects)
$countSelects:=Size of array:C274($selects)

C_TEXT:C284($objectId)

ARRAY TEXT:C222($oldIds; 0)
ARRAY TEXT:C222($newIds; 0)
ARRAY TEXT:C222($oldObjects; 0)
ARRAY TEXT:C222($oldClasses; 0)
ARRAY TEXT:C222($oldRects; 0)
ARRAY TEXT:C222($oldTextAreas; 0)
ARRAY TEXT:C222($oldImages; 0)
ARRAY TEXT:C222($oldImageRefs; 0)
ARRAY TEXT:C222($oldRectClasses; 0)
ARRAY TEXT:C222($oldTextAreaClasses; 0)

ARRAY TEXT:C222($oldMarkerClasses; 0)
ARRAY TEXT:C222($oldMarkerStartIds; 0)
ARRAY TEXT:C222($oldMarkerEndIds; 0)

For ($i; 1; $countObjects)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($objects{$i}; "editor:object-id"; $objectId)
	
	APPEND TO ARRAY:C911($oldIds; $objectId)
	APPEND TO ARRAY:C911($newIds; "object-"+String:C10($i))
	
	APPEND TO ARRAY:C911($oldObjects; DOM Find XML element by ID:C1010($Container->; $objectId))
	APPEND TO ARRAY:C911($oldClasses; DOM Find XML element by ID:C1010($Container->; "class-"+$objectId))
	APPEND TO ARRAY:C911($oldRects; DOM Find XML element by ID:C1010($Container->; $objectId+"-rect"))
	APPEND TO ARRAY:C911($oldImages; DOM Find XML element by ID:C1010($Container->; $objectId+"-image"))
	APPEND TO ARRAY:C911($oldImageRefs; DOM Find XML element by ID:C1010($Container->; $objectId+"-data"))
	APPEND TO ARRAY:C911($oldTextAreas; DOM Find XML element by ID:C1010($Container->; $objectId+"-textArea"))
	APPEND TO ARRAY:C911($oldRectClasses; DOM Find XML element by ID:C1010($Container->; "class-"+$objectId+"-rect"))
	APPEND TO ARRAY:C911($oldTextAreaClasses; DOM Find XML element by ID:C1010($Container->; "class-"+$objectId+"-textArea"))
	
	APPEND TO ARRAY:C911($oldMarkerClasses; DOM Find XML element by ID:C1010($Container->; "class-marker-"+$objectId))
	APPEND TO ARRAY:C911($oldMarkerStartIds; DOM Find XML element by ID:C1010($Container->; "marker-start-"+$objectId))
	APPEND TO ARRAY:C911($oldMarkerEndIds; DOM Find XML element by ID:C1010($Container->; "marker-end-"+$objectId))
	
End for 

ARRAY TEXT:C222($oldHandleTL; 0)
ARRAY TEXT:C222($newHandleTL; 0)

ARRAY TEXT:C222($oldHandleTM; 0)
ARRAY TEXT:C222($newHandleTM; 0)

ARRAY TEXT:C222($oldHandleTR; 0)
ARRAY TEXT:C222($newHandleTR; 0)

ARRAY TEXT:C222($oldHandleML; 0)
ARRAY TEXT:C222($newHandleML; 0)

ARRAY TEXT:C222($oldHandleMR; 0)
ARRAY TEXT:C222($newHandleMR; 0)

ARRAY TEXT:C222($oldHandleBL; 0)
ARRAY TEXT:C222($newHandleBL; 0)

ARRAY TEXT:C222($oldHandleBM; 0)
ARRAY TEXT:C222($newHandleBM; 0)

ARRAY TEXT:C222($oldHandleBR; 0)
ARRAY TEXT:C222($newHandleBR; 0)

ARRAY TEXT:C222($oldRect; 0)
ARRAY TEXT:C222($newRect; 0)

ARRAY TEXT:C222($oldSelect; 0)
ARRAY TEXT:C222($newSelect; 0)

DOM_ELEMENT_REFRESH_ID($Container->)

If (False:C215)
	$t:=""
	DOM EXPORT TO VAR:C863($Container->; $t)
	SET TEXT TO PASTEBOARD:C523($t)
End if 

For ($i; 1; $countSelects)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	$newObjectId:="object-"+String:C10(Find in array:C230($oldIds; $objectId))
	DOM SET XML ATTRIBUTE:C866($selects{$i}; "editor:object-id"; $newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleTL; DOM Find XML element by ID:C1010($Container->; "select-tl-"+$objectId))
	APPEND TO ARRAY:C911($newHandleTL; "select-tl-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleTM; DOM Find XML element by ID:C1010($Container->; "select-tm-"+$objectId))
	APPEND TO ARRAY:C911($newHandleTM; "select-tm-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleTR; DOM Find XML element by ID:C1010($Container->; "select-tr-"+$objectId))
	APPEND TO ARRAY:C911($newHandleTR; "select-tr-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleML; DOM Find XML element by ID:C1010($Container->; "select-ml-"+$objectId))
	APPEND TO ARRAY:C911($newHandleML; "select-ml-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleMR; DOM Find XML element by ID:C1010($Container->; "select-mr-"+$objectId))
	APPEND TO ARRAY:C911($newHandleMR; "select-mr-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleBL; DOM Find XML element by ID:C1010($Container->; "select-bl-"+$objectId))
	APPEND TO ARRAY:C911($newHandleBL; "select-bl-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleBM; DOM Find XML element by ID:C1010($Container->; "select-bm-"+$objectId))
	APPEND TO ARRAY:C911($newHandleBM; "select-bm-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleBR; DOM Find XML element by ID:C1010($Container->; "select-br-"+$objectId))
	APPEND TO ARRAY:C911($newHandleBR; "select-br-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldRect; DOM Find XML element by ID:C1010($Container->; "select-rect-"+$objectId))
	APPEND TO ARRAY:C911($newRect; "select-rect-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldSelect; DOM Find XML element by ID:C1010($Container->; "select-"+$objectId))
	APPEND TO ARRAY:C911($newSelect; "select-"+$newObjectId)
	
End for 

For ($i; 1; $countSelects)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
	$newObjectId:="object-"+String:C10(Find in array:C230($oldIds; $objectId))
	
	DOM SET XML ATTRIBUTE:C866($oldHandleTL{$i}; "id"; $newHandleTL{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleTM{$i}; "id"; $newHandleTM{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleTR{$i}; "id"; $newHandleTR{$i})
	
	DOM SET XML ATTRIBUTE:C866($oldHandleML{$i}; "id"; $newHandleML{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleMR{$i}; "id"; $newHandleMR{$i})
	
	DOM SET XML ATTRIBUTE:C866($oldHandleBL{$i}; "id"; $newHandleBL{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleBM{$i}; "id"; $newHandleBM{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleBR{$i}; "id"; $newHandleBR{$i})
	
	DOM SET XML ATTRIBUTE:C866($oldRect{$i}; "id"; $newRect{$i})
	DOM SET XML ATTRIBUTE:C866($oldSelect{$i}; "id"; $newSelect{$i})
	
End for 

C_TEXT:C284($placeHolder; $CDATA)
C_TEXT:C284($oldMarkerStartId; $oldMarkerEndId)
C_TEXT:C284($newMarkerStartId; $newMarkerEndId)


For ($i; 1; $countObjects)
	
	$oldId:=$oldIds{$i}
	$newId:=$newIds{$i}
	
	DOM SET XML ATTRIBUTE:C866($objects{$i}; "editor:object-id"; $newId)
	DOM SET XML ATTRIBUTE:C866($oldObjects{$i}; "id"; $newId; "editor:object-id"; $newId)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($objects{$i}; "editor:object-type"; $objectType)
	
	Case of 
		: ($objectType="line") | ($objectType="polyline")
			
			DOM SET XML ATTRIBUTE:C866($oldObjects{$i}; "class"; "class-"+$newId)
			DOM SET XML ATTRIBUTE:C866($oldClasses{$i}; "editor:object-id"; $newId)
			
			DOM GET XML ELEMENT VALUE:C731($oldClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-"+$oldId; "class-"+$newId; *)
			DOM SET XML ELEMENT VALUE:C868($oldClasses{$i}; $CDATA; *)
			DOM SET XML ATTRIBUTE:C866($oldClasses{$i}; "id"; "class-"+$newId; "editor:object-id"; $newId)
			
			DOM GET XML ELEMENT VALUE:C731($oldMarkerClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-marker-"+$oldId; "class-marker-"+$newId; *)
			DOM SET XML ELEMENT VALUE:C868($oldMarkerClasses{$i}; $CDATA; *)
			DOM SET XML ATTRIBUTE:C866($oldMarkerClasses{$i}; "id"; "class-marker-"+$newId; "editor:object-id"; $newId)
			
			DOM GET XML ATTRIBUTE BY NAME:C728($oldObjects{$i}; "marker-start"; $oldMarkerStartId)
			DOM GET XML ATTRIBUTE BY NAME:C728($oldObjects{$i}; "marker-end"; $oldMarkerEndId)
			$newMarkerStartId:=Replace string:C233($oldMarkerStartId; "marker-start-"+$oldId; "marker-start-"+$newId; *)
			$newMarkerEndId:=Replace string:C233($oldMarkerEndId; "marker-end-"+$oldId; "marker-end-"+$newId; *)
			
			DOM SET XML ATTRIBUTE:C866($oldObjects{$i}; \
				"marker-start"; $newMarkerStartId; \
				"marker-end"; $newMarkerEndId; \
				"editor:marker-start-id"; "marker-start-"+$newId; \
				"editor:marker-end-id"; "marker-end-"+$newId)
			
			DOM SET XML ATTRIBUTE:C866($oldMarkerStartIds{$i}; "id"; "marker-start-"+$newId; "class"; "class-marker-"+$newId; "editor:object-id"; $newId)
			DOM SET XML ATTRIBUTE:C866($oldMarkerEndIds{$i}; "id"; "marker-end-"+$newId; "class"; "class-marker-"+$newId; "editor:object-id"; $newId)
			
		: ($objectType="ellipse") | ($objectType="rect")
			
			//id
			DOM SET XML ATTRIBUTE:C866($oldObjects{$i}; "class"; "class-"+$newId)
			DOM SET XML ATTRIBUTE:C866($oldClasses{$i}; "editor:object-id"; $newId)
			
			//class
			DOM GET XML ELEMENT VALUE:C731($oldClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-"+$oldId; "class-"+$newId; *)
			DOM SET XML ELEMENT VALUE:C868($oldClasses{$i}; $CDATA; *)
			DOM SET XML ATTRIBUTE:C866($oldClasses{$i}; "id"; "class-"+$newId)
			
		: ($objectType="image")
			
			DOM SET XML ATTRIBUTE:C866($oldRects{$i}; "class"; "class-"+$newId+"-rect"; "id"; $newId+"-rect"; "editor:object-id"; $newId)
			DOM SET XML ATTRIBUTE:C866($oldImages{$i}; "id"; $newId+"-image"; "editor:object-id"; $newId; "xlink:href"; "#"+$newId+"-data")
			DOM SET XML ATTRIBUTE:C866($oldImageRefs{$i}; "id"; $newId+"-data"; "editor:object-id"; $newId)
			
			DOM GET XML ELEMENT VALUE:C731($oldRectClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-"+$oldId+"-rect"; "class-"+$newId+"-rect"; *)
			DOM SET XML ELEMENT VALUE:C868($oldRectClasses{$i}; $CDATA; *)
			
			DOM SET XML ATTRIBUTE:C866($oldRectClasses{$i}; "id"; "class-"+$newId+"-rect"; "editor:object-id"; $newId)
			
		: ($objectType="text")
			
			DOM SET XML ATTRIBUTE:C866($oldRects{$i}; "class"; "class-"+$newId+"-rect"; "id"; $newId+"-rect"; "editor:object-id"; $newId)
			DOM SET XML ATTRIBUTE:C866($oldTextAreas{$i}; "class"; "class-"+$newId+"-textArea"; "id"; $newId+"-textArea"; "editor:object-id"; $newId)
			
			DOM GET XML ELEMENT VALUE:C731($oldRectClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-"+$oldId+"-rect"; "class-"+$newId+"-rect"; *)
			DOM SET XML ELEMENT VALUE:C868($oldRectClasses{$i}; $CDATA; *)
			
			DOM GET XML ELEMENT VALUE:C731($oldTextAreaClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-"+$oldId+"-textArea"; "class-"+$newId+"-textArea"; *)
			DOM SET XML ELEMENT VALUE:C868($oldTextAreaClasses{$i}; $CDATA; *)
			
			DOM SET XML ATTRIBUTE:C866($oldRectClasses{$i}; "id"; "class-"+$newId+"-rect"; "editor:object-id"; $newId)
			DOM SET XML ATTRIBUTE:C866($oldTextAreaClasses{$i}; "id"; "class-"+$newId+"-textArea"; "editor:object-id"; $newId)
			
	End case 
	
End for 

DOM_ELEMENT_REFRESH_ID($Container->)

//delete
NEditor_GROW_CLEAR