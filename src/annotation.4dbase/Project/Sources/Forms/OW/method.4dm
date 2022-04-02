$event:=NEditor_Form_event("Editor")

Case of 
	: ($event=On Load:K2:1)
		
		NEditor_SET_SCROLLBAR_VISIBLE("Editor"; True:C214)
		
		SET TIMER:C645(-1)
		
	: ($event=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$path:=Get 4D folder:C485(Database folder:K5:14)+"x.jpg"
		READ PICTURE FILE:C678($path; $picture)
		
		NEditor_SET_IMAGE("Editor"; $picture)
		
End case 