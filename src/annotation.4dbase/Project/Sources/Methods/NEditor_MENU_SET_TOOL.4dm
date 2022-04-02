//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($0)

$tool:=NEditor_Get_tool

C_BOOLEAN:C305($isSubMenu)

If (Count parameters:C259#0)
	$menu:=$1
	$isSubMenu:=True:C214
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:select-tool")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/select-tool.svg")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "select-tool")
If ($tool="select")
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:polyline-tool")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/polyline-tool.svg")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "polyline-tool")
If ($tool="polyline")
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:text-tool")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/text-tool.svg")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "text-tool")
If ($tool="text")
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:line-tool")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/line-tool.svg")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "line-tool")
If ($tool="line")
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:rect-tool")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/rect-tool.svg")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "rect-tool")
If ($tool="rect")
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:circle-tool")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/circle-tool.svg")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "circle-tool")
If ($tool="circle")
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:tool"; $subMenu)
	RELEASE MENU:C978($subMenu)
	Case of 
		: ($tool="select")
			SET MENU ITEM ICON:C984($menu; -1; "file:images/select-tool.svg")
		: ($tool="polyline")
			SET MENU ITEM ICON:C984($menu; -1; "file:images/polyline-tool.svg")
		: ($tool="text")
			SET MENU ITEM ICON:C984($menu; -1; "file:images/text-tool.svg")
		: ($tool="line")
			SET MENU ITEM ICON:C984($menu; -1; "file:images/line-tool.svg")
		: ($tool="rect")
			SET MENU ITEM ICON:C984($menu; -1; "file:images/rect-tool.svg")
		: ($tool="circle")
			SET MENU ITEM ICON:C984($menu; -1; "file:images/circle-tool.svg")
	End case 
Else 
	$0:=$subMenu
End if 
