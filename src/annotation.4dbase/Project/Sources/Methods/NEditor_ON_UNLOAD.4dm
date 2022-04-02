//%attributes = {"invisible":true}
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
$DomDocument:=OBJECT Get pointer:C1124(Object named:K67:5; "DomDocument")
$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

If (Length:C16($Container->)#0)
	
	If (Length:C16($DomDocument->)#0)
		DOM CLOSE XML:C722($DomDocument->)
		CLEAR VARIABLE:C89($DomDocument->)  //=$Container->
		CLEAR VARIABLE:C89($Image->)
	End if 
	
	If (Length:C16($DomBgImage->)#0)
		DOM CLOSE XML:C722($DomBgImage->)
		CLEAR VARIABLE:C89($DomBgImage->)
		CLEAR VARIABLE:C89($BgImage->)
	End if 
End if 

SET TIMER:C645(0)