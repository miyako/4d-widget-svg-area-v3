//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_BOOLEAN:C305($2; $offline)

If (Count parameters:C259>1)
	$offline:=$2
End if 

$DefaultFillOpacity:=OBJECT Get pointer:C1124(Object named:K67:5; "DefaultFillOpacity")

$DefaultFillOpacity->:=$1

$FillOpacityIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillOpacityIcon")
$FillComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillComboIcon")

C_REAL:C285($fillOpacityValue)

$fillOpacityValue:=$DefaultFillOpacity->/100

If ($offline)
	C_BLOB:C604($svgData)
	PICTURE TO BLOB:C692($FillOpacityIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	DOM SET XML ATTRIBUTE:C866($rect; "fill-opacity"; $fillOpacityValue)
	SVG EXPORT TO PICTURE:C1017($dom; $FillOpacityIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($FillComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	DOM SET XML ATTRIBUTE:C866($rect; \
		"editor:fill-opacity"; $fillOpacityValue; "fill-opacity"; $fillOpacityValue)
	SVG EXPORT TO PICTURE:C1017($dom; $FillComboIcon->)
	DOM CLOSE XML:C722($dom)
Else 
	SVG SET ATTRIBUTE:C1055($FillOpacityIcon->; "rect"; "fill-opacity"; $fillOpacityValue)
	SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
		"fill-opacity"; $fillOpacityValue; "editor:fill-opacity"; $fillOpacityValue; *)
End if 