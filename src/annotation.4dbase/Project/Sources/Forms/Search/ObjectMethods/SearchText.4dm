$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$SearchText:=OBJECT Get pointer:C1124(Object current:K67:2)

$event:=Form event code:C388

Case of 
	: ($event=On Getting Focus:K2:7)
		
		OBJECT SET VISIBLE:C603(*; "FocusRing@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "ClearButton"; (Length:C16($SearchText->)#0))
		
	: ($event=On Losing Focus:K2:8)
		
		OBJECT SET VISIBLE:C603(*; "FocusRing@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ClearButton"; False:C215)
		
	: ($event=On After Edit:K2:43)
		
		If (Not:C34(Is nil pointer:C315($Container)))
			$Container->:=Get edited text:C655
			CALL SUBFORM CONTAINER:C1086(-103)
		End if 
		
		OBJECT SET VISIBLE:C603(*; "ClearButton"; (Length:C16(Get edited text:C655)#0))
		
End case 