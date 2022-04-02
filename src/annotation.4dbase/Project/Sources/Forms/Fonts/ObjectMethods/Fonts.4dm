$Fonts:=OBJECT Get pointer:C1124(Object current:K67:2)
$thisName:=OBJECT Get name:C1087(Object current:K67:2)

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		<>LABEL_FONT_EDITOR_VISIBLE:=True:C214
		
	: ($event=On Unload:K2:2)
		
		If (Is a list:C621($Fonts->))
			CLEAR LIST:C377($Fonts->; *)
		End if 
		
		<>LABEL_FONT_EDITOR_VISIBLE:=False:C215
		
	: ($event=On Getting Focus:K2:7)
		
		SELECT LIST ITEMS BY POSITION:C381(*; $thisName; 1)
		
	: ($event=On Double Clicked:K2:5)
		
		$thisName:=OBJECT Get name:C1087(Object current:K67:2)
		
		C_LONGINT:C283($itemRef)
		C_TEXT:C284($itemText)
		GET LIST ITEM:C378(*; $thisName; *; $itemRef; $itemText)
		
		If ($itemRef#0) & ($itemText#<>LABEL_FONT_NAME)
			
			<>LABEL_FONT_NAME:=$itemText
			POST OUTSIDE CALL:C329(Current process:C322)
			ACCEPT:C269
			
		Else 
			
			CANCEL:C270
			
		End if 
		
	: ($event=On Selection Change:K2:29)
		
		$thisName:=OBJECT Get name:C1087(Object current:K67:2)
		
		C_LONGINT:C283($itemRef)
		C_TEXT:C284($itemText; $fontName)
		GET LIST ITEM:C378(*; $thisName; *; $itemRef; $itemText)
		GET LIST ITEM PARAMETER:C985(*; $thisName; *; "font-name"; $fontName)
		
		If ($itemRef#0) & ($thisName#<>LABEL_FONT_NAME)
			
			<>LABEL_FONT_NAME:=$fontName
			POST OUTSIDE CALL:C329(Current process:C322)
			
		End if 
		
End case 