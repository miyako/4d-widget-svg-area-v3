//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_LONGINT:C283($2; $mode)
C_PICTURE:C286($0; $returnValue)

$params:=Count parameters:C259

If ($params#0)
	
	If (Length:C16($1)#0)
		
		If ($params>1)
			$mode:=$2
		End if 
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; $returnValue; ""; $mode)
		
		$0:=$returnValue
		
	Else 
		
		$mode:=$2
		
		$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		
		Case of 
			: ($mode=0)
				
				//current canvas size
				C_REAL:C285($imageWidth; $imageHeight)
				DOM GET XML ATTRIBUTE BY NAME:C728($Container->; "width"; $imageWidth)
				DOM GET XML ATTRIBUTE BY NAME:C728($Container->; "height"; $imageHeight)
				
				//true canvas size
				$size:=DOM Find XML element by ID:C1010($Container->; "size")
				C_REAL:C285($documentWidth; $documentHeight)
				DOM GET XML ATTRIBUTE BY NAME:C728($size; "width"; $documentWidth)
				DOM GET XML ATTRIBUTE BY NAME:C728($size; "height"; $documentHeight)
				
				DOM SET XML ATTRIBUTE:C866($Container->; "width"; $documentWidth; "height"; $documentHeight)
				
				$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
				$use:=DOM Find XML element by ID:C1010($Container->; "use")
				
				DOM REMOVE XML ATTRIBUTE:C1084($use; "visibility")
				SVG EXPORT TO PICTURE:C1017($Container->; $returnValue; Copy XML data source:K45:17)
				
				//restore
				//DOM SET XML ATTRIBUTE($use;"visibility";"hidden")
				DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")
				DOM SET XML ATTRIBUTE:C866($Container->; "width"; $imageWidth; "height"; $imageHeight)
				
			: ($mode=1)
				
				//current canvas size
				C_REAL:C285($imageWidth; $imageHeight)
				DOM GET XML ATTRIBUTE BY NAME:C728($Container->; "width"; $imageWidth)
				DOM GET XML ATTRIBUTE BY NAME:C728($Container->; "height"; $imageHeight)
				
				$dom:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; \
					"xmlns:svg"; "http://www.w3.org/2000/svg"; \
					"xmlns:editor"; "http://www.4d.com/2014/editor"; \
					"xmlns:xlink"; "http://www.w3.org/1999/xlink")
				DOM SET XML ATTRIBUTE:C866($dom; "width"; $imageWidth; "height"; $imageHeight)
				$editor:=DOM Find XML element by ID:C1010($Container->; "editor")
				$editor:=DOM Append XML element:C1082($dom; $editor)
				$defs:=DOM Find XML element by ID:C1010($Container->; "defs")
				$defs:=DOM Append XML element:C1082($dom; $defs)
				$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
				$canvas:=DOM Append XML element:C1082($dom; $canvas)
				$annotation:=DOM Find XML element by ID:C1010($Container->; "annotation")
				$annotation:=DOM Append XML element:C1082($dom; $annotation)
				
				//clear the selection
				NEditor_SELECT_Clear($dom)
				$image:=DOM Find XML element by ID:C1010($dom; "image")
				$size:=DOM Find XML element by ID:C1010($dom; "size")
				
				C_REAL:C285($documentWidth; $documentHeight)
				DOM GET XML ATTRIBUTE BY NAME:C728($size; "width"; $documentWidth)  //size of entire svg
				DOM GET XML ATTRIBUTE BY NAME:C728($size; "height"; $documentHeight)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($image; "width"; $imageWidth)
				DOM GET XML ATTRIBUTE BY NAME:C728($image; "height"; $imageHeight)  //size of square in svg
				
				C_REAL:C285($imageTrueWidth; $imageTrueHeight)
				DOM GET XML ATTRIBUTE BY NAME:C728($image; "editor:width"; $imageTrueWidth)  //native size
				DOM GET XML ATTRIBUTE BY NAME:C728($image; "editor:height"; $imageTrueHeight)
				
				$canvas:=DOM Find XML element by ID:C1010($dom; "canvas")
				$use:=DOM Find XML element by ID:C1010($dom; "use")
				
				DOM SET XML ATTRIBUTE:C866($use; "visibility"; "visible")
				
				C_BOOLEAN:C305($landscape)
				If ($imageTrueWidth>$imageTrueHeight)
					$landscape:=True:C214
				Else 
					$landscape:=False:C215
				End if 
				
				C_REAL:C285($imageR)
				DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:r"; $imageR)
				$sin:=Sin:C17(($imageR)*Degree:K30:2)
				$cos:=Cos:C18(($imageR)*Degree:K30:2)
				
				If ($landscape)
					$imageLogicalHeight:=(Abs:C99(Number($documentWidth)*$sin)+(Abs:C99(Number($documentHeight)*$cos)))
					$imageLogicalWidth:=(Abs:C99(Number($documentHeight)*$sin)+(Abs:C99(Number($documentWidth)*$cos)))
				Else 
					$imageLogicalWidth:=(Abs:C99(Number($documentWidth)*$sin)+(Abs:C99(Number($documentHeight)*$cos)))
					$imageLogicalHeight:=(Abs:C99(Number($documentHeight)*$sin)+(Abs:C99(Number($documentWidth)*$cos)))
				End if 
				
				$cx:=$documentWidth/2
				$cy:=$documentHeight/2
				
				If ($landscape)
					$imagedisplayWidth:=$imageWidth
					$imagedisplayHeight:=($imageWidth/$imageTrueWidth)*$imageTrueHeight
				Else 
					$imagedisplayHeight:=$imageHeight
					$imagedisplayWidth:=($imageHeight/$imageTrueHeight)*$imageTrueWidth
				End if 
				
				$viewBoxHeight:=(Abs:C99(Number($imagedisplayWidth)*$sin)+(Abs:C99(Number($imagedisplayHeight)*$cos)))
				$viewBoxWidth:=(Abs:C99(Number($imagedisplayHeight)*$sin)+(Abs:C99(Number($imagedisplayWidth)*$cos)))
				
				$tx:=$cx-($viewBoxWidth/2)
				$ty:=$cy-($viewBoxHeight/2)
				
				$viewBox:=Str($tx)+" "+Str($ty)+" "+Str($viewBoxWidth)+" "+Str($viewBoxHeight)
				
				DOM SET XML ATTRIBUTE:C866($dom; "viewBox"; $viewBox; "width"; $imageTrueWidth; "height"; $imageTrueHeight)
				
				SVG EXPORT TO PICTURE:C1017($dom; $returnValue; Own XML data source:K45:18)
				
			: ($mode=2)
				
				$image:=DOM Find XML element by ID:C1010($Container->; "image")
				C_TEXT:C284($imageData)
				DOM GET XML ATTRIBUTE BY NAME:C728($image; "xlink:href"; $imageData)
				If ($imageData="data:image/png;base64,@")
					$imageData:=Delete string:C232($imageData; 1; Length:C16("data:image/png;base64,"))
					C_BLOB:C604($data)
					CONVERT FROM TEXT:C1011($imageData; "us-ascii"; $data)
					BASE64 DECODE:C896($data)
					BLOB TO PICTURE:C682($data; $returnValue; ".png")
				End if 
				
		End case 
		
		$0:=$returnValue
		
	End if 
	
End if 