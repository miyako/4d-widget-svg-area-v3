//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_LONGINT:C283($0)

$thisName:=$1

$event:=Form event code:C388

//object method

Case of 
	: (-109=$event)  //load
		
	: (-112=$event)  //click, double click, outside call, drag over; for computing accurate position
		
		C_LONGINT:C283($l; $t; $r; $b)
		OBJECT GET COORDINATES:C663(*; $thisName; $l; $t; $r; $b)
		NEditor_SET_POSITION($thisName; $l; $t)
		
		$event:=0
		
	: (-103=$event)
		
		$event:=-On Data Change:K2:15  //(dom did not change)
		
	: (-104=$event)  //command+z; editor changes
		
		$Editor:=OBJECT Get pointer:C1124(Object named:K67:5; $thisName)
		$DropDom:=OBJECT Get pointer:C1124(Object named:K67:5; "DropDom"; $thisName)
		
		$DropDom->:=$Editor->
		
		$event:=-On Data Change:K2:15  //(dom changed)
		
	: (-113=$event)  //document drop
		
		$event:=0
		
End case 

//form method

Case of 
	: ($event=On Load:K2:1)
		
		C_LONGINT:C283($l; $t; $r; $b)
		OBJECT GET COORDINATES:C663(*; $thisName; $l; $t; $r; $b)
		NEditor_SET_POSITION($thisName; $l; $t)
		
	: ($event=On Resize:K2:27)
		
		NEditor_ON_BEFORE_RESIZE($thisName)
		NEditor_ON_RESIZE($thisName)
		
	: ($event=On Outside Call:K2:11)
		
		NEditor_ON_OUTSIDE_CALL($thisName)
		
End case 

$0:=$event