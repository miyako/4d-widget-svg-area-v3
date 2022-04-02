//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($0)

$list:=New list:C375

FONT LIST:C460($fonts)

C_LONGINT:C283($i; $itemRef)

$itemRef:=1

$name:=$1+"@"

For ($i; 1; Size of array:C274($fonts))
	
	If (Version_14_or_later)
		$fontName:=$fonts{$i}
		$fontFamilyName:=$fonts{$i}
	Else 
		$fontName:=Font_get_name($fonts{$i})
		$fontFamilyName:=Font_get_localized_name($fonts{$i})
	End if 
	
	If ($fontFamilyName=$name)
		
		APPEND TO LIST:C376($list; $fontFamilyName; $itemRef)
		SET LIST ITEM PARAMETER:C986($list; $itemRef; "font-family-name"; $fontFamilyName)
		SET LIST ITEM PARAMETER:C986($list; $itemRef; "font-name"; $fontName)
		SET LIST ITEM FONT:C953($list; $itemRef; $fontName)
		
		$itemRef:=$itemRef+1
		
	End if 
	
End for 

$0:=$list