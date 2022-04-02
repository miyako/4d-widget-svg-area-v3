//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2; $disabled)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	$isSubMenu:=True:C214
End if 

If ($params>1)
	$disabled:=$2
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:move frontmost")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "move-frontmost")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/move-front-most.svg")

APPEND MENU ITEM:C411($subMenu; ":xliff:move backmost")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "move-backmost")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/move-back-most.svg")

APPEND MENU ITEM:C411($subMenu; ":xliff:move front")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "move-front")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/move-front.svg")

APPEND MENU ITEM:C411($subMenu; ":xliff:move back")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "move-back")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/move-back.svg")

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:z order"; $subMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 