$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		Search_ON_LOAD
		
		If (Not:C34(Is nil pointer:C315($Container)))
			
			$event:=On Bound Variable Change:K2:52
			
		End if 
		
End case 

Case of 
	: ($event=On Bound Variable Change:K2:52)
		
		Search_ON_DATA_CHANGE
		
	: ($event=On Activate:K2:9)
		
		Search_ON_FOCUS
		
	: ($event=On Deactivate:K2:10)
End case 
