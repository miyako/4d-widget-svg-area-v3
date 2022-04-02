//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)

$params:=Count parameters:C259

If ($params>2)
	
	If (Length:C16($1)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; *; ""; $2; $3)
		
	Else 
		
		$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")  //x of container
		$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")  //y of container
		$OffsetH:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetH")  //x of image in Editor
		$OffsetV:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetV")  //y of image in Editor
		
		$OffsetX->:=$2+$OffsetH->
		$OffsetY->:=$3+$OffsetV->
		
	End if 
	
End if 

//note: we could use convert coordinates in v16
