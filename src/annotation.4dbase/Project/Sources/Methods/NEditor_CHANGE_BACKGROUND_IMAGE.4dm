//%attributes = {"invisible":true}
C_PICTURE:C286($1; $picture)
C_BOOLEAN:C305($didImageChange)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
$domImage:=DOM Find XML element by ID:C1010($Container->; "image")
$bgImage:=DOM Find XML element by ID:C1010($DomBgImage->; "image")

$picture:=$1

C_BLOB:C604($imageBlob)
PICTURE TO BLOB:C692($picture; $imageBlob; ".png")
$imageSignature:=Generate digest:C1147($imageBlob; SHA1 digest:K66:2)

C_TEXT:C284($currentImageSignature)
DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "editor:signature"; $currentImageSignature)

C_BOOLEAN:C305($didImageChange; $didSizeChange)

$didImageChange:=($currentImageSignature#$imageSignature)

If ($didImageChange)
	
	BASE64 ENCODE:C895($imageBlob)
	$imageData:="data:image/png;base64,"+Convert to text:C1012($imageBlob; "us-ascii")
	
	C_REAL:C285($imageWidth; $imageHeight)
	PICTURE PROPERTIES:C457($picture; $imageWidth; $imageHeight)
	
	$imageSize:=Picture size:C356($picture)
	
	DOM SET XML ATTRIBUTE:C866($domImage; \
		"xlink:href"; $imageData; \
		"editor:signature"; $imageSignature; \
		"editor:size"; $imageSize; \
		"editor:width"; $imageWidth; \
		"editor:height"; $imageHeight)
	
	DOM SET XML ATTRIBUTE:C866($bgImage; \
		"xlink:href"; $imageData; \
		"editor:signature"; $imageSignature; \
		"editor:size"; $imageSize; \
		"editor:width"; $imageWidth; \
		"editor:height"; $imageHeight)
	
End if 

//document size
C_REAL:C285($documentWidth; $documentHeight)
C_LONGINT:C283($left; $top; $right; $bottom)
OBJECT GET COORDINATES:C663(*; "Bg"; $left; $top; $right; $bottom)
$documentWidth:=$right-$left
$documentHeight:=$bottom-$top
$size:=DOM Find XML element by ID:C1010($Container->; "size")
DOM SET XML ATTRIBUTE:C866($size; "width"; $documentWidth; "height"; $documentHeight)
DOM SET XML ATTRIBUTE:C866($DomBgImage->; "editor:width"; $documentWidth; "editor:height"; $documentHeight)

//image size
C_REAL:C285($imageSize)
If ($documentWidth>$documentHeight)
	$imageSize:=$documentHeight
Else 
	$imageSize:=$documentWidth
End if 

DOM SET XML ATTRIBUTE:C866($domImage; "width"; $imageSize; "height"; $imageSize)
DOM SET XML ATTRIBUTE:C866($bgImage; "width"; $imageSize; "height"; $imageSize)

$domCanvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
$domUse:=DOM Find XML element by ID:C1010($Container->; "use")

DOM SET XML ATTRIBUTE:C866($domUse; \
"x"; ($documentWidth/2)-($imageSize/2); \
"y"; ($documentHeight/2)-($imageSize/2))

C_REAL:C285($sx; $sy; $tx; $ty; $cx; $cy; $r)
DOM GET XML ATTRIBUTE BY NAME:C728($domCanvas; "editor:sx"; $sx)
DOM GET XML ATTRIBUTE BY NAME:C728($domCanvas; "editor:sy"; $sy)
DOM GET XML ATTRIBUTE BY NAME:C728($domCanvas; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($domCanvas; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($domCanvas; "editor:r"; $r)
$cx:=$documentWidth/2
$cy:=$documentHeight/2

$translate:="translate("+Str($tx)+","+Str($ty)+")"
$scale:="scale("+Str($sx)+","+Str($sy)+")"
$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
$transform:=$translate+" "+$scale+" "+$rotate

DOM SET XML ATTRIBUTE:C866($domCanvas; \
"editor:sx"; $sx; "editor:sy"; $sy; \
"editor:tx"; $tx; "editor:ty"; $ty; \
"editor:cx"; $cx; "editor:cy"; $cy; \
"editor:r"; $r; "transform"; $transform)

$show:=DOM Find XML element by ID:C1010($Container->; "show")

$show_cx:=0
$show_cy:=0
$show_rx:=$documentWidth/2
$show_ry:=$documentHeight/2
$show_tx:=$show_rx
$show_ty:=$show_ry

$show_translate:="translate("+Str($show_tx)+","+Str($show_ty)+")"
$transform:=$show_translate

If (False:C215)
	DOM SET XML ATTRIBUTE:C866($show; \
		"cx"; $show_cx; "cy"; $show_cy; \
		"rx"; $show_rx; "ry"; $show_ry; \
		"editor:tx"; $show_tx; "editor:ty"; $show_ty; \
		"editor:cx"; $show_cx; "editor:ry"; $show_cy; \
		"editor:rx"; $show_rx; "editor:ry"; $show_ry; "transform"; $transform)
Else 
	$show_width:=$show_rx*2
	$show_height:=$show_ry*2
	$show_x:=$show_cx-$show_rx
	$show_y:=$show_cy-$show_ry
	DOM SET XML ATTRIBUTE:C866($show; \
		"width"; $show_width; "height"; $show_height; \
		"x"; $show_x; "y"; $show_y; \
		"editor:tx"; $show_tx; "editor:ty"; $show_ty; \
		"editor:cx"; $show_cx; "editor:ry"; $show_cy; \
		"editor:rx"; $show_rx; "editor:ry"; $show_ry; "transform"; $transform)
End if 

$bgCanvas:=DOM Find XML element by ID:C1010($DomBgImage->; "canvas")
$bgUse:=DOM Find XML element by ID:C1010($DomBgImage->; "use")

DOM SET XML ATTRIBUTE:C866($bgUse; \
"x"; ($documentWidth/2)-($imageSize/2); \
"y"; ($documentHeight/2)-($imageSize/2))

DOM SET XML ATTRIBUTE:C866($bgCanvas; \
"editor:sx"; $sx; "editor:sy"; $sy; \
"editor:tx"; $tx; "editor:ty"; $ty; \
"editor:cx"; $cx; "editor:cy"; $cy; \
"editor:r"; $r; "transform"; $transform)

If (NEditor_Get_debug_mode)
	//true canvas size
	$size:=DOM Find XML element by ID:C1010($Container->; "size")
	C_REAL:C285($documentWidth; $documentHeight)
	DOM GET XML ATTRIBUTE BY NAME:C728($size; "width"; $documentWidth)
	DOM GET XML ATTRIBUTE BY NAME:C728($size; "height"; $documentHeight)
	$Debug_Width:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_Width")
	$Debug_Height:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_Height")
	$Debug_Width->:=$documentWidth
	$Debug_Height->:=$documentHeight
End if 