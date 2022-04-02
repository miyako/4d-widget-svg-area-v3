//%attributes = {"invisible":true}
C_REAL:C285($1; $width; $2; $height)
C_PICTURE:C286($0; $picture)

$width:=$1
$height:=$2

$svg:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; \
"xmlns:svg"; "http://www.w3.org/2000/svg"; \
"xmlns:xlink"; "http://www.w3.org/1999/xlink")

DOM SET XML ATTRIBUTE:C866($svg; "width"; $width; "height"; $height; "version"; "1.0")

SVG EXPORT TO PICTURE:C1017($svg; $picture; Own XML data source:K45:18)

$0:=$picture