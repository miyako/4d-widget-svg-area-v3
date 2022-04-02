//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

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
	$class:="class-"+$objectId
	
	$points:="0,0"
	
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
	
	$markerId:="marker-"+$objectId
	$markerClass:="class-"+$markerId
	$editorMarkerStartId:="marker-start-"+$objectId
	$editorMarkerEndId:="marker-end-"+$objectId
	$marker:=NEditor_Get_default_marker
	
	C_TEXT:C284($markerStartId; $markerEndId)
	
	Case of 
		: ($marker="none")
			$markerStartId:=""
			$markerEndId:=""
		: ($marker="both")
			$markerStartId:="url(#"+$editorMarkerStartId+")"
			$markerEndId:="url(#"+$editorMarkerEndId+")"
		: ($marker="start")
			$markerStartId:="url(#"+$editorMarkerStartId+")"
			$markerEndId:=""
		: ($marker="end")
			$markerStartId:=""
			$markerEndId:="url(#"+$editorMarkerEndId+")"
	End case 
	
	$objectType:="polyline"
	
	$annotation:=DOM Find XML element by ID:C1010($Container->; "annotation")
	
	$polyline:=DOM Create XML element:C865($annotation; "polyline"; "id"; $objectId; "class"; $class; "points"; $points; "transform"; $transform; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "editor:x"; $editorX; "editor:y"; $editorY; "editor:width"; $editorWidth; "editor:height"; $editorHeight; "editor:tx"; $editorTx; "editor:ty"; $editorTy; "editor:sx"; $editorSx; "editor:sy"; $editorSy; "editor:cx"; $editorCx; "editor:cy"; $editorCy; "editor:r"; $editorR; "editor:marker"; $marker; "marker"; $marker; "editor:marker-start-id"; $editorMarkerStartId; "editor:marker-end-id"; $editorMarkerEndId; "marker-start"; $markerStartId; "marker-end"; $markerEndId; "shape-rendering"; "geometricPrecision")
	
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
	
	$style:="."+$class+" {fill:"+$fillColor+"; fill-opacity:"+Str($fillOpacity)+"; stroke:"+$strokeColor+"; stroke-width:"+Str($strokeWidth)+"; stroke-opacity:"+Str($strokeOpacity)+";}"
	
	DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "editor:style-type"; "object"; "id"; $class); $style; *)  //CDATA
	
	//!class must appear before marker in defs
	
	$markerStyle:="."+$markerClass+" {fill:"+$strokeColor+"; fill-opacity:"+Str($strokeOpacity)+"; }"
	
	DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "editor:object-id"; $objectId; "id"; $markerClass); $markerStyle; *)  //CDATA
	
	$marker:=DOM Create XML element:C865($defs; "marker"; "id"; $editorMarkerStartId; "editor:object-id"; $objectId; "viewBox"; "0 0 10 10"; "class"; $markerClass; "refX"; "0"; "refY"; 5; "markerWidth"; 6; "markerHeight"; 6; "orient"; "auto")
	$markerPath:=DOM Create XML element:C865($marker; "path"; "d"; "M -5 5 L 5 10 L 5 0 z")
	
	$marker:=DOM Create XML element:C865($defs; "marker"; "id"; $editorMarkerEndId; "editor:object-id"; $objectId; "viewBox"; "0 0 10 10"; "class"; $markerClass; "refX"; "0"; "refY"; 5; "markerWidth"; 6; "markerHeight"; 6; "orient"; "auto")
	$markerPath:=DOM Create XML element:C865($marker; "path"; "d"; "M -5 0 L 5 5 L -5 10 z")
	
	$shouldRedraw:=True:C214
	
	NEditor_SET_CURRENT($polyline)
	
	$PointX:=OBJECT Get pointer:C1124(Object named:K67:5; "PointX")
	$PointY:=OBJECT Get pointer:C1124(Object named:K67:5; "PointY")
	
	$PointX->:=0
	$PointY->:=0
	
	NEditor_MOUSE_TRACKING_START($shouldRedraw)
	
	If ($shouldRedraw)
		$Image->:=NEditor_Get_layer_image($Container->)
	End if 
	
End if 
