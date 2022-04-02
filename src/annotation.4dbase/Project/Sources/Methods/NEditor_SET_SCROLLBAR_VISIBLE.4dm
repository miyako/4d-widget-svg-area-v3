//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

$params:=Count parameters:C259

If ($params>1)
	
	If (Length:C16($1)#0)
		
		If ($2#NEditor_Get_scrollbar_visible($1))
			
			EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; *; ""; $2)
			
		End if 
		
	Else 
		
		$IsScrollbarVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "IsScrollbarVisible")
		$IsScrollbarVisible->:=Num:C11($2)
		
		NEditor_DISPLAY_SCROLLBAR
		
	End if 
	
End if 