//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2; $wrap)
C_BOOLEAN:C305($3; $disabled)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	$isSubMenu:=True:C214
End if 

If ($params>1)
	$wrap:=$2
End if 

If ($params>2)
	$disabled:=$3
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:word-wrap-enabled")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "word-wrap-enabled")
If ($wrap="true") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:word-wrap-disabled")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "word-wrap-disabled")
If ($wrap="false") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

If ($isSubMenu)
	$textOptionMenu:=Create menu:C408
	APPEND MENU ITEM:C411($textOptionMenu; ":xliff:word-wrap"; $subMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:text-option"; $textOptionMenu)
	RELEASE MENU:C978($textOptionMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 





