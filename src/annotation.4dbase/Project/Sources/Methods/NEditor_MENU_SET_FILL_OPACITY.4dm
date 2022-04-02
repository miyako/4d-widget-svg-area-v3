//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_REAL:C285($2; $fillOpacity)
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
	$fillOpacity:=$2
Else 
	$fillOpacity:=NEditor_Get_default_f_opacity/100
End if 

If ($params>2)
	$disabled:=$3
End if 

$subMenu:=Create menu:C408

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 0")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-0")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-0.svg")
If ($fillOpacity=0) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 10")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-10")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-10.svg")
If ($fillOpacity=0.1) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 20")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-20")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-20.svg")
If ($fillOpacity=0.2) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 30")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-30")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-30.svg")
If ($fillOpacity=0.3) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 40")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-40")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-40.svg")
If ($fillOpacity=0.4) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 50")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-50")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-50.svg")
If ($fillOpacity=0.5) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 60")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-60")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-60.svg")
If ($fillOpacity=0.6) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 70")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-70")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-70.svg")
If ($fillOpacity=0.7) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 80")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-80")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-80.svg")
If ($fillOpacity=0.8) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 90")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-90")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-90.svg")
If ($fillOpacity=0.9) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

APPEND MENU ITEM:C411($subMenu; ":xliff:fill opacity 100")
SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-opacity-100")
SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill-opacity-100.svg")
If ($fillOpacity=1) & (Not:C34($disabled))
	SET MENU ITEM MARK:C208($subMenu; -1; Char:C90(18))
End if 

If ($isSubMenu)
	APPEND MENU ITEM:C411($menu; ":xliff:fill opacity"; $subMenu)
	RELEASE MENU:C978($subMenu)
	If ($disabled)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
Else 
	$0:=$subMenu
End if 