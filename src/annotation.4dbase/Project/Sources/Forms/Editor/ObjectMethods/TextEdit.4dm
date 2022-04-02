$event:=Form event code:C388

Case of 
	: ($event=On Getting Focus:K2:7)
		
		$menu:=Get menu bar reference:C979
		ENABLE MENU ITEM:C149($menu; -1)
		
		NEditor_SET_HISTORY_ENABLED(False:C215)
		NEditor_TOOL_SET_EDIT_ENABLED(False:C215)
		NEditor_TOOL_SET_DRAW_ENABLED(False:C215)
		
		OBJECT SET ENABLED:C1123(*; "Select@"; False:C215)
		
		OBJECT SET ENABLED:C1123(*; "Align@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "Distribute@"; False:C215)
		
		OBJECT SET ENABLED:C1123(*; "AlignCombo@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "MoveCombo@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "MoveBack@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "MoveFront@"; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "MoveLeft@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "MoveRight@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "MoveUp@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "MoveDown@"; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "GrowLeft@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "GrowRight@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "GrowUp@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "GrowDown@"; False:C215)
		
		//OBJECT SET VISIBLE(*;"Italic";False)
		//OBJECT SET VISIBLE(*;"Bold";False)
		//OBJECT SET VISIBLE(*;"Underline";False)
		
	: ($event=On Losing Focus:K2:8)
		
		$menu:=Get menu bar reference:C979
		DISABLE MENU ITEM:C150($menu; -1)
		
		NEditor_SET_HISTORY_ENABLED(True:C214)
		NEditor_TOOL_SET_EDIT_ENABLED(True:C214)
		NEditor_TOOL_SET_DRAW_ENABLED(True:C214)
		
		OBJECT SET ENABLED:C1123(*; "Select@"; True:C214)
		
		OBJECT SET ENABLED:C1123(*; "Align@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "Distribute@"; True:C214)
		
		OBJECT SET ENABLED:C1123(*; "AlignCombo@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "MoveCombo@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "MoveBack@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "MoveFront@"; True:C214)
		
		OBJECT SET VISIBLE:C603(*; "MoveLeft@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "MoveRight@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "MoveUp@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "MoveDown@"; True:C214)
		
		OBJECT SET VISIBLE:C603(*; "GrowLeft@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "GrowRight@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "GrowUp@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "GrowDown@"; True:C214)
		
		//OBJECT SET VISIBLE(*;"Italic";true)
		//OBJECT SET VISIBLE(*;"Bold";true)
		//OBJECT SET VISIBLE(*;"Underline";true)
		
		If (NEditor_TEXT_EDIT_End)
			NEditor_ON_DATA_CHANGE
		End if 
		
		NEditor_TOOL_UPDATE
		
		GOTO OBJECT:C206(*; "Image")
		//must be callled in the context in which the original event was triggered
		CALL SUBFORM CONTAINER:C1086(-103)
		
End case 