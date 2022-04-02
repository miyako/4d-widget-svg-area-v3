//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_BOOLEAN:C305($2; $offline)

If (Count parameters:C259>1)
	$offline:=$2
End if 

$DefaultStroke:=OBJECT Get pointer:C1124(Object named:K67:5; "DefaultStroke")

$DefaultStroke->:=($1-1)

$StrokeColorIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeColorIcon")
$StrokeComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeComboIcon")
$FillComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillComboIcon")
$MarkerIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "MarkerIcon")

C_REAL:C285($widthValue)
C_REAL:C285($opacityValue)
C_REAL:C285($colorValue)
C_TEXT:C284($colorValueHex)

C_REAL:C285($fillOpacityValue)
C_REAL:C285($fillColorValue)

$colorValue:=$DefaultStroke->
$colorValueHex:=Hex(Color($colorValue))

If ($offline)
	C_BLOB:C604($svgData)
	PICTURE TO BLOB:C692($StrokeColorIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	If ($colorValue=0)
		DOM SET XML ATTRIBUTE:C866($rect; "stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1)
	Else 
		DOM SET XML ATTRIBUTE:C866($rect; "stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; 2)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $StrokeColorIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($StrokeComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	
	//StrokeComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-width"; $widthValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-opacity"; $opacityValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($line; "stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue)
	Else 
		DOM SET XML ATTRIBUTE:C866($line; "stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; $widthValue; "stroke-opacity"; $opacityValue; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $StrokeComboIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($FillComboIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$rect:=DOM Find XML element by ID:C1010($dom; "rect")
	
	//FillComboIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-width"; $widthValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($rect; "editor:stroke-opacity"; $opacityValue)
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($rect; "stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue)
	Else 
		DOM SET XML ATTRIBUTE:C866($rect; "stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; $widthValue; "stroke-opacity"; $opacityValue; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $FillComboIcon->)
	DOM CLOSE XML:C722($dom)
	PICTURE TO BLOB:C692($MarkerIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	
	//MarkerIcon
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-width"; $widthValue)
	DOM GET XML ATTRIBUTE BY NAME:C728($line; "editor:stroke-opacity"; $opacityValue)
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		DOM SET XML ATTRIBUTE:C866($line; "stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue)
	Else 
		DOM SET XML ATTRIBUTE:C866($line; "stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; $widthValue; "stroke-opacity"; $opacityValue; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue)
	End if 
	$domStyle:=DOM Find XML element by ID:C1010($dom; "class-marker")
	C_TEXT:C284($data; $style)
	DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	If (Match regex:C1019("(?m)(.*fill:)([^;]+)(;.*)"; $style; 1; $pos; $len))
		C_TEXT:C284($before; $fill; $after)
		$before:=Substring:C12($style; $pos{1}; $len{1})
		$fill:=Substring:C12($style; $pos{2}; $len{2})
		$after:=Substring:C12($style; $pos{3}; $len{3})
		If ($fill#$colorValueHex)
			$style:=$before+$colorValueHex+$after
		End if 
		DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
	End if 
	SVG EXPORT TO PICTURE:C1017($dom; $MarkerIcon->)
	DOM CLOSE XML:C722($dom)
Else 
	
	If ($colorValue=0)
		SVG SET ATTRIBUTE:C1055($StrokeColorIcon->; "rect"; "stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1)
	Else 
		SVG SET ATTRIBUTE:C1055($StrokeColorIcon->; "rect"; "stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; 2)
	End if 
	
	//StrokeComboIcon
	SVG GET ATTRIBUTE:C1056($StrokeComboIcon->; "line"; "editor:stroke-width"; $widthValue)
	SVG GET ATTRIBUTE:C1056($StrokeComboIcon->; "line"; "editor:stroke-opacity"; $opacityValue)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		SVG SET ATTRIBUTE:C1055($StrokeComboIcon->; "line"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue; *)
	Else 
		SVG SET ATTRIBUTE:C1055($StrokeComboIcon->; "line"; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; $widthValue; "stroke-opacity"; $opacityValue; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue; *)
	End if 
	
	//MarkerIcon
	SVG GET ATTRIBUTE:C1056($MarkerIcon->; "line"; "editor:stroke-width"; $widthValue)
	SVG GET ATTRIBUTE:C1056($MarkerIcon->; "line"; "editor:stroke-opacity"; $opacityValue)
	
	C_TEXT:C284($markerStart; $markerEnd)
	SVG GET ATTRIBUTE:C1056($MarkerIcon->; "line"; "marker-start"; $markerStart)
	SVG GET ATTRIBUTE:C1056($MarkerIcon->; "line"; "marker-end"; $markerEnd)
	
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue; *)
	Else 
		SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; $widthValue; "stroke-opacity"; $opacityValue; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue; *)
		
		C_BLOB:C604($svgData)
		PICTURE TO BLOB:C692($MarkerIcon->; $svgData; ".svg")
		$dom:=DOM Parse XML variable:C720($svgData)
		$domStyle:=DOM Find XML element by ID:C1010($dom; "class-marker")
		C_TEXT:C284($data; $style)
		DOM GET XML ELEMENT VALUE:C731($domStyle; $data; $style)  //CDATA
		ARRAY LONGINT:C221($pos; 0)
		ARRAY LONGINT:C221($len; 0)
		If (Match regex:C1019("(?m)(.*fill:)([^;]+)(;.*)"; $style; 1; $pos; $len))
			C_TEXT:C284($before; $fill; $after)
			$before:=Substring:C12($style; $pos{1}; $len{1})
			$fill:=Substring:C12($style; $pos{2}; $len{2})
			$after:=Substring:C12($style; $pos{3}; $len{3})
			If ($fill#$colorValueHex)
				$style:=$before+$colorValueHex+$after
			End if 
			DOM SET XML ELEMENT VALUE:C868($domStyle; $style; *)
			SVG EXPORT TO PICTURE:C1017($dom; $MarkerIcon->)
			DOM CLOSE XML:C722($dom)
		End if 
	End if 
	
	//FillComboIcon
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-width"; $widthValue)
	SVG GET ATTRIBUTE:C1056($FillComboIcon->; "rect"; "editor:stroke-opacity"; $opacityValue)
	If ($widthValue=0) | ($colorValue=0) | ($opacityValue=0)
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; "#9999FF"; "stroke-dasharray"; "2,2"; "stroke-width"; 1; "stroke-opacity"; 1; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue; *)
	Else 
		SVG SET ATTRIBUTE:C1055($FillComboIcon->; "rect"; \
			"stroke"; $colorValueHex; "stroke-dasharray"; ""; "stroke-width"; $widthValue; "stroke-opacity"; $opacityValue; \
			"editor:stroke"; $colorValueHex; "editor:stroke-index"; $colorValue; *)
	End if 
End if 