//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2; $disabled)
C_BOOLEAN:C305($3; $fillOnly; $4; $strokeOnly)
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

If ($params>2)
	$fillOnly:=$3
End if 

If ($params>2)
	$strokeOnly:=$4
End if 

Case of 
	: ($strokeOnly)
		
		APPEND MENU ITEM:C411($menu; ":xliff:stroke...")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "stroke-color")
		
	: ($fillOnly)
		
		APPEND MENU ITEM:C411($menu; ":xliff:fill...")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "fill-color")
		
	Else 
		
		$subMenu:=Create menu:C408
		
		APPEND MENU ITEM:C411($subMenu; ":xliff:fill")
		SET MENU ITEM PARAMETER:C1004($subMenu; -1; "fill-color")
		SET MENU ITEM ICON:C984($subMenu; -1; "file:images/fill.svg")
		
		APPEND MENU ITEM:C411($subMenu; ":xliff:stroke")
		SET MENU ITEM PARAMETER:C1004($subMenu; -1; "stroke-color")
		SET MENU ITEM ICON:C984($subMenu; -1; "file:images/stroke.svg")
		
		If ($isSubMenu)
			APPEND MENU ITEM:C411($menu; ":xliff:color"; $subMenu)
			RELEASE MENU:C978($subMenu)
			If ($disabled)
				DISABLE MENU ITEM:C150($menu; -1)
			End if 
		Else 
			$0:=$subMenu
		End if 
		
End case 