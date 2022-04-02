//%attributes = {"invisible":true}
$HistoryContainers:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryContainers")
CLEAR VARIABLE:C89($HistoryContainers->)

$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$HistoryIndex->:=0

If (NEditor_Get_debug_mode)
	$Debug_History:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_History")
	$Debug_History->:=$HistoryIndex->
End if 