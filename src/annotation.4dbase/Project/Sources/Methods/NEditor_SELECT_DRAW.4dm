//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

C_BOOLEAN:C305($shouldRedraw)

$MouseX:=$1
$MouseY:=$2

$select:=NEditor_SELECT_Get

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

If (Length:C16($select)#0)
	
	C_REAL:C285($width; $height)
	C_REAL:C285($x; $y)
	
	$width:=Abs:C99($MouseX-$ClickX->)
	$height:=Abs:C99($MouseY-$ClickY->)
	
	If ($MouseX>$ClickX->)
		$x:=$ClickX->
	Else 
		$x:=$MouseX
	End if 
	If ($MouseY>$ClickY->)
		$y:=$ClickY->
	Else 
		$y:=$MouseY
	End if 
	
	$translate:="translate("+Str($x/$Zoom->)+","+Str($y/$Zoom->)+")"
	$transform:=$translate
	
	If (NEditor_SELECT_Objects($x; $y; $width; $height))
		//only update if the selection has changed
		$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
		$SelectionChanged->:=1
		$shouldRedraw:=True:C214
		DOM SET XML ATTRIBUTE:C866($select; "width"; $width/$Zoom->; "height"; $height/$Zoom->; "transform"; $transform)
		
		NEditor_TOOL_UPDATE
		
	Else 
		//this is enough to simply draw the rect 
		SVG SET ATTRIBUTE:C1055($Image->; "select"; "width"; $width/$Zoom->; "height"; $height/$Zoom->; "transform"; $transform)
	End if 
	
Else   //handle manipulation
	
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	
	C_LONGINT:C283($count; $i)
	
	$count:=NEditor_SELECT_Get_count($Container->)
	
	If ($count#0)
		$handleId:=NEditor_Get_handle
		If (Length:C16($handleId)#0)
			For ($i; 1; $count)
				NEditor_SELECT_Resize(NEditor_SELECT_Get_id($Container->; $i); (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); False:C215; Shift down:C543)
			End for 
		Else 
			For ($i; 1; $count)
				NEditor_SELECT_Move(NEditor_SELECT_Get_id($Container->; $i); (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); False:C215; Shift down:C543)
			End for 
		End if 
		$shouldRedraw:=False:C215
	End if 
End if 

If ($shouldRedraw)
	$Image->:=NEditor_Get_layer_image($Container->)
End if 