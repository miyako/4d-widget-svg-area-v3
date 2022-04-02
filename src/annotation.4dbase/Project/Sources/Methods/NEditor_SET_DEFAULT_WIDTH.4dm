//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_BOOLEAN:C305($2; $offline)

If (Count parameters:C259>1)
	$offline:=$2
End if 

$DefaultStrokeWidth:=OBJECT Get pointer:C1124(Object named:K67:5; "DefaultStrokeWidth")

$DefaultStrokeWidth->:=$1

$StrokeWidthIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeWidthIcon")
$StrokeComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeComboIcon")
$FillComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillComboIcon")
$MarkerIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "MarkerIcon")

C_REAL:C285($widthValue)
C_REAL:C285($colorValue)
C_REAL:C285($opacityValue)
C_TEXT:C284($colorValueHex)

C_REAL:C285($strokeOpacityValue)

$widthValue:=$DefaultStrokeWidth->

If (($widthValue%2)=0)
	$transform:="translate(2,4)"
	$transform2:="translate(2,4)"
Else 
	$transform:="translate(2,3.5)"
	$transform2:="translate(1.5,3.5)"
End if 

If ($offline)
	C_BLOB:C604($svgData)
	PICTURE TO BLOB:C692($StrokeWidthIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	If ($widthValue=0)
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; \
			"stroke-width"; 1; "stroke-opacity"; 1; \
			"transform"; "translate(2,3.5)")
	Else 
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; "#000000"; "stroke-dasharray"; ""; \
			"stroke-width"; $1; \
			"transform"; $transform)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $StrokeWidthIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($StrokeComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	
	//StrokeComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-opacity"; $opacityValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-index"; $colorValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-opacity"; 1; \
			"stroke-width"; 1; "editor:stroke-width"; $widthValue; \
			"transform"; "translate(2,3.5)")
	Else 
		$colorValueHex:=Hex(Color($colorValue))
		DOM SET XML ATTRIBUTE:C866($line; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-opacity"; $opacityValue; \
			"stroke-width"; $widthValue; "editor:stroke-width"; $widthValue; \
			"transform"; $transform)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $StrokeComboIcon->)
	DOM CLOSE XML:C722($dom)
	
	If (False:C215)
		PICTURE TO BLOB:C692($MarkerIcon->; $svgData; ".svg")
		$dom:=DOM Parse XML variable:C720($svgData)
		$line:=DOM Find XML element by ID:C1010($dom; "line")
		
		//MarkerIcon
		DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-opacity"; $opacityValue)
		DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-index"; $colorValue)
		
		If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
			DOM SET XML ATTRIBUTE:C866($line; \
				"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-opacity"; 1; \
				"stroke-width"; 1; "editor:stroke-width"; $widthValue; \
				"transform"; "translate(2,3.5)")
		Else 
			$colorValueHex:=Hex(Color($colorValue))
			DOM SET XML ATTRIBUTE:C866($line; \
				"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-opacity"; $opacityValue; \
				"stroke-width"; $widthValue; "editor:stroke-width"; $widthValue; \
				"transform"; $transform)
		End if 
		SVG EXPORT TO PICTURE:C1017($dom; $MarkerIcon->)
		DOM CLOSE XML:C722($dom)
	End if 
	
	PICTURE TO BLOB:C692($FillComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	
	//FillComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-opacity"; $opacityValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-index"; $colorValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($rect; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; \
			"stroke-width"; 1; "stroke-opacity"; 1; \
			"transform"; "translate(1.5,3.5)"; \
			"editor:stroke-width"; $widthValue)
	Else 
		$colorValueHex:=Hex(Color($colorValue))
		DOM SET XML ATTRIBUTE:C866($rect; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-opacity"; $opacityValue; \
			"transform"; $transform2; \
			"stroke-width"; $widthValue; "editor:stroke-width"; $widthValue)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $FillComboIcon->)
	DOM CLOSE XML:C722($dom)
Else 
	
	If ($widthValue=0)
		SVG SET ATTRIBUTE:C1055($StrokeWidthIcon->; "line"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; \
			"transform"; "translate(2,3.5)")
	Else 
		SVG SET ATTRIBUTE:C1055($StrokeWidthIcon->; "line"; \
			"stroke"; "#000000"; "stroke-dasharray"; ""; "stroke-width"; $1; \
			"transform"; $transform)
	End if 
	
	//StrokeComboIcon
	SVG GET ATTRIBUTE:C1056($StrokeComboIcon->; "line"; "editor:stroke-index"; $colorValue)
	SVG GET ATTRIBUTE:C1056($StrokeComboIcon->; "line"; "editor:stroke-opacity"; $opacityValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		SVG SET ATTRIBUTE:C1055($StrokeComboIcon->; "line"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"transform"; "translate(2,3.5)"; \
			"editor:stroke-width"; $widthValue; *)
	Else 
		$colorValueHex:=Hex(Color($colorValue))
		SVG SET ATTRIBUTE:C1055($StrokeComboIcon->; "line"; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-opacity"; $opacityValue; \
			"transform"; $transform; \
			"stroke-width"; $widthValue; "editor:stroke-width"; $widthValue; *)
	End if 
	
	//MarkerIcon
	If (False:C215)
		SVG GET ATTRIBUTE:C1056($MarkerIcon->; "line"; "editor:stroke-index"; $colorValue)
		SVG GET ATTRIBUTE:C1056($MarkerIcon->; "line"; "editor:stroke-opacity"; $opacityValue)
		
		If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
			SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; \
				"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
				"transform"; "translate(2,3.5)"; \
				"editor:stroke-width"; $widthValue; *)
		Else 
			$colorValueHex:=Hex(Color($colorValue))
			SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; \
				"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-opacity"; $opacityValue; \
				"transform"; $transform; \
				"stroke-width"; $widthValue; "editor:stroke-width"; $widthValue; *)
		End if 
	End if 
	
	//FillComboIcon
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-index"; $colorValue)
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-opacity"; $strokeOpacityValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($strokeOpacityValue=0)
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"transform"; "translate(1.5,3.5)"; \
			"editor:stroke-width"; $widthValue; *)
	Else 
		$colorValueHex:=Hex(Color($colorValue))
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; \
			"stroke-opacity"; $strokeOpacityValue; \
			"transform"; $transform2; \
			"stroke-width"; $widthValue; "editor:stroke-width"; $widthValue; *)
	End if 
End if 