//%attributes = {"invisible":true}
C_TEXT:C284($1)

$Tool:=OBJECT Get pointer:C1124(Object named:K67:5; "Tool")

$Tool->:=$1

Case of 
	: ($1="select")
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "ToolSelect"; False:C215)
		OBJECT SET FORMAT:C236(*; "Select"; ";#images/select-tool.svg;;3;0;1;8;;;;0;;1")
	: ($1="polyline")
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "ToolPolyline"; False:C215)
		OBJECT SET FORMAT:C236(*; "Select"; ";#images/polyline-tool.svg;;3;0;1;8;;;;0;;1")
	: ($1="text")
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "ToolText"; False:C215)
		OBJECT SET FORMAT:C236(*; "Select"; ";#images/text-tool.svg;;3;0;1;8;;;;0;;1")
	: ($1="line")
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "ToolLine"; False:C215)
		OBJECT SET FORMAT:C236(*; "Select"; ";#images/line-tool.svg;;3;0;1;8;;;;0;;1")
	: ($1="rect")
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "ToolRect"; False:C215)
		OBJECT SET FORMAT:C236(*; "Select"; ";#images/rect-tool.svg;;3;0;1;8;;;;0;;1")
	: ($1="circle")
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "ToolEllipse"; False:C215)
		OBJECT SET FORMAT:C236(*; "Select"; ";#images/circle-tool.svg;;3;0;1;8;;;;0;;1")
End case 