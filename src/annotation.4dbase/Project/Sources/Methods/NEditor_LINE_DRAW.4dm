//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

$MouseX:=$1
$MouseY:=$2

$line:=NEditor_Get_current

$shiftDown:=Shift down:C543

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

C_REAL:C285($width; $height)
C_REAL:C285($x1; $y1; $x2; $y2)

$width:=Abs:C99($MouseX-$ClickX->)
$height:=Abs:C99($MouseY-$ClickY->)

C_REAL:C285($editorTx; $editorTy)
C_REAL:C285($editorSx; $editorSy)
C_REAL:C285($editorCx; $editorCy; $editorR)

$editorCx:=0
$editorCy:=0
$editorR:=0
$editorSx:=1
$editorSy:=1


If ($shiftDown) & (($width=0) | ($height=0))
	$shiftDown:=False:C215
End if 

If ($shiftDown)
	
	If ($width>$height)
		$width:=$height
	Else 
		$height:=$width
	End if 
	
	$editorTx:=(($width/2)+$ClickX->)/$Zoom->
	$editorTy:=(($height/2)+$ClickY->)/$Zoom->
	
	Case of 
		: ($MouseX>$ClickX->) & ($MouseY>$ClickY->)  //br
			
		: ($MouseX<$ClickX->) & ($MouseY<$ClickY->)  //tl
			$editorTx:=$editorTx-($width/$Zoom->)
			$editorTy:=$editorTy-($height/$Zoom->)
		: ($MouseX>$ClickX->) & ($MouseY<$ClickY->)  //tr
			$editorTy:=$editorTy-($height/$Zoom->)
		: ($MouseX<$ClickX->) & ($MouseY>$ClickY->)  //bl
			$editorTx:=$editorTx-($width/$Zoom->)
	End case 
	
Else 
	
	If ($MouseX>$ClickX->)
		$editorTx:=(($width/2)+$ClickX->)/$Zoom->
	Else 
		$editorTx:=(($width/2)+$MouseX)/$Zoom->
	End if 
	
	If ($MouseY>$ClickY->)
		$editorTy:=(($height/2)+$ClickY->)/$Zoom->
	Else 
		$editorTy:=(($height/2)+$MouseY)/$Zoom->
	End if 
	
End if 

C_REAL:C285($editorWidth; $editorHeight)
$editorWidth:=$width/$Zoom->
$editorHeight:=$height/$Zoom->

$translate:="translate("+Str($editorTx)+","+Str($editorTy)+")"
$scale:="scale("+Str($editorSx)+","+Str($editorSy)+")"
$rotate:="rotate("+Str($editorR)+","+Str($editorCx)+","+Str($editorCy)+")"
$transform:=$translate+" "+$scale+" "+$rotate

Case of 
	: ($MouseX>$ClickX->) & ($MouseY>$ClickY->)  //br
		
		$x1:=-$editorWidth/2
		$y1:=-$editorHeight/2
		$x2:=$editorWidth/2
		$y2:=$editorHeight/2
		
	: ($MouseX>$ClickX->) & ($MouseY<$ClickY->)  //tr
		
		$x1:=-$editorWidth/2
		$y1:=$editorHeight/2
		$x2:=$editorWidth/2
		$y2:=-$editorHeight/2
		
	: ($MouseX<$ClickX->) & ($MouseY>$ClickY->)  //bl
		
		$x1:=$editorWidth/2
		$y1:=-$editorHeight/2
		$x2:=-$editorWidth/2
		$y2:=$editorHeight/2
		
	: ($MouseX<$ClickX->) & ($MouseY<$ClickY->)  //tl
		
		$x1:=$editorWidth/2
		$y1:=$editorHeight/2
		$x2:=-$editorWidth/2
		$y2:=-$editorHeight/2
		
	: ($MouseX=$ClickX->)  //veritical 
		
		Case of 
			: ($MouseY<$ClickY->)  //bottom to top
				
				$x1:=0
				$y1:=$editorHeight/2
				$x2:=0
				$y2:=-$editorHeight/2
				
			: ($MouseY>$ClickY->)  //top to bottom
				
				$x1:=0
				$y1:=-$editorHeight/2
				$x2:=0
				$y2:=$editorHeight/2
				
			Else 
				
				$x1:=0
				$y1:=0
				$x2:=0
				$y2:=0
				
		End case 
		
	: ($MouseY=$ClickY->)  //horizontal
		
		Case of 
			: ($MouseX<$ClickX->)  //right to left
				
				$x1:=$editorWidth/2
				$y1:=0
				$x2:=-$editorWidth/2
				$y2:=0
				
			: ($MouseX>$ClickX->)  //left to right
				
				$x1:=-$editorWidth/2
				$y1:=0
				$x2:=$editorWidth/2
				$y2:=0
				
			Else 
				
				$x1:=0
				$y1:=0
				$x2:=0
				$y2:=0
				
		End case 
		
End case 

DOM GET XML ATTRIBUTE BY NAME:C728($line; "id"; $id)

SVG SET ATTRIBUTE:C1055($Image->; $id; "x1"; $x1; "y1"; $y1; "x2"; $x2; "y2"; $y2; "transform"; $transform)