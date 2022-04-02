//%attributes = {"invisible":true}
$IsTracking:=OBJECT Get pointer:C1124(Object named:K67:5; "IsTracking")
$IsResizing:=OBJECT Get pointer:C1124(Object named:K67:5; "IsResizing")
$IsScrolling:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrolling")
$IsZooming:=OBJECT Get pointer:C1124(Object named:K67:5; "IsZooming")
$IsRotating:=OBJECT Get pointer:C1124(Object named:K67:5; "IsRotating")

NEditor_ON_AFTER_RESIZE($IsTracking; $IsResizing; $IsScrolling; $IsZooming; $IsRotating)

NEditor_ON_AFTER_SCROLL($IsTracking; $IsResizing; $IsScrolling; $IsZooming; $IsRotating)

NEditor_ON_AFTER_ZOOM($IsTracking; $IsResizing; $IsScrolling; $IsZooming; $IsRotating)

NEditor_ON_AFTER_ROTATE($IsTracking; $IsResizing; $IsScrolling; $IsZooming; $IsRotating)

If ($IsTracking->=1)
	
	C_LONGINT:C283($x; $y; $b)
	GET MOUSE:C468($x; $y; $b)
	
	C_LONGINT:C283($scrH; $scrV)
	OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
	
	$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")
	$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	
	$MouseX:=$x-$OffsetX->+$scrH
	$MouseY:=$y-$OffsetY->+$scrV
	
	$tool:=NEditor_Get_tool
	
	If ($b=0)
		
		NEditor_MOUSE_TRACKING_END($IsTracking; $IsResizing; $IsScrolling)
		
		If (NEditor_Get_debug_mode)
			$Debug_TimerCount:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_TimerCount")
			$Debug_TimerCount->:=0
		End if 
		
		Case of 
			: ($tool="select")
				
				If (NEditor_SELECT_End($MouseX; $MouseY))
					//force update (bounding variable change from within) by generating event; normally a bad idea...
					//apparently need this during On Timer
					$p:=OBJECT Get pointer:C1124(Object subform container:K67:4)
					$p->:=$p->
				End if 
				
			: ($tool="rect")
				
				If (NEditor_RECT_End($MouseX; $MouseY))
					$p:=OBJECT Get pointer:C1124(Object subform container:K67:4)
					$p->:=$p->
				End if 
				
			: ($tool="line")
				
				If (NEditor_LINE_End($MouseX; $MouseY))
					$p:=OBJECT Get pointer:C1124(Object subform container:K67:4)
					$p->:=$p->
				End if 
				
			: ($tool="circle")
				
				If (NEditor_ELLIPSE_End($MouseX; $MouseY))
					$p:=OBJECT Get pointer:C1124(Object subform container:K67:4)
					$p->:=$p->
				End if 
				
			: ($tool="polyline")
				
				If (NEditor_POLYLINE_End($MouseX; $MouseY))
					$p:=OBJECT Get pointer:C1124(Object subform container:K67:4)
					$p->:=$p->
				End if 
				
			: ($tool="text")
				
				If (NEditor_TEXT_End($MouseX; $MouseY))
					$p:=OBJECT Get pointer:C1124(Object subform container:K67:4)
					$p->:=$p->
				End if 
				
		End case 
		
	Else 
		
		If (NEditor_Get_debug_mode)
			$Debug_TimerCount:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_TimerCount")
			$Debug_TimerCount->:=$Debug_TimerCount->+1
			$Debug_MouseX:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_MouseX")
			$Debug_MouseY:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_MouseY")
			$Debug_MouseX->:=Int:C8($MouseX/$Zoom->)
			$Debug_MouseY->:=Int:C8($MouseY/$Zoom->)
		End if 
		
		Case of 
			: ($tool="select")
				
				NEditor_SELECT_DRAW($MouseX; $MouseY)
				
			: ($tool="rect")
				
				NEditor_RECT_DRAW($MouseX; $MouseY)
				
			: ($tool="line")
				
				NEditor_LINE_DRAW($MouseX; $MouseY)
				
			: ($tool="circle")
				
				NEditor_ELLIPSE_DRAW($MouseX; $MouseY)
				
			: ($tool="polyline")
				
				NEditor_POLYLINE_DRAW($MouseX; $MouseY)
				
			: ($tool="text")
				
				NEditor_TEXT_DRAW($MouseX; $MouseY)
				
		End case 
		
		//REDRAW WINDOW(Current form window)//non composite window flickering in yosemite?
		
	End if 
	
End if 