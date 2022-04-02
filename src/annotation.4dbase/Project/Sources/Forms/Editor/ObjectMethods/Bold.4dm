$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

C_BOOLEAN:C305($includesText)
$textStyle:=NEditor_SELECT_Get_text_style($Container; ->$includesText)

If ($includesText)
	
	$style:=OBJECT Get font style:C1071(*; "TextEdit")
	
	If ($textStyle="@bold@")
		NEditor_SELECT_SET_TEXT_STYLE($Container; "bold-remove")
		OBJECT SET FONT STYLE:C166(*; "TextEdit"; $style ?- 0)
	Else 
		NEditor_SELECT_SET_TEXT_STYLE($Container; "bold")
		OBJECT SET FONT STYLE:C166(*; "TextEdit"; $style ?+ 0)
	End if 
End if 