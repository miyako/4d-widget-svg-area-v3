//%attributes = {"invisible":true}
C_LONGINT:C283(MouseX; MouseY)
C_LONGINT:C283($x; $y; $b)
C_REAL:C285($MouseX; $MouseY)

If (Not:C34(Contextual click:C713))
	
	NEditor_SET_OFFSET
	
	//because the image does not take focus from the text edit
	NEditor_TEXT_EDIT_End
	
	If (MouseX#-1) & (MouseY#-1)
		
		$tool:=NEditor_Get_tool
		
		$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
		$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
		$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
		
		GET MOUSE:C468($x; $y; $b)
		
		C_LONGINT:C283($scrH; $scrV)
		OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
		
		$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")
		$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")
		
		$MouseX:=$x-$OffsetX->+$scrH
		$MouseY:=$y-$OffsetY->+$scrV
		
		$OffsetH:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetH")
		$OffsetV:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetV")
		
		$ClickX->:=$MouseX
		$ClickY->:=$MouseY
		
		$MouseX:=$MouseX/$Zoom->
		$MouseY:=$MouseY/$Zoom->
		
		//MouseX,MouseY might be rounded
		//$ClickX->:=MouseX
		//$ClickY->:=MouseY
		
		If (NEditor_Get_debug_mode)
			$Debug_ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ClickX")
			$Debug_ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ClickY")
			$Debug_ClickX->:=$ClickX->
			$Debug_ClickY->:=$ClickY->
		End if 
		
		Case of 
			: ($tool="select")
				
				NEditor_EDIT_START($MouseX; $MouseY)
				
			: ($tool="rect")
				
				NEditor_RECT_START($MouseX; $MouseY)
				
			: ($tool="line")
				
				NEditor_LINE_START($MouseX; $MouseY)
				
			: ($tool="circle")
				
				NEditor_ELLIPSE_START($MouseX; $MouseY)
				
			: ($tool="polyline")
				
				NEditor_POLYLINE_START($MouseX; $MouseY)
				
			: ($tool="text")
				
				NEditor_TEXT_START($MouseX; $MouseY)
				
		End case 
		
		CALL SUBFORM CONTAINER:C1086(-112)
		
	End if 
	
End if 