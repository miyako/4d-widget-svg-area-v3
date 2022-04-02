//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2; $textStyle)
C_BOOLEAN:C305($3; $disabled)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	$isSubMenu:=True:C214
End if 

If ($params>1)
	$textStyle:=$2
End if 

If ($params>2)
	$disabled:=$3
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:text style italic")
If ($textStyle="@italic@") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
	SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-style-italic-remove")
Else 
	SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-style-italic")
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:text style bold")
If ($textStyle="@bold@") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
	SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-style-bold-remove")
Else 
	SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-style-bold")
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:text style underline")
If ($textStyle="@underline@") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
	SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-style-underline-remove")
Else 
	SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-style-underline")
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:text style"; $subMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 
