//%attributes = {"invisible":true}
$menu:=Create menu:C408
$file:=Create menu:C408
$edit:=Create menu:C408
$mode:=Create menu:C408

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemUndo"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Undo action:K59:16)
SET MENU ITEM SHORTCUT:C423($edit; -1; "Z"; Command key mask:K16:1)

APPEND MENU ITEM:C411($edit; "-")

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemCut"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Cut action:K59:18)
SET MENU ITEM SHORTCUT:C423($edit; -1; "X"; Command key mask:K16:1)

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemCopy"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Copy action:K59:19)
SET MENU ITEM SHORTCUT:C423($edit; -1; "C"; Command key mask:K16:1)

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemPaste"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Paste action:K59:20)
SET MENU ITEM SHORTCUT:C423($edit; -1; "V"; Command key mask:K16:1)

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemClear"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Clear action:K59:21)

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemSelectAll"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Select all action:K59:22)
SET MENU ITEM SHORTCUT:C423($edit; -1; "A"; Command key mask:K16:1)

APPEND MENU ITEM:C411($edit; "-")

APPEND MENU ITEM:C411($edit; Get localized string:C991("CommonMenuItemShowClipboard"))
SET MENU ITEM PROPERTY:C973($edit; -1; Associated standard action:K56:1; _o_Show clipboard action:K59:23)

APPEND MENU ITEM:C411($file; Get localized string:C991("CommonMenuItemQuit"))
SET MENU ITEM PROPERTY:C973($file; -1; Associated standard action:K56:1; _o_Quit action:K59:25)
SET MENU ITEM SHORTCUT:C423($file; -1; "Q"; Command key mask:K16:1)

APPEND MENU ITEM:C411($mode; Get localized string:C991("CommonMenuItemDesign"))
SET MENU ITEM PROPERTY:C973($mode; -1; Associated standard action:K56:1; _o_Return to design mode:K59:27)

APPEND MENU ITEM:C411($menu; Get localized string:C991("CommonMenuFile"); $file)
APPEND MENU ITEM:C411($menu; Get localized string:C991("CommonMenuEdit"); $edit)
APPEND MENU ITEM:C411($menu; Get localized string:C991("CommonMenuMode"); $mode)

SET MENU BAR:C67($menu)

RELEASE MENU:C978($file)
RELEASE MENU:C978($edit)
RELEASE MENU:C978($mode)
RELEASE MENU:C978($menu)