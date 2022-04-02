$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$DomCanvas:=OBJECT Get pointer:C1124(Object named:K67:5; "DomCanvas")

C_BOOLEAN:C305($includesText)
$textStyle:=NEditor_SELECT_Get_text_style($Container; ->$includesText)

If ($includesText)
	
	$style:=OBJECT Get font style:C1071(*; "TextEdit")
	
	If ($textStyle="@italic@")
		NEditor_SELECT_SET_TEXT_STYLE($Container; "italic-remove")
		OBJECT SET FONT STYLE:C166(*; "TextEdit"; $style ?- 1)
	Else 
		NEditor_SELECT_SET_TEXT_STYLE($Container; "italic")
		OBJECT SET FONT STYLE:C166(*; "TextEdit"; $style ?+ 1)
	End if 
End if 