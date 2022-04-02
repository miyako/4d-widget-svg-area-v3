//%attributes = {"invisible":true}
C_POINTER:C301($1; $2; $3; $4; $5)

$IsTracking:=$1
$IsResizing:=$2
$IsScrolling:=$3
$IsZooming:=$4
$IsRotating:=$5

If (1=$IsZooming->)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
	$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
	
	$IsZooming->:=0
	
	$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
	$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
	
	$Image->:=NEditor_Get_layer_image($Container->)
	$BgImage->:=NEditor_Get_background_image($DomBgImage->)
	
	$ScrollH:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollH")
	$ScrollV:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollV")
	$scrH:=$ScrollH->
	$scrV:=$ScrollV->
	
	NEditor_DISPLAY_SCROLLBAR(True:C214)
	
	OBJECT SET SCROLL POSITION:C906(*; "Image"; $scrV; $scrH; *)
	OBJECT SET SCROLL POSITION:C906(*; "BgImage"; $scrV; $scrH; *)
	
	NEditor_RESIZE($scrV; $scrH)
	
	If (0=$IsTracking->) & (0=$IsScrolling->) & (0=$IsResizing->) & (0=$IsRotating->)
		
		SET TIMER:C645(0)
		
	End if 
	
End if 