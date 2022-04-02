//%attributes = {"invisible":true}
//match bg document size to image.size.w,h
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

C_REAL:C285($documentWidth; $documentHeight)
$size:=DOM Find XML element by ID:C1010($Container->; "size")
DOM GET XML ATTRIBUTE BY NAME:C728($size; "width"; $documentWidth)
DOM GET XML ATTRIBUTE BY NAME:C728($size; "height"; $documentHeight)

$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
DOM SET XML ATTRIBUTE:C866($DomBgImage->; "editor:width"; $documentWidth; "editor:height"; $documentHeight)