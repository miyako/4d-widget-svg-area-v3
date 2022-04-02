//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_REAL:C285($0; $returnValue)

$params:=Count parameters:C259

If ($params#0)
	
	If (Length:C16($1)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; $returnValue; "")
		
		$0:=$returnValue
		
	Else 
		
		$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		
		$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
		
		C_REAL:C285($r)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:r"; $r)
		
		$0:=$r
		
	End if 
	
End if 