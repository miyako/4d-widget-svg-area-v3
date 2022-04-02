//%attributes = {"invisible":true}
$stepX:=NEditor_Get_step_x
$stepY:=NEditor_Get_step_y

$pasteX:=NEditor_Get_paste_x
$pasteY:=NEditor_Get_paste_y
$pasteZ:=NEditor_Get_paste_z

NEditor_SET_PASTE_X($pasteX+$stepX)
NEditor_SET_PASTE_Y($pasteY+$stepY)

