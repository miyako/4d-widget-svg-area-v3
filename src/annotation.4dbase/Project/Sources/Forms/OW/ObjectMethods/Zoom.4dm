$event:=Form event code:C388


Case of 
	: ($event=On Load:K2:1)
		
		Self:C308->:=NEditor_Get_zoom("Editor")*100
		
	: ($event=On Clicked:K2:4) | ($event=On Data Change:K2:15)
		
		NEditor_SET_ZOOM("Editor"; Self:C308->/100)
		
End case 