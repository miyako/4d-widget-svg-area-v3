//%attributes = {"invisible":true}
C_LONGINT:C283($1; $type)
C_BOOLEAN:C305($0)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

If (Not:C34(Is nil pointer:C315($Container)))
	$type:=Choose:C955($1=Is longint:K8:6; Is real:K8:4; $1)
	Case of 
		: (Type:C295($Container->)=Is undefined:K8:13)
			
			Case of 
				: ($type=Is text:K8:3)
					C_TEXT:C284($Container->)
				: ($type=Is real:K8:4)
					C_REAL:C285($Container->)
				: ($type=Is time:K8:8)
					C_TIME:C306($Container->)
				: ($type=Is date:K8:7)
					C_DATE:C307($Container->)
			End case 
			
			CLEAR VARIABLE:C89($Container->)
			
		: (Type:C295($Container->)=$type)
			
	End case 
	
	If (Type:C295($Container->)#$type)
		ASSERT:C1129(False:C215; "subform container type is incorrect")
	Else 
		$0:=True:C214
	End if 
	
End if 