//%attributes = {"invisible":true}
$IsScrolling:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrolling")

If ($IsScrolling->=0)
	
	NEditor_TEXT_EDIT_End
	
	$IsScrolling->:=1
	
	$IsTracking:=OBJECT Get pointer:C1124(Object named:K67:5; "IsTracking")
	
	If (0=$IsTracking->)
		NEditor_DISPLAY_BACKGROUND(False:C215)
	Else 
		NEditor_DISPLAY_BACKGROUND(True:C214)
	End if 
	
	//If (NEditor_Get_debug_mode )
	//SVG SET ATTRIBUTE(*;"Image";"show";"visibility";"hidden")
	//$Container:=OBJECT Get pointer(Object subform container)
	//$show:=DOM Find XML element by ID($Container->;"show")
	//DOM SET XML ATTRIBUTE($show;"visibility";"hidden")
	//end if
	
	SET TIMER:C645(NEditor_Get_timer_for_event)
	
End if 

NEditor_ON_RESIZE