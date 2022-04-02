//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

$MouseX:=$1
$MouseY:=$2

$polyline:=NEditor_Get_current

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

$PointX:=OBJECT Get pointer:C1124(Object named:K67:5; "PointX")
$PointY:=OBJECT Get pointer:C1124(Object named:K67:5; "PointY")

C_REAL:C285($x; $y)
$x:=($MouseX-$ClickX->)/$Zoom->
$y:=($MouseY-$ClickY->)/$Zoom->

DOM GET XML ATTRIBUTE BY NAME:C728($polyline; "id"; $id)
C_TEXT:C284($editorPoints; $points)

C_BOOLEAN:C305($shiftDown; $editorShiftDown; $didShiftToggle; $didMove)
SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:shift-down"; $editorShiftDown)
C_TEXT:C284($startPoint)
SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:start-point"; $startPoint)
$shiftDown:=Shift down:C543
$didShiftToggle:=($shiftDown#$editorShiftDown)
$didMove:=(($PointX->#$x) | ($PointY->#$y))

If ($didMove)
	
	$PointX->:=$x
	$PointY->:=$y
	
End if 

If ($didShiftToggle)
	
	//no check for movement, always update
	
	If ($editorShiftDown)  //line mode to polyline mode
		
		//validate the line; also update start point and editor points
		
		If ($startPoint="")
			$editorPoints:="0,0 "+Str($x)+","+Str($y)
		Else 
			SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:points"; $editorPoints)
			$editorPoints:=$editorPoints+" "+Str($x)+","+Str($y)
		End if 
		
		$startPoint:=Str($x)+","+Str($y)
		
		SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:start-point"; $startPoint; "points"; $editorPoints; "editor:points"; $editorPoints; "editor:shift-down"; $shiftDown; *)
		
	Else   //polyline mode to line mode
		
		//cancel the polyline portion by using editor points (the polyline up to start point)
		
		If ($startPoint="")
			$points:="0,0 "+Str($x)+","+Str($y)
		Else 
			SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:points"; $editorPoints)
			$points:=$editorPoints+" "+Str($x)+","+Str($y)
		End if 
		SVG SET ATTRIBUTE:C1055($Image->; $id; "points"; $points; "editor:shift-down"; $shiftDown; *)
		
	End if 
	
Else 
	
	//did not toggle
	
	If ($editorShiftDown)  //line mode
		
		If ($didMove)
			
			If ($startPoint="")
				$points:="0,0 "+Str($x)+","+Str($y)
			Else 
				SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:points"; $editorPoints)
				$points:=$editorPoints+" "+$startPoint+" "+Str($x)+","+Str($y)
			End if 
			
			SVG SET ATTRIBUTE:C1055($Image->; $id; "points"; $points; *)
			
		End if 
		
	Else   //polyline mode
		
		//only update editor points; do not touch editor points or start point
		SVG GET ATTRIBUTE:C1056($Image->; $id; "points"; $points)
		
		If ($didMove)
			
			$points:=$points+" "+Str($x)+","+Str($y)
			
		End if 
		
		SVG SET ATTRIBUTE:C1055($Image->; $id; "points"; $points; *)
		
	End if 
End if 