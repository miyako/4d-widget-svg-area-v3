//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$SearchText:=OBJECT Get pointer:C1124(Object named:K67:5; "SearchText")

If (Length:C16($Container->)#0)
	
	$SearchText->:=$Container->
	
End if 