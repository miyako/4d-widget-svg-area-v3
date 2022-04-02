//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $isAccepted)

$MouseX:=$1
$MouseY:=$2

If ($MouseX>0) & ($MouseY>0)
	
	C_REAL:C285($documentWidth; $documentHeight)
	$sizeDom:=DOM Find XML element by ID:C1010($Container->; "size")
	DOM GET XML ATTRIBUTE BY NAME:C728($sizeDom; "width"; $documentWidth)
	DOM GET XML ATTRIBUTE BY NAME:C728($sizeDom; "height"; $documentHeight)
	
	If (($MouseX/$Zoom->)<$documentWidth) & (($MouseY/$Zoom->)<$documentHeight)
		
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
		
		//paste image
		C_PICTURE:C286($picture)
		GET PICTURE FROM PASTEBOARD:C522($picture)
		
		$size:=Picture size:C356($picture)
		
		If ($size#0)
			
			C_REAL:C285($imageWidth; $imageHeight)
			PICTURE PROPERTIES:C457($picture; $imageWidth; $imageHeight)
			
			C_REAL:C285($editorWidth; $editorHeight; $editorX; $editorY)
			$editorWidth:=$imageWidth
			$editorHeight:=$imageHeight
			$editorX:=-($editorWidth/2)
			$editorY:=-($editorHeight/2)
			
			C_REAL:C285($imageSize; $imageScale)
			$imageScale:=1
			
			If ($imageWidth>$documentWidth)
				$imageScale:=$documentWidth/$imageWidth
			End if 
			
			$imageWidth:=$imageWidth*$imageScale
			$imageHeight:=$imageHeight*$imageScale
			
			If ($imageHeight>$documentHeight)
				$imageScale:=$documentHeight/$imageHeight
			End if 
			
			$imageWidth:=$imageWidth*$imageScale
			$imageHeight:=$imageHeight*$imageScale
			
			C_REAL:C285($x; $y; $width; $height)
			$x:=-($imageWidth/2)
			$y:=-($imageHeight/2)
			$width:=$imageWidth
			$height:=$imageHeight
			
			$objects:=DOM Find XML element by ID:C1010($Container->; "objects")
			$count:=DOM Count XML elements:C726($objects; "editor:object")
			
			$objectId:="object-"+String:C10($count+1)
			$classRect:="class-"+$objectId+"-rect"
			
			
			
			
			
			
			
			
			
			
			
			C_REAL:C285($editorTx; $editorTy)
			$editorTx:=$MouseX/$Zoom->
			$editorTy:=$MouseY/$Zoom->
			
			C_REAL:C285($editorSx; $editorSy)
			$editorSx:=1
			$editorSy:=1
			
			C_REAL:C285($editorCx; $editorCy; $editorR)
			$editorR:=0
			
			$translate:="translate("+Str($editorTx)+","+Str($editorTy)+")"
			$scale:="scale("+Str($editorSx)+","+Str($editorSy)+")"
			$rotate:="rotate("+Str($editorR)+","+Str($editorCx)+","+Str($editorCy)+")"
			$transform:=$translate+" "+$scale+" "+$rotate
			
			$objectType:="image"
			
			$annotation:=DOM Find XML element by ID:C1010($Container->; "annotation")
			
			$newObject:=DOM Create XML element:C865($annotation; "g"; "id"; $objectId; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "editor:word-wrap"; True:C214; "editor:x"; $x; "editor:y"; $y; "editor:width"; $width; "editor:height"; $height; "editor:tx"; $editorTx; "editor:ty"; $editorTy; "editor:sx"; $editorSx; "editor:sy"; $editorSy; "editor:cx"; $editorCx; "editor:cy"; $editorCy; "editor:r"; $editorR; "transform"; $transform)
			
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
			
			C_BLOB:C604($imageBlob)
			PICTURE TO BLOB:C692($picture; $imageBlob; ".png")
			$imageSignature:=Generate digest:C1147($imageBlob; SHA1 digest:K66:2)
			BASE64 ENCODE:C895($imageBlob)
			
			$imageData:="data:image/png;base64,"+Convert to text:C1012($imageBlob; "us-ascii")
			
			$preserveAspectRatio:="xMidYMid"
			
			$imageRendering:=NEditor_Get_image_rendering
			
			$image:=DOM Create XML element:C865($defs; "image"; "id"; $objectId+"-data"; "width"; $width; "height"; $height; "editor:size"; $size; "editor:object-id"; $objectId; "editor:object-type"; $objectType; "preserveAspectRatio"; $preserveAspectRatio; "xlink:href"; $imageData; "editor:signature"; $imageSignature; "editor:width"; $imageWidth; "editor:height"; $imageHeight; "xlink:href"; $imageData; "image-rendering"; $imageRendering)
			
			$rect:=DOM Create XML element:C865($newObject; "rect"; "id"; $objectId+"-rect"; "class"; $classRect; "x"; $x; "y"; $y; "width"; $width; "height"; $height; "editor:object-type"; $objectType; "editor:object-id"; $objectId; "shape-rendering"; "geometricPrecision")
			
			$use:=DOM Create XML element:C865($newObject; "use"; "id"; $objectId+"-image"; "xlink:href"; "#"+$objectId+"-data"; "editor:object-id"; $objectId; "editor:object-type"; $objectType; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
			
			$object:=DOM Create XML element:C865($objects; "editor:object"; "editor:object-id"; $objectId; "editor:object-type"; $objectType)
			
			NEditor_SET_TOOL("select")
			
			NEditor_SELECT_Image($newObject; $objectId)
			
			NEditor_ON_DATA_CHANGE
			
			NEditor_SELECT_COPY
			
			NEditor_TOOL_UPDATE
			
			CALL SUBFORM CONTAINER:C1086(-103)
			
			$isAccepted:=True:C214
			
		End if 
		
	End if 
	
End if 

$0:=$isAccepted
