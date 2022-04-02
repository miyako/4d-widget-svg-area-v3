//%attributes = {"invisible":true}
$FillColorIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillColorIcon")
If (Picture size:C356($FillColorIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"fill.svg"; $FillColorIcon->)
End if 

$StrokeColorIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeColorIcon")
If (Picture size:C356($StrokeColorIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"stroke.svg"; $StrokeColorIcon->)
End if 

$StrokeWidthIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeWidthIcon")
If (Picture size:C356($StrokeWidthIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"stroke-width.svg"; $StrokeWidthIcon->)
End if 

$StrokeOpacityIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeOpacityIcon")
If (Picture size:C356($StrokeOpacityIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"stroke-opacity.svg"; $StrokeOpacityIcon->)
End if 

$FillOpacityIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillOpacityIcon")
If (Picture size:C356($FillOpacityIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"fill-opacity.svg"; $FillOpacityIcon->)
End if 

$MarkerIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "MarkerIcon")
If (Picture size:C356($MarkerIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"marker.svg"; $MarkerIcon->)
End if 

$StrokeComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "StrokeComboIcon")
If (Picture size:C356($StrokeComboIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"stroke-combo.svg"; $StrokeComboIcon->)
End if 

$FillComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "FillComboIcon")
If (Picture size:C356($FillComboIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"fill-combo.svg"; $FillComboIcon->)
End if 

$MoveComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "MoveComboIcon")
If (Picture size:C356($MoveComboIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"move-combo.svg"; $MoveComboIcon->)
End if 

$AlignComboIcon:=OBJECT Get pointer:C1124(Object named:K67:5; "AlignComboIcon")
If (Picture size:C356($AlignComboIcon->)=0)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"align-combo.svg"; $AlignComboIcon->)
End if 