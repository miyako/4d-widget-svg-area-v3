//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

If (Length:C16($Container->)#0)
	
	C_BOOLEAN:C305($shouldRedraw)
	
	$MouseX:=$1
	$MouseY:=$2
	
	$select:=NEditor_SELECT_Get
	
	If (Length:C16($select)#0)
		DOM REMOVE XML ELEMENT:C869($select)
		NEditor_SELECT_SET("")
	End if 
	
	$SelectionChanged->:=0
	
	$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
	$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
	
	$clickedItem:=SVG Find element ID by coordinates:C1054($Image->; $ClickX->; $ClickY->)
	
	If ($clickedItem="canvas") | ($clickedItem="use") | ($clickedItem="show")  //background image
		$clickedItem:=""
	End if 
	
	Case of 
		: (Length:C16($clickedItem)=0)
			
			NEditor_TOOL_SET_ENABLED(False:C215)
			
			$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
			If (NEditor_SELECT_Clear($Container->))
				$SelectionChanged->:=1
			End if 
			
			C_REAL:C285($editorTx; $editorTy)
			$editorTx:=$MouseX
			$editorTy:=$MouseY
			
			C_REAL:C285($editorSx; $editorSy)
			$editorSx:=1
			$editorSy:=1
			
			C_REAL:C285($editorCx; $editorCy; $editorR)
			$editorR:=0
			
			$translate:="translate("+Str($editorTx)+","+Str($editorTy)+")"
			$scale:="scale("+Str($editorSx)+","+Str($editorSy)+")"
			$rotate:="rotate("+Str($editorR)+","+Str($editorCx)+","+Str($editorCy)+")"
			$transform:=$translate+" "+$scale+" "+$rotate
			
			$select:=DOM Create XML element:C865($Container->; "rect"; "id"; "select"; "transform"; $transform; "x"; 0; "y"; 0; "width"; 0; "height"; 0; "editor:object-type"; ""; "editor:object-id"; ""; "shape-rendering"; "crispEdges"; "fill"; "#9999FF"; "fill-opacity"; 0.1; "stroke"; "#9999FF"; "stroke-width"; 1; "stroke-opacity"; 0.7)
			
			NEditor_SELECT_SET($select)
			
			$shouldRedraw:=True:C214
			
		: ($clickedItem="select@")
			
			NEditor_SELECT_HANDLE($clickedItem)
			
		Else 
			
			$shouldRedraw:=NEditor_SELECT_Add($clickedItem; Shift down:C543)
			
			NEditor_TOOL_UPDATE
			
			$SelectionChanged->:=Num:C11($shouldRedraw)
			
	End case 
	
	NEditor_MOUSE_TRACKING_START($shouldRedraw)
	
	If ($shouldRedraw)
		$Image->:=NEditor_Get_layer_image($Container->)
	End if 
	
End if 