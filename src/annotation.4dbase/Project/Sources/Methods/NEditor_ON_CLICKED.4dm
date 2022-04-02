//%attributes = {"invisible":true}
C_LONGINT:C283(MouseX; MouseY)
C_LONGINT:C283($x; $y; $b)
C_REAL:C285($MouseX; $MouseY)

If (Contextual click:C713)
	
	GET MOUSE:C468($x; $y; $b; *)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	
	$count:=NEditor_SELECT_Get_count($Container->)
	
	$menu:=Create menu:C408
	
	$isImage:=False:C215
	$isText:=False:C215
	$includesText:=False:C215
	$includesImage:=False:C215
	$includesLine:=False:C215
	$isImageOnly:=False:C215
	
	$fill:=NEditor_SELECT_Get_fill($Container; ->$isImageOnly)
	$stroke:=NEditor_SELECT_Get_stroke($Container; ->$isImageOnly)
	$fillOpacity:=NEditor_SELECT_Get_fill_opacity($Container; ->$isImageOnly)
	$strokeOpacity:=NEditor_SELECT_Get_opacity($Container; ->$isImageOnly)
	$strokeWidth:=NEditor_SELECT_Get_stroke_width($Container; ->$isImageOnly)
	$marker:=NEditor_SELECT_Get_marker($Container; ->$includesLine)
	
	$preserveAspectRatio:=NEditor_SELECT_Get_aspect_ratio($Container; ->$includesImage)
	
	$textStyle:=NEditor_SELECT_Get_text_style($Container; ->$includesText)
	$textAlign:=NEditor_SELECT_Get_halign($Container; ->$includesText)
	$displayAlign:=NEditor_SELECT_Get_valign($Container; ->$includesText)
	$fontSize:=NEditor_SELECT_Get_font_size($Container; ->$includesText)
	$fontName:=NEditor_SELECT_Get_font($Container; ->$includesText)
	$wrap:=NEditor_SELECT_Get_wrap($Container; ->$includesText)
	
	NEditor_MENU_SET_TOOL($menu)
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_ALIGN($menu; ($count<2); ($count<3))
	NEditor_MENU_SET_MOVE($menu; ($count=0))
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_COLOR($menu; $isImageOnly)
	NEditor_MENU_SET_FILL_OPACITY($menu; $fillOpacity; $isImageOnly)
	NEditor_MENU_SET_OPACITY($menu; $strokeOpacity; $isImageOnly)
	NEditor_MENU_SET_STROKE_WIDTH($menu; $strokeWidth; $isImageOnly)
	
	NEditor_MENU_SET_MARKER($menu; $marker; Not:C34($includesLine))
	
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_ASPECT_RATIO($menu; $preserveAspectRatio; Not:C34($includesImage))
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_FONT($menu; Not:C34($includesText))
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_FONT_SIZE($menu; $fontSize; Not:C34($includesText))
	NEditor_MENU_SET_TEXT_ALIGN($menu; $textAlign; Not:C34($includesText))
	NEditor_MENU_SET_DISPLAY_ALIGN($menu; $displayAlign; Not:C34($includesText))
	NEditor_MENU_SET_TEXT_STYLE($menu; $textStyle; Not:C34($includesText))
	APPEND MENU ITEM:C411($menu; "-")
	NEditor_MENU_SET_TEXT_OPTION($menu; $wrap; Not:C34($includesText))
	
	$command:=Dynamic pop up menu:C1006($menu)
	
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="@-tool")
			
			NEditor_SET_TOOL(Replace string:C233($command; "-tool"; ""; *))
			
		: ($command="fill-color")
			
			$color:=Color_Display_picker($fill; $x; $y)
			
			If ($color#$fill)
				NEditor_SET_DEFAULT_FILL($color)
				NEditor_SELECT_SET_FILL($Container; $color)
			End if 
			
		: ($command="stroke-color")
			
			$color:=Color_Display_picker($stroke; $x; $y)
			
			If ($color#$stroke)
				NEditor_SET_DEFAULT_STROKE($color)
				NEditor_SELECT_SET_STROKE($Container; $color)
			End if 
			
		: ($command="font-name")
			
			Fonts_DISPLAY_PICKER($fontName; $x; $y)
			
		: ($command="stroke-width-@")
			
			$width:=Num:C11(Replace string:C233($command; "stroke-width-"; ""; *))
			
			NEditor_SET_DEFAULT_WIDTH($width)
			NEditor_SELECT_SET_STROKE_WIDTH($Container; $width)
			
		: ($command="marker-@")
			
			$marker:=Replace string:C233($command; "marker-"; ""; *)
			NEditor_SET_DEFAULT_MARKER($marker)
			
			NEditor_SELECT_SET_MARKER($Container; $marker)
			
		: ($command="preserve-aspect-ratio")
			
			If ($preserveAspectRatio="true")
				$preserveAspectRatio:="false"
			Else 
				$preserveAspectRatio:="true"
			End if 
			
			NEditor_SELECT_SET_ASPECT_RATIO($Container; $preserveAspectRatio)
			
		: ($command="move-frontmost")
			
			NEditor_SELECT_MOVE_FRONT_MOST($Container)
			
		: ($command="move-backmost")
			
			NEditor_SELECT_MOVE_BACK_MOST($Container)
			
		: ($command="move-front")
			
			NEditor_SELECT_MOVE_FRONT($Container)
			
		: ($command="move-back")
			
			NEditor_SELECT_MOVE_BACK($Container)
			
		: ($command="stroke-opacity-@")
			
			NEditor_SELECT_SET_OPACITY($Container; Num:C11(Replace string:C233($command; "stroke-opacity-"; ""; *)))
			
		: ($command="fill-opacity-@")
			
			NEditor_SELECT_SET_FILL_OPACITY($Container; Num:C11(Replace string:C233($command; "fill-opacity-"; ""; *)))
			
		: ($command="align-vertical")
			
			NEditor_SELECT_ALIGN_VERTICAL($Container)
			
		: ($command="align-horizontal")
			
			NEditor_SELECT_ALIGN_HORIZONTAL($Container)
			
		: ($command="align-left")
			
			NEditor_SELECT_ALIGN_LEFT($Container)
			
		: ($command="align-right")
			
			NEditor_SELECT_ALIGN_RIGHT($Container)
			
		: ($command="align-top")
			
			NEditor_SELECT_ALIGN_TOP($Container)
			
		: ($command="align-bottom")
			
			NEditor_SELECT_ALIGN_BOTTOM($Container)
			
		: ($command="distribute-horizontal")
			
			NEditor_SELECT_DIST_HORIZONTAL($Container)
			
		: ($command="distribute-vertical")
			
			NEditor_SELECT_DIST_VERTICAL($Container)
			
		: ($command="font-size-@")
			
			NEditor_SELECT_SET_FONT_SIZE($Container; Num:C11(Replace string:C233($command; "font-size-"; ""; *)))
			
		: ($command="text-align-@")
			
			NEditor_SELECT_SET_HALIGN($Container; Replace string:C233($command; "text-align-"; ""; *))
			
		: ($command="display-align-@")
			
			NEditor_SELECT_SET_VALIGN($Container; Replace string:C233($command; "display-align-"; ""; *))
			
		: ($command="text-style-@")
			
			NEditor_SELECT_SET_TEXT_STYLE($Container; Replace string:C233($command; "text-style-"; ""; *))
			
		: ($command="word-wrap-@")
			
			NEditor_SELECT_SET_WRAP($Container; Replace string:C233($command; "word-wrap-"; ""; *))
			
	End case 
	
Else 
	
	NEditor_SET_OFFSET
	
	//because the image does not take focus from the text edit
	NEditor_TEXT_EDIT_End
	
	If (MouseX#-1) & (MouseY#-1)
		
		$tool:=NEditor_Get_tool
		
		$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
		$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
		$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
		
		GET MOUSE:C468($x; $y; $b)
		
		C_LONGINT:C283($scrH; $scrV)
		OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
		
		$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")
		$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")
		
		$MouseX:=$x-$OffsetX->+$scrH
		$MouseY:=$y-$OffsetY->+$scrV
		
		$OffsetH:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetH")
		$OffsetV:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetV")
		
		$ClickX->:=$MouseX
		$ClickY->:=$MouseY
		
		$MouseX:=$MouseX/$Zoom->
		$MouseY:=$MouseY/$Zoom->
		
		//MouseX,MouseY might be rounded
		//$ClickX->:=MouseX
		//$ClickY->:=MouseY
		
		If (NEditor_Get_debug_mode)
			$Debug_ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ClickX")
			$Debug_ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ClickY")
			$Debug_ClickX->:=$ClickX->
			$Debug_ClickY->:=$ClickY->
		End if 
		
		Case of 
			: ($tool="select")
				
				//change, drag-resize, drag-move, select
				NEditor_GROW_CLEAR
				
				If (Macintosh command down:C546)
					
					NEditor_EDIT_START($MouseX; $MouseY)
					
				Else 
					
					NEditor_SELECT_START($MouseX; $MouseY)
					
				End if 
				
			: ($tool="rect")
				
				NEditor_RECT_START($MouseX; $MouseY)
				
			: ($tool="line")
				
				NEditor_LINE_START($MouseX; $MouseY)
				
			: ($tool="circle")
				
				NEditor_ELLIPSE_START($MouseX; $MouseY)
				
			: ($tool="polyline")
				
				NEditor_POLYLINE_START($MouseX; $MouseY)
				
			: ($tool="text")
				
				NEditor_TEXT_START($MouseX; $MouseY)
				
		End case 
		
		CALL SUBFORM CONTAINER:C1086(-112)
		
	End if 
	
End if 