$event:=Form event code:C388

Case of 
	: ($event=On Drag Over:K2:13)
		
		$0:=NEditor_On_drag_over
		
	: ($event=On Drop:K2:12)
		
		NEditor_ON_DROP
		
	: ($event=On Clicked:K2:4)
		
		NEditor_ON_CLICKED
		
	: ($event=On Double Clicked:K2:5)
		
		NEditor_ON_DOUBLE_CLICKED
		
	: ($event=On Scroll:K2:57)
		
		NEditor_ON_SCROLL
		
End case 