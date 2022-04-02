//%attributes = {"invisible":true}
$DOCUMENT:=DOCUMENT  //READ PICTURE FILE over-writes DOCUMENT

$OffsetH:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetH")
$OffsetV:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetV")

C_LONGINT:C283($left; $top; $right; $bottom)
OBJECT GET COORDINATES:C663(*; "Bg"; $left; $top; $right; $bottom)
$OffsetH->:=$left
$OffsetV->:=$top

C_LONGINT:C283($width; $height)

If (WIDGET_Asserted(Is text:K8:3))
	OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
	$margin:=$left
	$doubleMargin:=$margin+$margin
	$right:=$width-$margin
	$bottom:=$height-$margin
	OBJECT MOVE:C664(*; "Image"; $left; $top; $right; $bottom; *)
	OBJECT MOVE:C664(*; "Bg"; $left; $top; $right; $bottom; *)
	OBJECT MOVE:C664(*; "BgImage"; $left; $top; $right; $bottom; *)
	OBJECT MOVE:C664(*; "BgImageDisplay"; $left; $top; $right; $bottom; *)
	//not called because we assign a value to the container in NEditor_INIT
	//CALL SUBFORM CONTAINER(-109)
Else 
	FORM GET PROPERTIES:C674("Editor"; $width; $bottom)
	OBJECT MOVE:C664(*; "Image"; $left; $top; $right; $bottom; *)
	OBJECT MOVE:C664(*; "Bg"; $left; $top; $right; $bottom; *)
	OBJECT MOVE:C664(*; "BgImage"; $left; $top; $right; $bottom; *)
	OBJECT MOVE:C664(*; "BgImageDisplay"; $left; $top; $right; $bottom; *)
End if 

$Init:=OBJECT Get pointer:C1124(Object named:K67:5; "Init")

If (0=$Init->)
	
	//pragma once
	
	$Init->:=1
	
	If (False:C215)
		NEditor_SET_DEBUG_MODE(Not:C34(NEditor_Is_component))  //before NEditor_INIT
		NEditor_SET_DEBUG_MODE(Not:C34(Is compiled mode:C492))
	Else 
		NEditor_SET_DEBUG_MODE(False:C215)
	End if 
	NEditor_SET_IMAGE_RENDERING("optimizeQuality")  //before NEditor_INIT
	
	NEditor_INIT($right-$left; $bottom-$top)
	
	NEditor_INIT_ICONS
	
	NEditor_INIT_POSITIONS
	
	$AutoFont:=OBJECT Get pointer:C1124(Object named:K67:5; "AutoFont")
	If (Version_14_or_later)
		$AutoFont->:=OBJECT Get font:C1069(*; "AutoFont")
	Else 
		$AutoFont->:="Lucida Grande"
	End if 
	
	NEditor_SET_TOOL("polyline")
	NEditor_TOOL_SET_ENABLED(False:C215)
	
	//defaults
	NEditor_SET_DEFAULT_FILL(4; True:C214)
	NEditor_SET_DEFAULT_STROKE(220; True:C214)
	NEditor_SET_DEFAULT_WIDTH(3; True:C214)
	NEditor_SET_DEFAULT_F_OPACITY(0; True:C214)
	NEditor_SET_DEFAULT_OPACITY(100; True:C214)
	NEditor_SET_DEFAULT_MARKER("none"; True:C214)
	
	NEditor_SET_SELECT_RENDERING("geometricPrecision")
	
	NEditor_SET_STEP_X(10)
	NEditor_SET_STEP_Y(10)
	NEditor_SET_DEFAULT_TEXT(Get localized string:C991("default-text"))
	
	//for color picker
	NEditor_SET_POPUP_OFFSET_X(-15)
	NEditor_SET_POPUP_OFFSET_Y(5)
	
	//filter support in D2D is from 14R5
	NEditor_SET_Direct2D(Version_14R5_or_later)
	
	NEditor_SET_TIMER_FOR_DRAW(1)
	NEditor_SET_TIMER_FOR_EVENT(3)
	
	NEditor_SET_MENU
	
End if 

DOCUMENT:=$DOCUMENT