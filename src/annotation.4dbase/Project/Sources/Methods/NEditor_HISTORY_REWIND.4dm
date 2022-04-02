//%attributes = {"invisible":true}
$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")

If (1<$HistoryIndex->)
	
	NEditor_HISTORY_APPEND_SELECT
	
	NEditor_HISTORY_RESTORE($HistoryIndex->-1)
	
End if 