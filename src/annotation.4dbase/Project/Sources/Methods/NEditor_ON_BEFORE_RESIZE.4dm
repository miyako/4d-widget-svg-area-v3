//%attributes = {"invisible":true}
C_TEXT:C284($1; $thisName)

$params:=Count parameters:C259

If ($params#0)
	
	If (Length:C16($1)#0)
		
		If (Not:C34(NEditor_Is_resizing($1)))
			
			EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684)
			
		End if 
		
	End if 
	
Else 
	
	NEditor_TEXT_EDIT_End
	
	$IsResizing:=OBJECT Get pointer:C1124(Object named:K67:5; "IsResizing")
	$IsResizing->:=1
	
	NEditor_DISPLAY_BACKGROUND(False:C215)
	
	SET TIMER:C645(-1)
	
End if 