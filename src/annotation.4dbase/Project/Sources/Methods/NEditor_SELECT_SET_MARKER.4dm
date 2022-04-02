//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_TEXT:C284($2)
C_BOOLEAN:C305($shouldRedraw)

$Container:=$1
$marker:=$2

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
		
		If ($type="line") | ($type="polyline")
			
			$currentMarker:=""
			DOM GET XML ATTRIBUTE BY NAME:C728($object; "marker"; $currentMarker)
			
			If ($currentMarker#$marker)
				
				DOM SET XML ATTRIBUTE:C866($object; "marker"; $marker)
				$line:=DOM Find XML element by ID:C1010($Container->; $objectId)
				
				C_TEXT:C284($editorMarkerStartId; $editorMarkerEndId)
				C_TEXT:C284($markerStartId; $markerEndId)
				DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:marker-start-id"; $editorMarkerStartId)
				DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:marker-end-id"; $editorMarkerEndId)
				
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
				
				DOM SET XML ATTRIBUTE:C866($line; \
					"editor:marker"; $marker; \
					"marker-end"; $markerEndId; "marker-start"; $markerStartId)
				
				$shouldRedraw:=True:C214
			End if 
			
		End if 
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 
