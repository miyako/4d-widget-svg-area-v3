//%attributes = {"invisible":true}
C_TEXT:C284($1; $dom)
C_TEXT:C284($2; $id)
C_BOOLEAN:C305($0)

$dom:=$1
$id:=$2

C_REAL:C285($x; $y; $width; $height; $tx; $ty; $sx; $sy; $r; $cx; $cy)

DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:x"; $x)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:y"; $y)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:width"; $width)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $height)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sx"; $sx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sy"; $sy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cx"; $cx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cy"; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:r"; $r)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$selectId:="select-"+$id

$translate:="translate("+Str($tx)+","+Str($ty)+")"
$scale:="scale("+Str($sx)+","+Str($sy)+")"
$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
$transform:=$translate+" "+$scale+" "+$rotate

$g:=DOM Create XML element:C865($Container->; "g"; "id"; $selectId; "transform"; $transform; "editor:object-type"; ""; "editor:object-id"; "")

$mode:=NEditor_Get_select_rendering

$select:=DOM Create XML element:C865($g; "rect"; "id"; "select-rect-"+$id; "x"; $x; "y"; $y; "width"; $width; "height"; $height; "fill"; "#666666"; "fill-opacity"; 0.2; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "editor:object-type"; ""; "editor:object-id"; ""; "shape-rendering"; $mode)

NEditor_SELECT_DISPLAY_HANDLES("rect"; $g; $id; $x; $y; $width; $height; $r; $mode)

NEditor_SELECT_APPEND($Container->; $id; "rect")

$0:=True:C214