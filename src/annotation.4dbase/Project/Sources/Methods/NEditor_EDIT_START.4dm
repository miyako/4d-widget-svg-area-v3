//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

SET TIMER:C645(0)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

If (Length:C16($Container->)#0)
	
	$MouseX:=$1
	$MouseY:=$2
	
	$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
	$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
	
	$clickedItem:=SVG Find element ID by coordinates:C1054($Image->; $ClickX->; $ClickY->)
	
	If ($clickedItem="canvas") | ($clickedItem="use") | ($clickedItem="show")  //background image
		$clickedItem:=""
	End if 
	
	Case of 
		: ($clickedItem=("select-rect-"+"@"))
			
			$objectId:=Replace string:C233($clickedItem; "select-rect-"; ""; *)
			$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
			
			C_TEXT:C284($objectType)
			DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-type"; $objectType)
			
			If ($objectType="text")
				
				NEditor_TEXT_EDIT_SET($Container; $Image; $object; $objectId)
				
			End if 
			
	End case 
	
End if 