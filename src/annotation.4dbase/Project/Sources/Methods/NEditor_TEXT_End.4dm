//%attributes = {"invisible":true}
C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $shouldUpdate)

$MouseX:=$1
$MouseY:=$2

$text:=NEditor_Get_current

$shiftDown:=Shift down:C543

NEditor_SET_CURRENT("")

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

C_TEXT:C284($objectId)
DOM GET XML ATTRIBUTE BY NAME:C728($text; "id"; $objectId)

If (($MouseX=$ClickX->) | ($MouseY=$ClickY->))
	
	$class:="class-"+$objectId+"-rect"
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
	
	$class:="class-"+$objectId+"-textArea"
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
	
	DOM REMOVE XML ELEMENT:C869($text)
	$shouldUpdate:=False:C215
	
Else 
	
	C_REAL:C285($width; $height)
	C_REAL:C285($x; $y)
	
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
	
	$width:=$editorWidth
	$height:=$editorHeight
	
	$x:=-$width/2
	$y:=-$height/2
	
	$translate:="translate("+Str($editorTx)+","+Str($editorTy)+")"
	$scale:="scale("+Str($editorSx)+","+Str($editorSy)+")"
	$rotate:="rotate("+Str($editorR)+","+Str($editorCx)+","+Str($editorCy)+")"
	$transform:=$translate+" "+$scale+" "+$rotate
	
	DOM SET XML ATTRIBUTE:C866($text; "transform"; $transform; "editor:x"; $editorX; "editor:y"; $editorY; "editor:width"; $editorWidth; "editor:height"; $editorHeight; "editor:tx"; $editorTx; "editor:ty"; $editorTy; "editor:sx"; $editorSx; "editor:sy"; $editorSy; "editor:cx"; $editorCx; "editor:cy"; $editorCy; "editor:r"; $editorR)
	
	$rect:=DOM Find XML element by ID:C1010($Container->; $objectId+"-rect")
	
	C_REAL:C285($strokeWidth)
	SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-rect"; "stroke-width"; $strokeWidth)
	
	$textArea:=DOM Find XML element by ID:C1010($Container->; $objectId+"-textArea")
	
	DOM SET XML ATTRIBUTE:C866($textArea; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
	DOM SET XML ATTRIBUTE:C866($rect; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
	$textValue:=NEditor_Get_default_text
	NEditor_TEXT_EDIT_SET_VALUE($textArea; $textValue)
	
	C_REAL:C285($lineHeight)
	$lineHeight:=NEditor_Compute_line_height($textArea)
	
	DOM SET XML ATTRIBUTE:C866($textArea; "editor:line-height"; $lineHeight)
	
	$objectType:="text"
	
	$objects:=DOM Find XML element by ID:C1010($Container->; "objects")
	$object:=DOM Create XML element:C865($objects; "editor:object"; "editor:object-id"; $objectId; "editor:object-type"; $objectType)
	
	NEditor_SET_TOOL("select")
	
	NEditor_SELECT_Text($text; $objectId)
	
	NEditor_TOOL_UPDATE
	
	$shouldUpdate:=True:C214
	
End if 

If (Not:C34($shouldUpdate))
	$Image->:=NEditor_Get_layer_image($Container->)
End if 

$0:=$shouldUpdate