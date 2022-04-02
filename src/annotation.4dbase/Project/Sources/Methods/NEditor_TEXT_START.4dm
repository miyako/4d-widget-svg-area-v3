//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$AutoFont:=OBJECT Get pointer:C1124(Object named:K67:5; "AutoFont")
$fontName:=$AutoFont->
$fontFamily:=Font_get_family_name($fontName)
$fontSize:=20  //9
$fontStyle:="normal"
$fontWeight:="normal"
$textAlign:="start"
$textDecoration:="none"
$displayAlign:="before"

If (Length:C16($Container->)#0)
	
	C_BOOLEAN:C305($shouldRedraw)
	
	$MouseX:=$1
	$MouseY:=$2
	
	$select:=NEditor_SELECT_Get
	
	If (Length:C16($select)#0)
		DOM REMOVE XML ELEMENT:C869($select)
		NEditor_SELECT_SET("")
	End if 
	
	$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
	
	If (NEditor_SELECT_Clear($Container->))
		$SelectionChanged->:=1
	Else 
		$SelectionChanged->:=0
	End if 
	
	$objects:=DOM Find XML element by ID:C1010($Container->; "objects")
	$count:=DOM Count XML elements:C726($objects; "editor:object")
	
	$objectId:="object-"+String:C10($count+1)
	$classRect:="class-"+$objectId+"-rect"
	
	C_REAL:C285($x; $y; $width; $height)
	$x:=0
	$y:=0
	$width:=0
	$height:=0
	
	C_REAL:C285($editorWidth; $editorHeight; $editorX; $editorY)
	$editorX:=0
	$editorY:=0
	$editorWidth:=0
	$editorHeight:=0
	
	C_REAL:C285($editorTx; $editorTy)
	$editorTx:=$MouseX
	$editorTy:=$MouseY
	
	C_REAL:C285($editorSx; $editorSy)
	$editorSx:=1
	$editorSy:=1
	
	C_REAL:C285($editorCx; $editorCy; $editorR)
	$editorR:=0
	
	$translate:="translate("+Str($editorTx)+","+Str($editorTy)+")"
	$scale:="scale("+Str($editorSx)+","+Str($editorSy)+")"
	$rotate:="rotate("+Str($editorR)+","+Str($editorCx)+","+Str($editorCy)+")"
	$transform:=$translate+" "+$scale+" "+$rotate
	
	$objectType:="text"
	
	$annotation:=DOM Find XML element by ID:C1010($Container->; "annotation")
	
	$g:=DOM Create XML element:C865($annotation; "g"; "id"; $objectId; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "editor:word-wrap"; True:C214; "editor:x"; $editorX; "editor:y"; $editorY; "editor:width"; $editorWidth; "editor:height"; $editorHeight; "editor:tx"; $editorTx; "editor:ty"; $editorTy; "editor:sx"; $editorSx; "editor:sy"; $editorSy; "editor:cx"; $editorCx; "editor:cy"; $editorCy; "editor:r"; $editorR; "transform"; $transform)
	
	$fillColorIndex:=NEditor_Get_default_fill
	$fillColor:=Hex(Color($fillColorIndex))
	
	If ($fillColorIndex=0)
		$fillOpacity:=0
	Else 
		$fillOpacity:=NEditor_Get_default_f_opacity/100
	End if 
	
	$strokeColorIndex:=NEditor_Get_default_stroke
	$strokeColor:=Hex(Color($strokeColorIndex))
	
	If ($strokeColorIndex=0)
		$strokeOpacity:=0
	Else 
		$strokeOpacity:=NEditor_Get_default_opacity/100
	End if 
	
	$strokeWidth:=NEditor_Get_default_width
	
	$defs:=DOM Find XML element by ID:C1010($Container->; "defs")
	
	$style:="."+$classRect+" {fill:"+$fillColor+"; fill-opacity:"+Str($fillOpacity)+"; stroke:"+$strokeColor+"; stroke-width:"+Str($strokeWidth)+"; stroke-opacity:"+Str($strokeOpacity)+"; stroke-linejoin:"+"miter"+"}"
	
	DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "id"; $classRect); $style; *)  //CDATA
	
	$classTextArea:="class-"+$objectId+"-textArea"
	
	$fillOpacity:=1  //no transparency for text
	
	$style:="."+$classTextArea+" {fill:"+$strokeColor+"; fill-opacity:"+Str($fillOpacity)+"; stroke:"+$strokeColor+"; stroke-width:"+Str($strokeWidth)+"; stroke-opacity:"+Str($strokeOpacity)+"; font-size:"+Str($fontSize)+"; text-decoration:"+$textDecoration+"; text-align:"+$textAlign+"; display-align:"+$displayAlign+"; font-weight:"+$fontWeight+"; font-style:"+$fontStyle+"; font-family:"+$fontFamily+";}"
	
	DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "id"; $classTextArea); $style; *)  //CDATA
	
	//stroke outside the text
	$rect:=DOM Create XML element:C865($g; "rect"; "id"; $objectId+"-rect"; "class"; $classRect; "x"; $x-($strokeWidth/2); "y"; $y-($strokeWidth/2); "width"; $width+$strokeWidth; "height"; $height+$strokeWidth; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "shape-rendering"; "geometricPrecision")
	
	$textArea:=DOM Create XML element:C865($g; "textArea"; "id"; $objectId+"-textArea"; "class"; $classTextArea; "x"; $x; "y"; $y; "width"; $width; "height"; $height; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "text-rendering"; "geometricPrecision")
	
	$shouldRedraw:=True:C214
	
	NEditor_SET_CURRENT($g)
	
	NEditor_MOUSE_TRACKING_START($shouldRedraw)
	
	If ($shouldRedraw)
		$Image->:=NEditor_Get_layer_image($Container->)
	End if 
	
End if 