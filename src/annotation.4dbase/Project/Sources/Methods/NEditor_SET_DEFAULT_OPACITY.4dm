//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_BOOLEAN:C305($2; $offline)

If (Count parameters:C259>1)
	$offline:=$2
End if 

$DefaultStrokeOpacity:=OBJECT Get pointer:C1124(Object named:K67:5; "DefaultStrokeOpacity")

$DefaultStrokeOpacity->:=$1

$StrokeOpacityIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeOpacityIcon")
$StrokeComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeComboIcon")
$FillComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillComboIcon")

C_REAL:C285($widthValue)
C_REAL:C285($colorValue)
C_REAL:C285($opacityValue)
C_TEXT:C284($colorValueHex)

$opacityValue:=$DefaultStrokeOpacity->/100

If ($offline)
	C_BLOB:C604($svgData)
	PICTURE TO BLOB:C692($StrokeOpacityIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	DOM SET XML ATTRIBUTE:C866($line; "stroke-opacity"; $opacityValue)
	SVG EXPORT TO PICTURE:C1017($dom; $StrokeOpacityIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($StrokeComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	
	//StrokeComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-width"; $widthValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-index"; $colorValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; \
			"stroke-opacity"; 1; "editor:stroke-opacity"; $opacityValue; \
			"transform"; "translate(2,3.5)")
	Else 
		If (($widthValue%2)=0)
			$transform:="translate(2,4)"
		Else 
			$transform:="translate(2,3.5)"
		End if 
		$colorValueHex:=Hex(Color($colorValue))
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; $colorValueHex; "stroke-width"; $widthValue; "stroke-dasharray"; ""; \
			"stroke-opacity"; $opacityValue; "editor:stroke-opacity"; $opacityValue; \
			"transform"; $transform)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $StrokeComboIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($FillComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	
	//FillComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-width"; $widthValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-index"; $colorValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; \
			"transform"; "translate(1.5,3.5)"; \
			"stroke-opacity"; 1; "editor:stroke-opacity"; $opacityValue)
	Else 
		If (($widthValue%2)=0)
			$transform:="translate(2,4)"
		Else 
			$transform:="translate(1.5,3.5)"
		End if 
		$colorValueHex:=Hex(Color($colorValue))
		DOM SET XML ATTRIBUTE:C866($rect; \
			"stroke"; $colorValueHex; "stroke-width"; $widthValue; "stroke-dasharray"; ""; \
			"transform"; $transform; \
			"stroke-opacity"; $opacityValue; "editor:stroke-opacity"; $opacityValue)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $FillComboIcon->)
	DOM CLOSE XML:C722($dom)
Else 
	SVG SET ATTRIBUTE:C1055($StrokeOpacityIcon->; "line"; "stroke-opacity"; $opacityValue)
	
	//StrokeComboIcon
	SVG GET ATTRIBUTE:C1056($StrokeComboIcon->; "line"; "editor:stroke-width"; $widthValue)
	SVG GET ATTRIBUTE:C1056($StrokeComboIcon->; "line"; "editor:stroke-index"; $colorValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		SVG SET ATTRIBUTE:C1055($StrokeComboIcon->; "line"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; \
			"transform"; "translate(2,3.5)"; \
			"stroke-opacity"; 1; "editor:stroke-opacity"; $opacityValue; *)
	Else 
		If (($widthValue%2)=0)
			$transform:="translate(2,4)"
		Else 
			$transform:="translate(2,3.5)"
		End if 
		$colorValueHex:=Hex(Color($colorValue))
		SVG SET ATTRIBUTE:C1055($StrokeComboIcon->; "line"; \
			"stroke"; $colorValueHex; "stroke-width"; $widthValue; "stroke-dasharray"; ""; \
			"transform"; $transform; \
			"stroke-opacity"; $opacityValue; "editor:stroke-opacity"; $opacityValue; *)
	End if 
	
	//FillComboIcon
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-width"; $widthValue)
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-index"; $colorValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; \
			"transform"; "translate(1.5,3.5)"; \
			"stroke-opacity"; 1; "editor:stroke-opacity"; $opacityValue; *)
	Else 
		If (($widthValue%2)=0)
			$transform:="translate(2,4)"
		Else 
			$transform:="translate(1.5,3.5)"
		End if 
		$colorValueHex:=Hex(Color($colorValue))
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; $colorValueHex; "stroke-width"; $widthValue; "stroke-dasharray"; ""; \
			"transform"; $transform; \
			"stroke-opacity"; $opacityValue; "editor:stroke-opacity"; $opacityValue; *)
	End if 
	
End if 