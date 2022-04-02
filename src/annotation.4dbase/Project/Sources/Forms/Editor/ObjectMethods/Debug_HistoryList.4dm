$event:=Form event code:C388

Case of 
	: ($event=On Selection Change:K2:29)
		
		C_LONGINT:C283($col; $row)
		LISTBOX GET CELL POSITION:C971(*; OBJECT Get name:C1087(Object current:K67:2); $col; $row)
		NEditor_HISTORY_RESTORE($row)
		
End case 