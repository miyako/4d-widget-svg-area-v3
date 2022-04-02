//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
$ScrollbarSize:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarSize")

NEditor_SET_PLATFORM

$Zoom->:=1

If (NEditor_Get_platform=Mac OS:K25:2)
	$ScrollbarSize->:=15
Else 
	$ScrollbarSize->:=17
End if 

C_REAL:C285($1; $documentWidth; $2; $documentHeight)
$documentWidth:=$1
$documentHeight:=$2

OBJECT SET SCROLLBAR:C843(*; "Image"; False:C215; False:C215)

$IsScrollbarVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrollbarVisible")
$IsScrollbarVisible->:=0

$svg:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; "xmlns:svg"; "http://www.w3.org/2000/svg"; "xmlns:editor"; "http://www.4d.com/2014/editor"; "xmlns:xlink"; "http://www.w3.org/1999/xlink")

DOM SET XML ATTRIBUTE:C866($svg; "width"; $documentWidth; "height"; $documentHeight; "version"; "1.0")

If (NEditor_Get_debug_mode)
	$Debug_Width:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_Width")
	$Debug_Height:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_Height")
	$Debug_Width->:=$documentWidth
	$Debug_Height->:=$documentHeight
End if 

If (NEditor_Get_debug_mode)
	//to check size
	DOM SET XML ATTRIBUTE:C866($svg; "viewport-fill"; "#AAAAFF"; "viewport-fill-opacity"; 0.1)
End if 

//editor namespace
$editor:=DOM Create XML element:C865($svg; "editor:editor"; "id"; "editor")
$selects:=DOM Create XML element:C865($editor; "editor:selects"; "id"; "selects")
$objects:=DOM Create XML element:C865($editor; "editor:objects"; "id"; "objects")
$size:=DOM Create XML element:C865($editor; "editor:size"; "id"; "size")
DOM SET XML ATTRIBUTE:C866($size; "width"; $documentWidth; "height"; $documentHeight)

$defs:=DOM Create XML element:C865($svg; "defs"; "id"; "defs")

$picture:=NEditor_Create_empty_image($documentWidth; $documentHeight)

C_BLOB:C604($imageBlob)
PICTURE TO BLOB:C692($picture; $imageBlob; ".png")
$imageSignature:=Generate digest:C1147($imageBlob; SHA1 digest:K66:2)
BASE64 ENCODE:C895($imageBlob)

C_REAL:C285($imageWidth; $imageHeight)
PICTURE PROPERTIES:C457($picture; $imageWidth; $imageHeight)

C_REAL:C285($imageSize)
If ($documentWidth>$documentHeight)
	$imageSize:=$documentHeight
Else 
	$imageSize:=$documentWidth
End if 

$imageRendering:=NEditor_Get_image_rendering
//make it center and square
$imageData:="data:image/png;base64,"+Convert to text:C1012($imageBlob; "us-ascii")
$image:=DOM Create XML element:C865($defs; "image"; "id"; "image"; "width"; $imageSize; "height"; $imageSize; "image-rendering"; $imageRendering; "editor:size"; 0; "editor:signature"; $imageSignature; "editor:width"; $imageWidth; "editor:height"; $imageHeight; "xlink:href"; $imageData)

$viewport_tx:=0
$viewport_ty:=0
$viewport_translate:="translate("+Str($viewport_tx)+","+Str($viewport_ty)+")"
$viewport_transform:=$viewport_translate
$viewport:=DOM Create XML element:C865($svg; "g"; "id"; "viewport"; "transform"; $viewport_transform; \
"editor:tx"; $viewport_tx; "editor:ty"; $viewport_ty)

C_REAL:C285($sx; $sy; $tx; $ty; $cx; $cy; $r)
$sx:=1
$sy:=1
$tx:=0
$ty:=0
$cx:=$documentWidth/2
$cy:=$documentHeight/2
$r:=0

$translate:="translate("+Str($tx)+","+Str($ty)+")"
$scale:="scale("+Str($sx)+","+Str($sy)+")"
$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
$transform:=$translate+" "+$scale+" "+$rotate

//show (zoom)

$show_cx:=0
$show_cy:=0
$show_rx:=$documentWidth/2
$show_ry:=$documentHeight/2
$show_tx:=$show_rx
$show_ty:=$show_ry

