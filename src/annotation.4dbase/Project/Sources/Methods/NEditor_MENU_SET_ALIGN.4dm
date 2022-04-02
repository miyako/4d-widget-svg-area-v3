//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2; $disabled)
C_BOOLEAN:C305($3; $disabled2)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	$isSubMenu:=True:C214
End if 

If ($params>1)
	$disabled:=$2
	If ($params>2)
		$disabled2:=$3
	End if 
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:align-left")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "align-left")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/align-left.svg")
If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:align-right")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "align-right")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/align-right.svg")
If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:align-top")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "align-top")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/align-top.svg")
If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:align-bottom")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "align-bottom")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/align-bottom.svg")
If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; "-")

APPEND MENU ITEM:C411($subMenu; ":xliff:align-horizontal")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "align-horizontal")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/align-horizontal.svg")
If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:align-vertical")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "align-vertical")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/align-vertical.svg")
If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; "-")

APPEND MENU ITEM:C411($subMenu; ":xliff:distribute-horizontal")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "distribute-horizontal")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/distribute-horizontal.svg")
If ($disabled2)
	DISABLE MENU ITEM:C150($subMenu; -1)
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:distribute-vertical")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "distribute-vertical")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/distribute-vertical.svg")
If ($disabled2)
	DISABLE MENU ITEM:C150($subMenu; -1)
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:align"; $subMenu)
	RELEASE MENU:C978($subMenu)
Else 
	$0:=$subMenu
End if 
