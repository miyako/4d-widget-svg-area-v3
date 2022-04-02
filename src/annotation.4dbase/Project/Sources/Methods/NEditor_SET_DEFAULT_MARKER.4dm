//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2; $offline)

If (Count parameters:C259>1)
	$offline:=$2
End if 

$DefaultMarker:=OBJECT Get pointer:C1124(Object named:K67:5; "DefaultMarker")

$DefaultMarker->:=$1

$MarkerIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "MarkerIcon")

If ($offline)
	C_BLOB:C604($svgData)
	PICTURE TO BLOB:C692($MarkerIcon->; $svgData; ".svg")
	$dom:=DOM Parse XML variable:C720($svgData)
	$line:=DOM Find XML element by ID:C1010($dom; "line")
	
	Case of 
		: ($DefaultMarker->="end")
			DOM SET XML ATTRIBUTE:C866($line; "marker-start"; ""; "marker-end"; "url(#marker-end)"; "x1"; -2; "x2"; 13)
		: ($DefaultMarker->="start")
			DOM SET XML ATTRIBUTE:C866($line; "marker-start"; "url(#marker-start)"; "marker-end"; ""; "x1"; 1; "x2"; 20)
		: ($DefaultMarker->="both")
			DOM SET XML ATTRIBUTE:C866($line; "marker-start"; "url(#marker-start)"; "marker-end"; "url(#marker-end)"; "x1"; 1; "x2"; 13)
		: ($DefaultMarker->="none")
			DOM SET XML ATTRIBUTE:C866($line; "marker-start"; ""; "marker-end"; ""; "x1"; -2; "x2"; 20)
	End case 
	SVG EXPORT TO PICTURE:C1017($dom; $MarkerIcon->)
	DOM CLOSE XML:C722($dom)
Else 
	Case of 
		: ($DefaultMarker->="end")
			SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; "marker-start"; ""; "marker-end"; "url(#marker-end)"; "x1"; -2; "x2"; 13; *)
		: ($DefaultMarker->="start")
			SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; "marker-start"; "url(#marker-start)"; "marker-end"; ""; "x1"; 1; "x2"; 20; *)
		: ($DefaultMarker->="both")
			SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; "marker-start"; "url(#marker-start)"; "marker-end"; "url(#marker-end)"; "x1"; 1; "x2"; 13; *)
		: ($DefaultMarker->="none")
			SVG SET ATTRIBUTE:C1055($MarkerIcon->; "line"; "marker-start"; ""; "marker-end"; ""; "x1"; -2; "x2"; 20; *)
	End case 
End if 