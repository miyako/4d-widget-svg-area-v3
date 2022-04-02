$event:=Form event code:C388

Case of 
	: ($event=On Clicked:K2:4)
		
		$SelectedColorId:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectedColorId")
		SET WINDOW TITLE:C213(Replace string:C233($SelectedColorId->; "color"; ""; *); Current form window:C827)
		
		ACCEPT:C269
		
End case 
