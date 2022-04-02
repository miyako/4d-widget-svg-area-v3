$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		NEditor_ON_LOAD
		
		If (Not:C34(Is nil pointer:C315($Container)))
			
			$event:=On Bound Variable Change:K2:52
			
		Else 
			
			OBJECT SET VISIBLE:C603(*; "@"; False:C215)
			
		End if 
		
End case 

If (Not:C34(Is nil pointer:C315($Container)))
	
	Case of 
		: ($event=On Bound Variable Change:K2:52)
			
			NEditor_ON_DATA_CHANGE
			
		: ($event=On Activate:K2:9)
			
			NEditor_ON_FOCUS
			
		: ($event=On Deactivate:K2:10)
			
			NEditor_ON_BLUR
			
		: ($event=On Unload:K2:2)
			
			NEditor_ON_UNLOAD
			
		: ($event=On Timer:K2:25)
			
			NEditor_ON_TIMER
			
	End case 
	
End if 