$show_translate:="translate("+Str($show_tx)+","+Str($show_ty)+")"
$transform:=$show_translate

$canvas:=DOM Create XML element:C865($viewport; "g"; "id"; "canvas"; "editor:sx"; $sx; "editor:sy"; $sy; "editor:tx"; $tx; "editor:ty"; $ty; "editor:cx"; $cx; "editor:cy"; $cy; "editor:r"; $r; "transform"; $transform)

If (False:C215)
	$show:=DOM Create XML element:C865($viewport; "ellipse"; "id"; "show"; "stroke"; "none"; \
		"cx"; $show_cx; "cy"; $show_cy; \
		"rx"; $show_rx; "ry"; $show_ry; \
		"editor:tx"; $show_tx; "editor:ty"; $show_ty; \
		"editor:cx"; $show_cx; "editor:cy"; $show_cy; \
		"editor:rx"; $show_rx; "editor:ry"; $show_ry; \
		"transform"; $transform; "visibility"; "hidden")
Else 
	$show_width:=$show_rx*2
	$show_height:=$show_ry*2
	$show_x:=$show_cx-$show_rx
	$show_y:=$show_cy-$show_ry
	$show:=DOM Create XML element:C865($viewport; "rect"; "id"; "show"; "stroke"; "none"; \
		"width"; $show_width; "height"; $show_height; \
		"x"; $show_x; "y"; $show_y; \
		"editor:tx"; $show_tx; "editor:ty"; $show_ty; \
		"editor:cx"; $show_cx; "editor:cy"; $show_cy; \
		"editor:rx"; $show_rx; "editor:ry"; $show_ry; \
		"transform"; $transform; "visibility"; "hidden")
End if 

If (NEditor_Get_debug_mode)
	//to check size
	DOM SET XML ATTRIBUTE:C866($show; "fill"; "none"; \
		"stroke"; "#FF0000"; "stroke-dasharray"; "2,2"; "stroke-width"; 1)
End if 

$use:=DOM Create XML element:C865($canvas; "use"; "id"; "use"; "visibility"; "visible"; "xlink:href"; "#image"; "x"; ($documentWidth/2)-($imageSize/2); "y"; ($documentHeight/2)-($imageSize/2))

$annotation:=DOM Create XML element:C865($svg; "g"; "id"; "annotation")

$Container->:=$svg

//shadow dom for bgimage
$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
$svg:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; "xmlns:svg"; "http://www.w3.org/2000/svg"; "xmlns:editor"; "http://www.4d.com/2014/editor"; "xmlns:xlink"; "http://www.w3.org/1999/xlink")
DOM SET XML ATTRIBUTE:C866($svg; "width"; $documentWidth; "height"; $documentHeight; "editor:width"; $documentWidth; "editor:height"; $documentHeight)

If (NEditor_Get_debug_mode)
	//to check size
	DOM SET XML ATTRIBUTE:C866($svg; "viewport-fill"; "#FF0000"; "viewport-fill-opacity"; 0.1)
End if 

$image:=DOM Find XML element by ID:C1010($Container->; "image")
$defs:=DOM Create XML element:C865($svg; "defs"; "id"; "defs")
$image:=DOM Append XML element:C1082($defs; $image)
$viewport:=DOM Append XML element:C1082($svg; $viewport)
//$canvas:=DOM Append XML element($svg;$canvas)
$use:=DOM Find XML element by ID:C1010($svg; "use")

DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")  //constantly visible
OBJECT SET VISIBLE:C603(*; "BgImage"; False:C215)

$show:=DOM Find XML element by ID:C1010($svg; "show")
DOM SET XML ATTRIBUTE:C866($show; "visibility"; "hidden")

C_LONGINT:C283($imVisible; $bgVisible)
$imVisible:=1  //see #99
$bgVisible:=0

If (NEditor_Get_debug_mode)
	$Debug_BgVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgVisible")
	$Debug_ImVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ImVisible")
	$Debug_BgVisible->:=$bgVisible
	$Debug_ImVisible->:=$imVisible
End if 

$DomBgImage->:=$svg

$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
$BgImage->:=NEditor_Get_background_image($DomBgImage->)