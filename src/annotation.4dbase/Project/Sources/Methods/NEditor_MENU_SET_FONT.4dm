//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2; $disabled)
C_TEXT:C284($0)

$menu:=$1
$disabled:=$2

APPEND MENU ITEM:C411($menu; ":xliff:font name")
SET MENU ITEM PARAMETER:C1004($menu; -1; "font-name")

If ($disabled)
	DISABLE MENU ITEM:C150($menu; -1)
End if 