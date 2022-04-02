//%attributes = {"invisible":true}
C_TEXT:C284($1; $thisName)

$params:=Count parameters:C259

If ($params#0)
	
	If (Length:C16($1)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684)
		
	End if 
	
Else 
	
	C_LONGINT:C283($scrH; $scrV)
	OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
	
	NEditor_RESIZE($scrV; $scrH)
	
End if 