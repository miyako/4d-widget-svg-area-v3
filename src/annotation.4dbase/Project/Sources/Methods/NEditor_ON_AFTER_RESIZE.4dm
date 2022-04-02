//%attributes = {"invisible":true}
C_POINTER:C301($1; $2; $3; $4; $5)

$IsTracking:=$1
$IsResizing:=$2
$IsScrolling:=$3
$IsZooming:=$4
$IsRotating:=$5

If (1=$IsResizing->)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
	$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
	
	$IsResizing->:=0
	
	NEditor_DISPLAY_BACKGROUND(1=$IsTracking->)
	
	NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
	
	$Image->:=NEditor_Get_layer_image($Container->)
	$BgImage->:=NEditor_Get_background_image($DomBgImage->)
	
	NEditor_DISPLAY_SCROLLBAR  //after get_*_image
	
	If (0=$IsTracking->) & (0=$IsScrolling->) & (0=$IsZooming->) & (0=$IsRotating->)
		
		SET TIMER:C645(0)
		
	End if 
	
End if 