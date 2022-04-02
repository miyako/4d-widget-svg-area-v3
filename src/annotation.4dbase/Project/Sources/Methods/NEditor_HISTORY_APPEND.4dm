//%attributes = {"invisible":true}
$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$HistoryContainers:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryContainers")

//%W-518.5
ARRAY TEXT:C222($HistoryContainers->; $HistoryIndex->)
//%W+518.5

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
C_TEXT:C284($containerData)
DOM EXPORT TO VAR:C863($Container->; $containerData)
APPEND TO ARRAY:C911($HistoryContainers->; $containerData)

$size:=Size of array:C274($HistoryContainers->)
$HistoryIndex->:=$size

LISTBOX SELECT ROW:C912(*; "Debug_HistoryList"; $HistoryIndex->; lk replace selection:K53:1)

If (NEditor_Get_debug_mode)
	$Debug_History:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_History")
	$Debug_History->:=$HistoryIndex->
End if 

OBJECT SET ENABLED:C1123(*; "Rewind"; 1<$HistoryIndex->)
OBJECT SET ENABLED:C1123(*; "Forward"; Size of array:C274($HistoryContainers->)>$HistoryIndex->)

CALL SUBFORM CONTAINER:C1086(-103)