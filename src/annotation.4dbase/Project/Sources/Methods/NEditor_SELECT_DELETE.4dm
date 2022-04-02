//%attributes = {"invisible":true}
C_BOOLEAN:C305($1; $clearObjects)

$params:=Count parameters:C259

If ($params#0)
	$clearObjects:=$1
End if 

If ($clearObjects)
	NEditor_SELECT_ALL($clearObjects)
End if 

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

If (Not:C34(Is nil pointer:C315($Container)))
	If (Length:C16($Container->)#0)
		
		C_LONGINT:C283($count; $countObjects)
		ARRAY TEXT:C222($selects; 0)
		$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)
		$count:=Size of array:C274($selects)
		ARRAY TEXT:C222($objects; 0)
		$objectsDom:=DOM Find XML element by ID:C1010($Container->; "objects")
		$object:=DOM Find XML element:C864($objectsDom; "editor:objects/editor:object"; $objects)
		$countObjects:=Size of array:C274($objects)
		ARRAY TEXT:C222($objectIds; $countObjects)
		C_LONGINT:C283($i)
		For ($i; 1; $countObjects)
			DOM GET XML ATTRIBUTE BY NAME:C728($objects{$i}; "editor:object-id"; $objectIds{$i})
		End for 
		
		If (0#$count)
			
			NEditor_HISTORY_APPEND_SELECT
			
			C_TEXT:C284($objectId; $objectType)
			
			For ($i; 1; $count)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $objectId)
				
				//remove select from canvas 
				$selectId:="select-"+$objectId
				DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $selectId))
				
				$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
				DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $objectType)
				
				//remove class from canvas
				Case of 
					: ($objectType="line") | ($objectType="polyline")
						
						$class:="class-"+$objectId
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
						
						$markerId:="marker-"+$objectId
						
						$markerClass:="class-"+$markerId
						$markerStartId:="marker-start-"+$objectId
						$markerEndId:="marker-end-"+$objectId
						
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerClass))
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerStartId))
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerEndId))
						
					: ($objectType="ellipse") | ($objectType="rect")
						
						$class:="class-"+$objectId
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
						
					: ($objectType="image")
						
						$class:="class-"+$objectId+"-rect"
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
						
						$image:=$objectId+"-data"
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $image))
						
					: ($objectType="text")
						
						$class:="class-"+$objectId+"-textArea"
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
						
						$class:="class-"+$objectId+"-rect"
						DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
						
				End case 
				
				DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $objectId))
				DOM REMOVE XML ELEMENT:C869($selects{$i})
				DOM REMOVE XML ELEMENT:C869($objects{Find in array:C230($objectIds; $objectId)})
				
			End for 
			
			NEditor_SELECT_UPDATE_ID($Container)
			
			If (Not:C34($clearObjects))
				
				NEditor_ON_DATA_CHANGE
				
				CALL SUBFORM CONTAINER:C1086(-103)
				
			End if 
			
			NEditor_TOOL_UPDATE
			
		End if 
	End if 
End if 