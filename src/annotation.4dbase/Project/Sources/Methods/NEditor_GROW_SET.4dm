//%attributes = {"invisible":true}
C_TEXT:C284($1)

$GrowObjectIds:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectIds")
$GrowObjectReverses:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectReverses")
$GrowType:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowType")

If (Length:C16($GrowType->)=0)
	
	NEditor_GROW_CLEAR
	
	$GrowType->:=$1
	
	$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
	$selects:=DOM Find XML element by ID:C1010($Container->; "selects")
	
	ARRAY TEXT:C222($selectDoms; 0)
	$select:=DOM Find XML element:C864($selects; "editor:selects/editor:select"; $selectDoms)
	
	C_LONGINT:C283($i)
	C_TEXT:C284($objectId)
	
	For ($i; 1; Size of array:C274($selectDoms))
		
		DOM GET XML ATTRIBUTE BY NAME:C728($selectDoms{$i}; "editor:object-id"; $objectId)
		APPEND TO ARRAY:C911($GrowObjectIds->; $objectId)
		APPEND TO ARRAY:C911($GrowObjectReverses->; False:C215)
		
	End for 
	
Else 
	
	C_BOOLEAN:C305($shouldReset)
	If ((($1="Up") | ($1="Down")) & (($GrowType->="Left") | ($GrowType->="Right"))) | ((($1="Left") | ($1="Right")) & (($GrowType->="Up") | ($GrowType->="Down")))
		$shouldReset:=True:C214
	End if 
	
	$GrowType->:=$1
	
	If ($shouldReset)
		For ($i; 1; Size of array:C274($GrowObjectReverses->))
			$GrowObjectReverses->{$i}:=False:C215
		End for 
	End if 
	
End if 