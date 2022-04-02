//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_TEXT:C284($0)

$GrowType:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowType")

If (Length:C16($GrowType->)#0)
	$GrowObjectIds:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectIds")
	
	$id:=$1
	
	$find:=Find in array:C230($GrowObjectIds->; $id)
	
	If ($find#-1)
		
		C_BOOLEAN:C305($reverse)
		
		$GrowObjectReverses:=OBJECT Get pointer:C1124(Object named:K67:5; "GrowObjectReverses")
		$reverse:=$GrowObjectReverses->{$find}
		
		Case of 
			: ($GrowType->="Left")
				
				If ($reverse)
					$0:="ml"
				Else 
					$0:="mr"
				End if 
				
			: ($GrowType->="Right")
				
				If ($reverse)
					$0:="ml"
				Else 
					$0:="mr"
				End if 
				
			: ($GrowType->="Up")
				
				If ($reverse)
					$0:="bm"
				Else 
					$0:="tm"
				End if 
				
			: ($GrowType->="Down")
				
				If ($reverse)
					$0:="bm"
				Else 
					$0:="tm"
				End if 
				
		End case 
		
	End if 
	
End if 