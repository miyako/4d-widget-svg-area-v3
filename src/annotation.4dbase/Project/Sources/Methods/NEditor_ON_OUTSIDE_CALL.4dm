//%attributes = {"invisible":true}
C_TEXT:C284($1)

$params:=Count parameters:C259

If ($params#0)
	
	If (Length:C16($1)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; *; "")
		
	Else 
		
		$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		
		NEditor_SELECT_SET_FONT($Container; <>LABEL_FONT_NAME)
		
		OBJECT SET FONT:C164(*; "TextEdit"; <>LABEL_FONT_NAME)
		//OBJECT SET FONT(*;"Variable";<>LABEL_FONT_NAME)
		
		CALL SUBFORM CONTAINER:C1086(-112)
		
	End if 
	
End if 