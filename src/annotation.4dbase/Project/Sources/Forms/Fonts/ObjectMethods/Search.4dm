$Search:=OBJECT Get pointer:C1124(Object current:K67:2)

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		$Search->:=<>LABEL_FONT_NAME
		
		If (Length:C16($Search->)=0)
			$AutoFont:=OBJECT Get pointer:C1124(Object named:K67:5; "AutoFont")
			$AutoFont->:=OBJECT Get font:C1069(*; "AutoFont")
			$Search->:=$AutoFont->
		End if 
		
		Fonts_ON_DATA_CHANGE
		
	: ($event=-103)
		
		Fonts_ON_DATA_CHANGE
		
End case 