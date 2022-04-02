//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)

$GrowObjectIds:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectIds")
$GrowObjectReverses:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectReverses")

$id:=$1

$find:=Find in array:C230($GrowObjectIds->; $id)

If ($find#-1)
	
	$GrowObjectReverses:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectReverses")
	$GrowObjectReverses->{$find}:=Not:C34($GrowObjectReverses->{$find})
	
End if 