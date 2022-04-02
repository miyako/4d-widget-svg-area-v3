//%attributes = {"invisible":true}
C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $shouldUpdate)

$MouseX:=$1
$MouseY:=$2

$polyline:=NEditor_Get_current

NEditor_SET_CURRENT("")

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
//$Zoom:=OBJECT Get pointer(Object named;"Zoom")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

$PointX:=OBJECT Get pointer:C1124(Object named:K67:5; "PointX")
$PointY:=OBJECT Get pointer:C1124(Object named:K67:5; "PointY")

C_TEXT:C284($objectId)
DOM GET XML ATTRIBUTE BY NAME:C728($polyline; "id"; $objectId)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "points"; $points)

If ($points="0,0")
	
	$class:="class-"+$objectId
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
	DOM REMOVE XML ELEMENT:C869($polyline)
	
	$markerId:="marker-"+$objectId
	$markerClass:="class-"+$markerId
	$markerStartId:="marker-start-"+$objectId
	$markerEndId:="marker-end-"+$objectId
	
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerClass))
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerStartId))
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $markerEndId))
	
	$shouldUpdate:=False:C215
	
Else 
	
	ARRAY REAL:C219($xx; 0)
	ARRAY REAL:C219($yy; 0)
	C_LONGINT:C283($p)
	$p:=1
	C_REAL:C285($x; $y)
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	While (Match regex:C1019("(-?(?:\\d|\\.)+),(-?(?:\\d|\\.)+)"; $points; $p; $pos; $len))
		$x:=Num:C11(Substring:C12($points; $pos{1}; $len{1}); ".")
		$y:=Num:C11(Substring:C12($points; $pos{2}; $len{2}); ".")
		APPEND TO ARRAY:C911($xx; $x)
		APPEND TO ARRAY:C911($yy; $y)
		$p:=$pos{2}+$len{2}
	End while 
	C_REAL:C285($x1; $x2; $y1; $y2)
	If (Size of array:C274($xx)#0)
		$x1:=Min:C4($xx)
		$y1:=Min:C4($yy)
		$x2:=Max:C3($xx)
		$y2:=Max:C3($yy)
	Else 
		$x1:=0
		$y1:=0
		$x2:=0
		$y2:=0
	End if 
	
	//this is the rect
	C_REAL:C285($width; $height)
	$width:=Abs:C99($x2-$x1)
	$height:=Abs:C99($y2-$y1)
	
	//now offset all the points so that the centre is 0,0
	C_REAL:C285($offsetW; $offsetH)
	$offsetW:=-$x1-($width/2)
	$offsetH:=-$y1-($height/2)
	CLEAR VARIABLE:C89($points)
	For ($p; 1; Size of array:C274($xx))
		$xx{$p}:=$xx{$p}+$offsetW
		$yy{$p}:=$yy{$p}+$offsetH
		$points:=$points+Str($xx{$p})+","+Str($yy{$p})+" "
	End for 
	
	//to counter the offset we need a new tx,ty
	C_REAL:C285($editorTx; $editorTy)
	C_REAL:C285($editorSx; $editorSy)
	C_REAL:C285($editorCx; $editorCy; $editorR)
	$editorCx:=0
	$editorCy:=0
	$editorR:=0
	$editorSx:=1
	$editorSy:=1
	
	SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:tx"; $editorTx)
	SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:ty"; $editorTy)
	
	$editorTx:=$editorTx-Number((Cos:C18(($editorR)*Degree:K30:2)*($offsetW*$editorSx))-(Cos:C18((90-$editorR)*Degree:K30:2)*($offsetH*$editorSy)))
	$editorTy:=$editorTy-Number((Sin:C17(($editorR)*Degree:K30:2)*($offsetW*$editorSx))+(Sin:C17((90-$editorR)*Degree:K30:2)*($offsetH*$editorSy)))
	
	C_REAL:C285($editorWidth; $editorHeight; $editorX; $editorY)
	$editorWidth:=$width
	$editorHeight:=$height
	$editorX:=-($editorWidth/2)
	$editorY:=-($editorHeight/2)
	
	$translate:="translate("+Str($editorTx)+","+Str($editorTy)+")"
	$scale:="scale("+Str($editorSx)+","+Str($editorSy)+")"
	$rotate:="rotate("+Str($editorR)+","+Str($editorCx)+","+Str($editorCy)+")"
	$transform:=$translate+" "+$scale+" "+$rotate
	
	DOM SET XML ATTRIBUTE:C866($polyline; "points"; $points; "transform"; $transform; "editor:x"; $editorX; "editor:y"; $editorY; "editor:width"; $editorWidth; "editor:height"; $editorHeight; "editor:tx"; $editorTx; "editor:ty"; $editorTy; "editor:sx"; $editorSx; "editor:sy"; $editorSy; "editor:cx"; $editorCx; "editor:cy"; $editorCy; "editor:r"; $editorR)
	
	$objectType:="polyline"
	
	$objects:=DOM Find XML element by ID:C1010($Container->; "objects")
	$object:=DOM Create XML element:C865($objects; "editor:object"; "editor:object-id"; $objectId; "editor:object-type"; $objectType)
	
	NEditor_TOOL_UPDATE
	
	$shouldUpdate:=True:C214
	
End if 

If (Not:C34($shouldUpdate))
	$Image->:=NEditor_Get_layer_image($Container->)
End if 

$0:=$shouldUpdate