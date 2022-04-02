//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_REAL:C285($2; $strokeWidth)
C_BOOLEAN:C305($3; $disabled)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	If (Length:C16($menu)#0)
		$isSubMenu:=True:C214
	End if 
End if 

If ($params>1)
	$strokeWidth:=$2
Else 
	$strokeWidth:=NEditor_Get_default_width
End if 

If ($params>2)
	$disabled:=$3
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 0")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-0")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-0.svg")
If ($strokeWidth=0) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 1")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-1")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-1.svg")
If ($strokeWidth=1) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 2")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-2")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-2.svg")
If ($strokeWidth=2) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 3")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-3")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-3.svg")
If ($strokeWidth=3) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 4")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-4")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-4.svg")
If ($strokeWidth=4) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 5")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-5")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-5.svg")
If ($strokeWidth=5) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 6")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-6")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-6.svg")
If ($strokeWidth=6) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 7")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-7")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-7.svg")
If ($strokeWidth=7) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 8")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-8")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-8.svg")
If ($strokeWidth=8) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:stroke width 9")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-width-9")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke-width-9.svg")
If ($strokeWidth=9) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:stroke width"; $subMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 