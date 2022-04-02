//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_BOOLEAN:C305($2; $offline)

If (Count parameters:C259>1)
	$offline:=$2
End if 

$DefaultFill:=OBJECT Get pointer:C1124(Object named:K67:5; "DefaultFill")

$DefaultFill->:=($1-1)

$FillColorIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillColorIcon")
$FillComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillComboIcon")

C_REAL:C285($widthValue)
C_REAL:C285($fillColorValue)
C_REAL:C285($fillOpacityValue)
C_REAL:C285($strokeColorValue)
C_REAL:C285($strokeOpacityValue)
C_TEXT:C284($fillColorValueHex)
C_TEXT:C284($strokeColorValueHex)

$fillColorValue:=$DefaultFill->
$fillColorValueHex:=Hex(Color($fillColorValue))

If ($offline)
	C_BLOB:C604($svgData)
	PICTURE TO BLOB:C692($FillColorIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	If ($fillColorValue=0)
		DOM SET XML ATTRIBUTE:C866($rect; "fill"; $fillColorValueHex; "fill-opacity"; 0.4)
	Else 
		DOM SET XML ATTRIBUTE:C866($rect; "fill"; $fillColorValueHex; "fill-opacity"; 1)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $FillColorIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($FillComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	
	//FillComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-width"; $widthValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-index"; $strokeColorValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-opacity"; $strokeOpacityValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:fill-opacity"; $fillOpacityValue)
	
	If ($fillColorValue=0)
		DOM SET XML ATTRIBUTE:C866($rect; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"fill"; "none"; "editor:fill-index"; $fillColorValue)
	Else 
		$strokeColorValueHex:=Hex(Color($strokeColorValue))
		DOM SET XML ATTRIBUTE:C866($rect; \
			"stroke"; $strokeColorValueHex; "stroke-width"; $widthValue; "stroke-dasharray"; ""; \
			"stroke-opacity"; $strokeOpacityValue; \
			"fill"; $fillColorValueHex; "editor:fill-index"; $fillColorValue)
	End if 
	
	SVG EXPORT TO PICTURE:C1017($dom; $FillComboIcon->)
	DOM CLOSE XML:C722($dom)
Else 
	If ($fillColorValue=0)
		SVG SET ATTRIBUTE:C1055($FillColorIcon->; "rect"; "fill"; $fillColorValueHex; "fill-opacity"; 0.4)
	Else 
		SVG SET ATTRIBUTE:C1055($FillColorIcon->; "rect"; "fill"; $fillColorValueHex; "fill-opacity"; 1)
	End if 
	
	//FillComboIcon
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-width"; $widthValue)
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-index"; $strokeColorValue)
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-opacity"; $strokeOpacityValue)
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:fill-opacity"; $fillOpacityValue)
	
	If ($fillColorValue=0)
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"fill"; "none"; "editor:fill-index"; $fillColorValue; *)
	Else 
		$strokeColorValueHex:=Hex(Color($strokeColorValue))
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; $strokeColorValueHex; "stroke-width"; $widthValue; "stroke-dasharray"; ""; \
			"stroke-opacity"; $strokeOpacityValue; \
			"fill-opacity"; $fillOpacityValue; \
			"fill"; $fillColorValueHex; "editor:fill-index"; $fillColorValue; *)
	End if 
	
End if 