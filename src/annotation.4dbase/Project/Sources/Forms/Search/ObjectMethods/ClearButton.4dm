$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$event:=Form event code:C388

Case of 
	: ($event=On Clicked:K2:4)
		
		$SearchText:=OBJECT Get pointer:C1124(Object named:K67:5; "SearchText")
		$SearchText->:=""
		
		OBJECT SET VISIBLE:C603(*; "ClearButton"; False:C215)
		
		If (Not:C34(Is nil pointer:C315($Container)))
			$Container->:=$SearchText->
			CALL SUBFORM CONTAINER:C1086(-103)
		End if 
		
End case 