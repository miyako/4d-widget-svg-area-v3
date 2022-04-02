//%attributes = {"invisible":true}
C_BOOLEAN:C305($0)

C_BOOLEAN:C305($shouldRedraw)

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$DomTextEdit:=OBJECT Get pointer:C1124(Object named:K67:5; "DomTextEdit")
$DomTextEditId:=OBJECT Get pointer:C1124(Object named:K67:5; "DomTextEditId")

$objectDom:=$DomTextEdit->
$objectId:=$DomTextEditId->

If (Length:C16($objectDom)#0)
	
	$isImageOnly:=False:C215
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-rect-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-rect-"+$objectId; "fill-opacity"; 0.2)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-tl-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-tl-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-tm-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-tm-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-tr-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-tr-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-ml-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-ml-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-mr-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-mr-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-bl-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-bl-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-bm-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-bm-"+$objectId; "fill-opacity"; 0.7)
	
	SVG SET ATTRIBUTE:C1055($Image->; "select-br-"+$objectId; "stroke-opacity"; 0.7)
	SVG SET ATTRIBUTE:C1055($Image->; "select-br-"+$objectId; "fill-opacity"; 0.7)
	
	OBJECT MOVE:C664(*; "TextEdit"; 0; 0; 0; 0; *)
	OBJECT SET VISIBLE:C603(*; "TextEdit"; False:C215)
	
	$focusObjectName:=OBJECT Get name:C1087(Object with focus:K67:3)
	
	If ($focusObjectName="TextEdit")
		
		$p:=OBJECT Get pointer:C1124(Object named:K67:5; "TextEdit")
		
		C_TEXT:C284($oldValue; $textValue)
		
		SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "4D-text"; $oldValue)
		SVG SET ATTRIBUTE:C1055($Image->; $objectId+"-textArea"; "visibility"; "visible")
		SVG SET ATTRIBUTE:C1055($Image->; $objectId+"-rect"; "visibility"; "visible")
		
		$textValue:=$p->
		
		$p->:=""
		
		Case of 
			: ($textValue="")
				
				$class:="class-"+$objectId+"-textArea"
				DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
				
				$class:="class-"+$objectId+"-rect"
				DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $class))
				
				//remove select from canvas 
				$selectId:="select-"+$objectId
				DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $selectId))
				
				//remove object from canvas 
				DOM REMOVE XML ELEMENT:C869($objectDom)
				
				//remove object from container 
				DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($Container->; $objectId))
				
				//remove object from container/selects 
				C_LONGINT:C283($count)
				ARRAY TEXT:C222($selects; 0)
				$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($Container->; "selects"); "editor:selects/editor:select"; $selects)
				$count:=Size of array:C274($selects)
				
				C_LONGINT:C283($i)
				
				For ($i; 1; $count)
					DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "editor:object-id"; $select)
					If ($objectId=$select)
						DOM REMOVE XML ELEMENT:C869($selects{$i})
						$i:=$count
					End if 
				End for 
				
				NEditor_SELECT_UPDATE_ID($Container)
				
				$shouldRedraw:=True:C214
				
			: (Length:C16($textValue)=Length:C16($oldValue)) & (Position:C15($oldValue; $textValue; *)=1)
				
			Else 
				
				$textArea:=DOM Find XML element by ID:C1010($Container->; $objectId+"-textArea")
				NEditor_TEXT_EDIT_SET_VALUE($textArea; $textValue)
				
				C_REAL:C285($lineHeight)
				$lineHeight:=NEditor_Compute_line_height($textArea)
				
				DOM SET XML ATTRIBUTE:C866($textArea; "editor:line-height"; $lineHeight)
				
				$shouldRedraw:=True:C214
				
		End case 
		
		$DomTextEdit->:=""
		$DomTextEditId->:=""
		
	End if 
	
End if 

$0:=$shouldRedraw