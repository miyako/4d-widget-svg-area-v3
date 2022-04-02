//%attributes = {"invisible":true}
C_POINTER:C301($1; $2; $3)

$IsTracking:=$1
$IsResizing:=$2
$IsScrolling:=$3

$IsTracking->:=0

If (0=$IsResizing->) & (0=$IsScrolling->)
	
	SET TIMER:C645(0)
	
End if 

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")

//data change is always triggered, see $p->:=$p-> in ON TIMER
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$use:=DOM Find XML element by ID:C1010($Container->; "use")
DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")

OBJECT SET VISIBLE:C603(*; "BgImage"; False:C215)
$imVisible:=1
$bgVisible:=0

If (NEditor_Get_debug_mode)
	$Debug_BgVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgVisible")
	$Debug_ImVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ImVisible")
	$Debug_BgVisible->:=$bgVisible
	$Debug_ImVisible->:=$imVisible
End if 

If (False:C215)
	$viewport_tx:=0
	$viewport_ty:=0
	$viewport_translate:="translate("+Str($viewport_tx)+","+Str($viewport_ty)+")"
	$viewport_transform:=$viewport_translate
	
	SVG SET ATTRIBUTE:C1055($Image->; "viewport"; "transform"; $viewport_transform; \
		"editor:tx"; $viewport_tx; "editor:ty"; $viewport_ty; *)
	
	SVG SET ATTRIBUTE:C1055($BgImage->; "viewport"; "transform"; $viewport_transform; \
		"editor:tx"; $viewport_tx; "editor:ty"; $viewport_ty; *)
	
End if 

SET TIMER:C645(0)
SET CURSOR:C469(0)

If (Version_14_or_later)
	
Else 
	//on v13 the scrollbar move unnecessarily when it is near the edge
	NEditor_DISPLAY_SCROLLBAR  //after get_*_image
End if 