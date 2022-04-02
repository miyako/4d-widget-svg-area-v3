//%attributes = {"invisible":true}
C_TEXT:C284($1; $objectType)
C_TEXT:C284($2; $dom)
C_TEXT:C284($3; $id)
C_REAL:C285($4; $5; $6; $7; $8)
C_TEXT:C284($9)

C_REAL:C285($x; $y; $width; $height; $r)

$objectType:=$1
$dom:=$2
$id:=$3
$x:=$4
$y:=$5
$width:=$6
$height:=$7
$r:=$8

$mode:=$9

$CanvasCurrentSelectTL:=DOM Create XML element:C865($dom; "rect"; "id"; "select-tl-"+$id; "x"; $x-(10/2); "y"; $y-(10/2); "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectTM:=DOM Create XML element:C865($dom; "rect"; "id"; "select-tm-"+$id; "x"; $x-(10/2)+($width/2); "y"; $y-(10/2); "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectTR:=DOM Create XML element:C865($dom; "rect"; "id"; "select-tr-"+$id; "x"; $x-(10/2)+$width; "y"; $y-(10/2); "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectML:=DOM Create XML element:C865($dom; "rect"; "id"; "select-ml-"+$id; "x"; $x-(10/2); "y"; $y-(10/2)+($height/2); "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectMR:=DOM Create XML element:C865($dom; "rect"; "id"; "select-mr-"+$id; "x"; $x-(10/2)+$width; "y"; $y-(10/2)+($height/2); "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectBL:=DOM Create XML element:C865($dom; "rect"; "id"; "select-bl-"+$id; "x"; $x-(10/2); "y"; $y-(10/2)+$height; "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectBM:=DOM Create XML element:C865($dom; "rect"; "id"; "select-bm-"+$id; "x"; $x-(10/2)+($width/2); "y"; $y-(10/2)+$height; "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

$CanvasCurrentSelectBR:=DOM Create XML element:C865($dom; "rect"; "id"; "select-br-"+$id; "x"; $x-(10/2)+$width; "y"; $y-(10/2)+$height; "width"; 10; "height"; 10; "fill"; "#9999FF"; "fill-opacity"; 0.7; "editor:object-type"; ""; "editor:object-id"; ""; "stroke"; "#EEEEEE"; "stroke-opacity"; 0.7; "stroke-width"; 1; "shape-rendering"; $mode)

NEditor_SET_HANDLE("")