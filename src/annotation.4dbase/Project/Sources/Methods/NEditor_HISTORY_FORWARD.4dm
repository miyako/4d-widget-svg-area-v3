//%attributes = {"invisible":true}
$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$HistoryContainers:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryContainers")

$size:=Size of array:C274($HistoryContainers->)

If ($size>$HistoryIndex->)
	
	NEditor_HISTORY_RESTORE($HistoryIndex->+1)
	
End if 