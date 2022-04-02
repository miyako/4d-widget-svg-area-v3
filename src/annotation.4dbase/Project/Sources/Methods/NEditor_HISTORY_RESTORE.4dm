//%attributes = {"invisible":true}
C_LONGINT:C283($1)

$position:=$1

$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$HistoryContainers:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryContainers")

$size:=Size of array:C274($HistoryContainers->)

C_BOOLEAN:C305($shouldUpdate)

If ($position>0)
	If ($position<=$size)
		If ($position#$HistoryIndex->)
			$HistoryIndex->:=$position
			
			If (NEditor_Get_debug_mode)
				$Debug_History:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_History")
				$Debug_History->:=$HistoryIndex->
			End if 
			
			$shouldUpdate:=True:C214
			
		End if 
	End if 
End if 

If ($shouldUpdate)
	
	LISTBOX SELECT ROW:C912(*; "Debug_HistoryList"; $HistoryIndex->; lk replace selection:K53:1)
	$HistoryContainers:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryContainers")
	C_TEXT:C284($containerData)
	
	//%W-533.3
	$containerData:=$HistoryContainers->{$HistoryIndex->}
	//%W+533.3
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	//no need to close $Container-> because its copy will be closed in Editor_ON_DATA_CHANGE
	$Container->:=DOM Parse XML variable:C720($containerData)
	$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
	$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
	
	NEditor_RESIZE_DOCUMENT  //after document size has changed 
	
	NEditor_SET_BACKGROUND_IMAGE
	
	NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
	
	C_REAL:C285($r)
	$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
	DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:r"; $r)
	$canvas:=DOM Find XML element by ID:C1010($DomBgImage->; "canvas")
	DOM SET XML ATTRIBUTE:C866($canvas; "editor:r"; $r)
	
	$BgImage->:=NEditor_Get_background_image($DomBgImage->)
	
	NEditor_ON_DATA_CHANGE(True:C214)
	
	NEditor_TOOL_UPDATE
	
	NEditor_HISTORY_UPDATE_SELECTS($Container->)
	
	CALL SUBFORM CONTAINER:C1086(-104)
	
End if 
