//%attributes = {"invisible":true}
C_POINTER:C301($1; $2; $3; $4; $5)

$IsTracking:=$1
$IsResizing:=$2
$IsScrolling:=$3
$IsZooming:=$4
$IsRotating:=$5

If (1=$IsRotating->)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$IsRotating->:=0
	
	$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
	$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
	$BgImage->:=NEditor_Get_background_image($DomBgImage->)
	
	//this will update image
	NEditor_ON_DATA_CHANGE
	
	If (0=$IsTracking->) & (0=$IsResizing->) & (0=$IsZooming->) & (0=$IsScrolling->)
		
		SET TIMER:C645(0)
		
	End if 
	
End if 