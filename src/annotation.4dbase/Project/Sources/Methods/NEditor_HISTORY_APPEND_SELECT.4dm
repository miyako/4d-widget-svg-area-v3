//%attributes = {"invisible":true}
$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
//if the selection has been changed without moving or resizing, it is not yet in history
If ($SelectionChanged->=1)
	NEditor_HISTORY_APPEND
	$SelectionChanged->:=0
End if 