//%attributes = {"invisible":true}
C_PICTURE:C286($1; $picture)
C_BOOLEAN:C305($0; $isEditable)

$picture:=$1

$sizeBefore:=Picture size:C356($picture)

If ($sizeBefore#0)
	
	CONVERT PICTURE:C1002($picture; ".svg")
	$sizeAfter:=Picture size:C356($picture)
	
	If ($sizeBefore=$sizeAfter)  //is svg
		
		C_BLOB:C604($pictureBlob)
		PICTURE TO BLOB:C692($picture; $pictureBlob; ".svg")
		
		If (OK=1)
			
			$old:=Method called on error:C704
			ON ERR CALL:C155("LABEL_ON_ERROR_CALL")
			$dom:=DOM Parse XML variable:C720($pictureBlob)
			ON ERR CALL:C155($old)
			
			If (OK=1)
				$editor:=DOM Find XML element:C864($dom; "svg/editor:editor")
				If (OK=1)
					$selects:=DOM Find XML element:C864($editor; "editor:editor/editor:selects")
					If (OK=1)
						$objects:=DOM Find XML element:C864($editor; "editor:editor/editor:objects")
						If (OK=1)
							$size:=DOM Find XML element:C864($editor; "editor:editor/editor:size")
							If (OK=1)
								
								$canvas:=DOM Find XML element by ID:C1010($dom; "canvas")
								$use:=DOM Find XML element by ID:C1010($dom; "use")
								
								DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")
								OBJECT SET VISIBLE:C603(*; "BgImage"; False:C215)
								
								C_LONGINT:C283($imVisible; $bgVisible)
								$imVisible:=1
								$bgVisible:=0
								
								If (NEditor_Get_debug_mode)
									$Debug_BgVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_BgVisible")
									$Debug_ImVisible:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_ImVisible")
									$Debug_BgVisible->:=$bgVisible
									$Debug_ImVisible->:=$imVisible
								End if 
								
								NEditor_HISTORY_APPEND_SELECT
								
								$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
								$Container->:=$dom
								$isEditable:=True:C214
								
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 

$0:=$isEditable