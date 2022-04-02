//%attributes = {"invisible":true}
C_BOOLEAN:C305($didImageChange)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$domImage:=DOM Find XML element by ID:C1010($Container->; "image")
$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
$bgImage:=DOM Find XML element by ID:C1010($DomBgImage->; "image")

C_TEXT:C284($oldImageSignature; $newImageSignature)
DOM GET XML ATTRIBUTE BY NAME:C728($bgImage; "editor:signature"; $oldImageSignature)
DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "editor:signature"; $newImageSignature)

$didImageChange:=($oldImageSignature#$newImageSignature)

If ($didImageChange)
	
	C_TEXT:C284($imageData; $imageSignature)
	C_REAL:C285($imageWidth; $imageHeight; $imageSize)
	
	//from container
	DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "xlink:href"; $imageData)
	DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "editor:width"; $imageWidth)
	DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "editor:height"; $imageHeight)
	DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "editor:size"; $imageSize)
	
	DOM SET XML ATTRIBUTE:C866($bgImage; \
		"xlink:href"; $imageData; \
		"editor:signature"; $newImageSignature; \
		"editor:size"; $imageSize; \
		"editor:width"; $imageWidth; \
		"editor:height"; $imageHeight)
	
End if 

//do we need to do this even when !$didImageChange ?

$domCanvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
$domUse:=DOM Find XML element by ID:C1010($Container->; "use")

C_REAL:C285($newUseX; $newUseY)
DOM GET XML ATTRIBUTE BY NAME:C728($domUse; "x"; $newUseX)
DOM GET XML ATTRIBUTE BY NAME:C728($domUse; "y"; $newUseY)

C_REAL:C285($newImageWidth; $newImageHeight)
DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "width"; $newImageWidth)
DOM GET XML ATTRIBUTE BY NAME:C728($domImage; "height"; $newImageHeight)

$bgCanvas:=DOM Find XML element by ID:C1010($DomBgImage->; "canvas")
$bgUse:=DOM Find XML element by ID:C1010($DomBgImage->; "use")

DOM SET XML ATTRIBUTE:C866($bgImage; "width"; $newImageWidth; "height"; $newImageHeight)
DOM SET XML ATTRIBUTE:C866($bgUse; "x"; $newUseX; "y"; $newUseY)

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