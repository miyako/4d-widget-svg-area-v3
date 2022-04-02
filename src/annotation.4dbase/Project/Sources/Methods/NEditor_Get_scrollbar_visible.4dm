//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($0; $returnValue)

$params:=Count parameters:C259

If ($params#0)
	
	If (Length:C16($1)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; $returnValue; "")
		
	Else 
		
		$IsScrollbarVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrollbarVisible")
		$returnValue:=(1=$IsScrollbarVisible->)
		
	End if 
	
End if 

$0:=$returnValue