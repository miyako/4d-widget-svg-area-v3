//%attributes = {"invisible":true}
C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $shouldUpdate)

$MouseX:=$1
$MouseY:=$2

$line:=NEditor_Get_current

$shiftDown:=Shift down:C543

NEditor_SET_CURRENT("")

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

C_TEXT:C284($objectId)
DOM GET XML ATTRIBUTE BY NAME:C728($line; "id"; $objectId)

If (($MouseX=$ClickX->) & ($MouseY=$ClickY->))
	
	$class:="class-"+$objectId
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
	DOM REMOVE XML ELEMENT:C869($line)
	
	$markerId:="marker-"+$objectId
	$markerClass:="class-"+$markerId
	$markerStartId:="marker-start-"+$objectId
	$markerEndId:="marker-end-"+$objectId
	
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerClass))
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerStartId))
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerEndId))
	
	$shouldUpdate:=False:C215
	
Else 
	
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
	
	C_REAL:C285($editorX; $editorY)
	$editorX:=-($editorWidth/2)
	$editorY:=-($editorHeight/2)
	
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
	
	If ($x1>$x2)
		$dx:="left"
	Else 
		$dx:="right"
	End if 
	
	If ($y1>$y2)
		$dy:="up"
	Else 
		$dy:="down"
	End if 
	
	DOM SET XML ATTRIBUTE:C866($line; "x1"; $x1; "y1"; $y1; "x2"; $x2; "y2"; $y2; "transform"; $transform; "editor:dx"; $dx; "editor:dy"; $dy; "editor:x"; $editorX; "editor:y"; $editorY; "editor:width"; $editorWidth; "editor:height"; $editorHeight; "editor:tx"; $editorTx; "editor:ty"; $editorTy; "editor:sx"; $editorSx; "editor:sy"; $editorSy; "editor:cx"; $editorCx; "editor:cy"; $editorCy; "editor:r"; $editorR)
	
	$objectType:="line"
	
	$objects:=DOM Find XML element by ID:C1010($Container->; "objects")
	$object:=DOM Create XML element:C865($objects; "editor:object"; "editor:object-id"; $objectId; "editor:object-type"; $objectType)
	
	NEditor_TOOL_UPDATE
	
	$shouldUpdate:=True:C214
	
End if 

If (Not:C34($shouldUpdate))
	$Image->:=NEditor_Get_layer_image($Container->)
End if 

$0:=$shouldUpdate