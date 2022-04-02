//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_BOOLEAN:C305($2; $shouldAppend)
C_BOOLEAN:C305($0; $shouldRedraw)

$id:=$1

$shouldAppend:=$2

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$dom:=DOM Find XML element by ID:C1010($Container->; $id)

C_TEXT:C284($objectType; $objectId)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:object-type"; $objectType)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:object-id"; $objectId)

If (Length:C16($objectId)#0)
	
	$dom:=DOM Find XML element by ID:C1010($Container->; $objectId)
	
	If (Not:C34(NEditor_SELECT_Find($Container->; $objectId)))
		
		If (Not:C34($shouldAppend))
			$shouldRedraw:=NEditor_SELECT_Clear($Container->)
		End if 
		
		If (Not:C34(NEditor_SELECT_Find($Container->; $objectId)))
			
			Case of 
				: ($objectType="ellipse")
					
					$shouldRedraw:=NEditor_SELECT_Ellipse($dom; $objectId)
					
				: ($objectType="line")
					
					$shouldRedraw:=NEditor_SELECT_Line($dom; $objectId)
					
				: ($objectType="polyline")
					
					$shouldRedraw:=NEditor_SELECT_Polyline($dom; $objectId)
					
				: ($objectType="rect")
					
					$shouldRedraw:=NEditor_SELECT_Rect($dom; $objectId)
					
				: ($objectType="text")
					
					$shouldRedraw:=NEditor_SELECT_Text($dom; $objectId)
					
				: ($objectType="image")
					
					$shouldRedraw:=NEditor_SELECT_Image($dom; $objectId)
					
			End case 
			
		End if 
		
	End if 
End if 

$0:=$shouldRedraw