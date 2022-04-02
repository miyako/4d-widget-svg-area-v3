$event:=NEditor_Form_event(OBJECT Get name:C1087(Object current:K67:2))

Case of 
	: ($event=-On Load:K2:1)  //form is ready
		
		$path:=Get 4D folder:C485(Database folder:K5:14)+"x.jpg"
		READ PICTURE FILE:C678($path; $picture)
		
		NEditor_SET_IMAGE("Editor"; $picture)
		
End case 