//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_REAL:C285($2; $fontSize)
C_BOOLEAN:C305($3; $disabled)
C_TEXT:C284($0)

C_BOOLEAN:C305($isSubMenu)

$params:=Count parameters:C259

If ($params#0)
	$menu:=$1
	$isSubMenu:=True:C214
End if 

If ($params>1)
	$fontSize:=$2
End if 

If ($params>2)
	$disabled:=$3
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 9")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-9")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-9.svg")
If ($fontSize=9) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 10")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-10")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-10.svg")
If ($fontSize=10) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 11")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-11")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-11.svg")
If ($fontSize=11) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 12")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-12")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-12.svg")
If ($fontSize=12) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 13")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-13")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-13.svg")
If ($fontSize=13) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 14")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-14")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-14.svg")
If ($fontSize=14) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 16")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-16")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-16.svg")
If ($fontSize=16) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 18")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-18")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-18.svg")
If ($fontSize=18) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 20")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-20")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-20.svg")
If ($fontSize=20) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 22")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-22")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-22.svg")
If ($fontSize=22) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 24")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-24")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-24.svg")
If ($fontSize=24) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:font size 36")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "font-size-36")
//SET MENU ITEM ICON($subMenu;-1;"file:images/font-size-36.svg")
If ($fontSize=36) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:font size"; $subMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 