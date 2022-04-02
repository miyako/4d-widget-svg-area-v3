//%attributes = {"invisible":true}
C_BOOLEAN:C305($1; $bg)

$bg:=$1

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
$use:=DOM Find XML element by ID:C1010($Container->; "use")

C_LONGINT:C283($imVisible; $bgVisible)

If ($bg)
	DOM SET XML ATTRIBUTE:C866($use; "visibility"; "hidden")
	OBJECT SET VISIBLE:C603(*; "BgImage"; True:C214)
	$imVisible:=0
	$bgVisible:=1
Else 
	DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")
	OBJECT SET VISIBLE:C603(*; "BgImage"; False:C215)
	$imVisible:=1
	$bgVisible:=0
End if 

If (NEditor_Get_debug_mode)
	$Debug_BgVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgVisible")
	$Debug_ImVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ImVisible")
	$Debug_BgVisible->:=$bgVisible
	$Debug_ImVisible->:=$imVisible
End if 