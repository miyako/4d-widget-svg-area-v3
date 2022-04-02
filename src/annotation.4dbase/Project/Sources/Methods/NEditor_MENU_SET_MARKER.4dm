//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2; $marker)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu; $disabled)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	If (Length:C16($menu)#0)
		$isSubMenu:=True:C214
	End if 
End if 

If ($params>1)
	$marker:=$2
Else 
	$marker:=NEditor_Get_default_marker
End if 

If ($params>2)
	$disabled:=$3
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:marker-end")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "marker-end")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/marker-end.svg")
If ($marker="end") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:marker-start")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "marker-start")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/marker-start.svg")
If ($marker="start") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:marker-both")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "marker-both")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/marker-both.svg")
If ($marker="both") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:marker-none")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "marker-none")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/marker-none.svg")
If ($marker="none") & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:marker"; $subMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 