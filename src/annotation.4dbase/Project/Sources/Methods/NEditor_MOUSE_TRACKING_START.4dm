//%attributes = {"invisible":true}
C_BOOLEAN:C305($1; $shouldRedraw)

$shouldRedraw:=$1

$IsTracking:=OBJECT Get pointer:C1124(Object named:K67:5; "IsTracking")
$IsTracking->:=1

OBJECT SET VISIBLE:C603(*; "BgImage"; True:C214)
$imVisible:=0
$bgVisible:=1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")

If ($shouldRedraw)
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$use:=DOM Find XML element by ID:C1010($Container->; "use")
	DOM SET XML ATTRIBUTE:C866($use; "visibility"; "hidden")
Else 
	SVG SET ATTRIBUTE:C1055($Image->; "use"; "visibility"; "hidden")
End if 

If (NEditor_Get_debug_mode)
	$Debug_BgVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgVisible")
	$Debug_ImVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ImVisible")
	$Debug_BgVisible->:=$bgVisible
	$Debug_ImVisible->:=$imVisible
End if 

If (False:C215)
	C_REAL:C285($viewport_tx; $viewport_ty)
	OBJECT GET SCROLL POSITION:C1114(*; "Image"; $viewport_ty; $viewport_tx)
	
	$viewport_translate:="translate("+Str(-$viewport_tx)+","+Str(-$viewport_ty)+")"
	$viewport_transform:=$viewport_translate
	
	$viewport:=DOM Find XML element by ID:C1010($Container->; "viewport")
	DOM SET XML ATTRIBUTE:C866($viewport; "transform"; $viewport_transform; \
		"editor:tx"; $viewport_tx; "editor:ty"; $viewport_ty)
	
	SVG SET ATTRIBUTE:C1055($BgImage->; "viewport"; "transform"; $viewport_transform; \
		"editor:tx"; $viewport_tx; "editor:ty"; $viewport_ty; *)
End if 

If (Version_14_or_later)
	
Else 
	//on v13 the scrollbar move unnecessarily when it is near the edge
	OBJECT SET SCROLLBAR:C843(*; "Image"; False:C215; False:C215)
	OBJECT SET SCROLLBAR:C843(*; "BgImage"; False:C215; False:C215)
	C_LONGINT:C283($scrH; $scrV)
	OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
	OBJECT SET SCROLL POSITION:C906(*; "BgImage"; $scrV; $scrH; *)
End if 

SET TIMER:C645(NEditor_Get_timer_for_draw)