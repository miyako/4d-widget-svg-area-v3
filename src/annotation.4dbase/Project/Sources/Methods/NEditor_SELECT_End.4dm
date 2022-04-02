//%attributes = {"invisible":true}
C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $shouldRedraw; $shouldUpdate)

$MouseX:=$1
$MouseY:=$2

//did selection change?
$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$SelectionChanged->:=NEditor_Is_new_selection($Container->)

$select:=NEditor_SELECT_Get

If (Length:C16($select)#0)
	
	DOM REMOVE XML ELEMENT:C869($select)
	
	NEditor_SELECT_SET("")
	
	$shouldRedraw:=True:C214
	
Else   //handle manipulation
	
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	
	$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
	$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
	
	C_LONGINT:C283($count; $i)
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$count:=NEditor_SELECT_Get_count($Container->)
	
	If ($count#0)
		$handleId:=NEditor_Get_handle
		If (Length:C16($handleId)#0)
			For ($i; 1; $count)
				$shouldUpdate:=$shouldUpdate | NEditor_SELECT_Resize(NEditor_SELECT_Get_id($Container->; $i); (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); True:C214; Shift down:C543)
			End for 
		Else 
			For ($i; 1; $count)
				$shouldUpdate:=$shouldUpdate | NEditor_SELECT_Move(NEditor_SELECT_Get_id($Container->; $i); (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); True:C214; Shift down:C543)
			End for 
		End if 
		NEditor_SET_HANDLE("")
		$shouldRedraw:=True:C214
	End if 
End if 

If ($shouldRedraw)
	If (Not:C34($shouldUpdate))
		//this will erase the selection rect
		$Image->:=NEditor_Get_layer_image($Container->)
	End if 
End if 

//this will update the container variable and canvas with new editor attributes
$0:=$shouldUpdate