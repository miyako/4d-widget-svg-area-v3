$Colors:=OBJECT Get pointer:C1124(Object named:K67:5; "Colors")

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"colors-with-margin.svg"
		
		$DOCUMENT:=DOCUMENT
		READ PICTURE FILE:C678($path; $Colors->)
		DOCUMENT:=$DOCUMENT
		
		$color:=Num:C11(Get window title:C450(Current form window:C827))
		
		If ($color<1)
			$color:=1
		End if 
		
		If ($color>256)
			$color:=256
		End if 
		
		$ColorId:=OBJECT Get pointer:C1124(Object named:K67:5; "ColorId")
		$ColorId->:="color"+Str($color)
		
		SET TIMER:C645(1)
		
	: ($event=On Timer:K2:25)
		
		C_LONGINT:C283($x; $y; $b)
		
		$isReady:=OBJECT Get pointer:C1124(Object named:K67:5; "isReady")
		$ColorId:=OBJECT Get pointer:C1124(Object named:K67:5; "ColorId")
		
		If ($isReady->=0)
			SVG GET ATTRIBUTE:C1056(*; "Colors"; $ColorId->; "x"; $x)
			SVG GET ATTRIBUTE:C1056(*; "Colors"; $ColorId->; "y"; $y)
			SVG GET ATTRIBUTE:C1056(*; "Colors"; $ColorId->; "fill"; $fill)
			SVG SET ATTRIBUTE:C1055(*; "Colors"; "current"; \
				"x"; $x; "y"; $y; "fill"; $fill; \
				"fill-opacity"; 1; "stroke-opacity"; 1)
			$isReady->:=1
		End if 
		
		GET MOUSE:C468($x; $y; $b)
		
		C_LONGINT:C283($l; $t; $r; $b)
		OBJECT GET COORDINATES:C663(*; "Colors"; $l; $t; $r; $b)
		
		$width:=$r-$l
		$height:=$b-$t
		
		$ZoomX:=OBJECT Get pointer:C1124(Object named:K67:5; "ZoomX")
		$ZoomY:=OBJECT Get pointer:C1124(Object named:K67:5; "ZoomY")
		
		$ZoomX->:=$width/162
		$ZoomY->:=$height/162
		
		//top-left is (0,2)
		
		Case of 
			: ($x>=$width)
				//right edge is 161
				$x:=$width-1
			: ($x<0)
				//left edge is 0
				$x:=0
		End case 
		
		Case of 
			: ($y>=$height)
				//bottom edge is 161
				$y:=$height-1
			: ($y<2)
				//top edge is 2
				$y:=2
		End case 
		
		$MouseX:=OBJECT Get pointer:C1124(Object named:K67:5; "MouseX")
		$MouseY:=OBJECT Get pointer:C1124(Object named:K67:5; "MouseY")
		
		$MouseX->:=$x
		$MouseY->:=$y
		
		$id:=SVG Find element ID by coordinates:C1054(*; "Colors"; $x/$ZoomX->; $y/$ZoomY->)
		
		If (Length:C16($id)#0)
			
			If ($id="current")
				$id:=$ColorId->
			End if 
			
			If ($id#"select")
				
				$SelectedColorId:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectedColorId")
				
				If ($id#$SelectedColorId->)
					
					$SelectedColorId->:=$id
					
					C_TEXT:C284($fill)
					SVG GET ATTRIBUTE:C1056(*; "Colors"; $id; "x"; $x)
					SVG GET ATTRIBUTE:C1056(*; "Colors"; $id; "y"; $y)
					SVG GET ATTRIBUTE:C1056(*; "Colors"; $id; "fill"; $fill)
					
					SVG SET ATTRIBUTE:C1055(*; "Colors"; "select"; \
						"x"; $x; "y"; $y; "fill"; $fill; \
						"fill-opacity"; 1; "stroke-opacity"; 1)
					
				End if 
				
			End if 
			
		End if 
		
	: ($event=On Unload:K2:2)
		
		SET TIMER:C645(0)
		
End case 