//%attributes = {"invisible":true}
C_BOOLEAN:C305($1; $shouldKeepHistory)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$DomDocument:=OBJECT Get pointer:C1124(Object named:K67:5; "DomDocument")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$params:=Count parameters:C259

If ($params#0)
	$shouldKeepHistory:=$1
End if 

If (Not:C34(Is nil pointer:C315($Container)))
	If (Length:C16($Container->)#0)
		
		If ($DomDocument->#$Container->)
			
			//document has changed; 
			If (Length:C16($DomDocument->)#0)
				
				NEditor_TEXT_EDIT_End
				
				DOM CLOSE XML:C722($DomDocument->)
				CLEAR VARIABLE:C89($DomDocument->)
			End if 
			
			$DomDocument->:=$Container->
			
		End if 
		
		$Image->:=NEditor_Get_layer_image($Container->)
		
		NEditor_DISPLAY_SCROLLBAR  //after get_*_image
		
		If (Not:C34($shouldKeepHistory))
			NEditor_HISTORY_APPEND
		End if 
		
	End if 
End if 