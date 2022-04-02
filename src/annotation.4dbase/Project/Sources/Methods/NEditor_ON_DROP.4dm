//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

If (Not:C34(Is nil pointer:C315($Container)))
	If (Length:C16($Container->)#0)
		
		GET MOUSE:C468($x; $y; $b)
		
		C_LONGINT:C283($scrH; $scrV)
		OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
		
		$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")
		$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")
		
		$MouseX:=$x-$OffsetX->+$scrH
		$MouseY:=$y-$OffsetY->+$scrV
		
		Case of 
			: (NEditor_Drop_image($MouseX; $MouseY))
				
			: (NEditor_TEXT_Create($MouseX; $MouseY))
				
			: (NEditor_IMAGE_Create($MouseX; $MouseY))
				
			Else 
				
		End case 
		
		SET CURSOR:C469(0)  //to cancel the current cursor (general)
		
		C_LONGINT:C283($0)
		$0:=-1  //to cancel the current cursor (text)
		
	End if 
End if 