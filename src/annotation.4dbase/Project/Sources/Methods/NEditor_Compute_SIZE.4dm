//%attributes = {"invisible":true}
C_TEXT:C284($1; $text; $2; $textValue)
C_POINTER:C301(${3})

$text:=$1
$textValue:=$2

DOM GET XML ATTRIBUTE BY NAME:C728($text; "editor:object-id"; $objectId)

$classId:="class-"+$objectId+"-textArea"
$class:=DOM Find XML element by ID:C1010($text; $classId)

$dom:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; \
"xmlns:svg"; "http://www.w3.org/2000/svg"; \
"xmlns:editor"; "http://www.4d.com/2014/editor"; \
"xmlns:xlink"; "http://www.w3.org/1999/xlink")

$defs:=DOM Create XML element:C865($dom; "defs"; "id"; "defs")
$class:=DOM Append XML element:C1082($defs; $class)

$text:=DOM Create XML element:C865($dom; "text"; "x"; 0; "y"; 0; "class"; $classId; "text-rendering"; "geometricPrecision")
DOM SET XML ELEMENT VALUE:C868($text; $textValue)

C_PICTURE:C286($picture)
SVG EXPORT TO PICTURE:C1017($dom; $picture; Copy XML data source:K45:17)
C_REAL:C285($width; $hanging; $height)
PICTURE PROPERTIES:C457($picture; $width; $hanging)
DOM REMOVE XML ELEMENT:C869($text)
$text:=DOM Create XML element:C865($dom; "textArea"; "x"; 0; "y"; 0; "class"; $classId; "text-rendering"; "geometricPrecision")

NEditor_TEXT_EDIT_SET_VALUE($text; $textValue)

SVG EXPORT TO PICTURE:C1017($dom; $picture; Copy XML data source:K45:17)
PICTURE PROPERTIES:C457($picture; $width; $height)
$lineHeight:=$height+$hanging
CLEAR VARIABLE:C89($picture)

DOM CLOSE XML:C722($dom)

$height:=$lineHeight
$x:=-($width/2)
$y:=-($height/2)

$3->:=$x
$4->:=$y
$5->:=$width
$6->:=$height
$7->:=$height