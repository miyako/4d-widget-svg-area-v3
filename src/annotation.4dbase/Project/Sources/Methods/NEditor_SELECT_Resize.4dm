//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_REAL:C285($2; $moveX)
C_REAL:C285($3; $moveY)
C_BOOLEAN:C305($4; $shouldRedraw)
C_BOOLEAN:C305($5; $shiftDown)
C_BOOLEAN:C305($0; $shouldUpdate)

$id:=$1
$moveX:=$2
$moveY:=$3
$shouldRedraw:=$4
$shiftDown:=$5

$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$selectId:="select-"+$id
$selectRectId:="select-rect-"+$id

$selectTLId:="select-tl-"+$id
$selectTMId:="select-tm-"+$id
$selectTRId:="select-tr-"+$id
$selectMLId:="select-ml-"+$id
$selectMRId:="select-mr-"+$id
$selectBLId:="select-bl-"+$id
$selectBMId:="select-bm-"+$id
$selectBRId:="select-br-"+$id

$dom:=DOM Find XML element by ID:C1010($Container->; $id)

C_REAL:C285($tx; $ty; $sx; $sy; $r; $cx; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sx"; $sx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sy"; $sy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cx"; $cx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cy"; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:r"; $r)

C_TEXT:C284($objectType; $objectId)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:object-type"; $objectType)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:object-id"; $objectId)

C_REAL:C285($x; $y; $width; $height)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:x"; $x)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:y"; $y)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:width"; $width)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $height)

C_REAL:C285($relativeWidth; $relativeHeight; $scaleH; $scaleV)
$relativeWidth:=$width
$relativeHeight:=$height

$growState:=NEditor_GROW_Get($id)

C_TEXT:C284($handleId)

If (Length:C16($growState)=0)
	$handleId:=Substring:C12(NEditor_Get_handle; 8; 2)
Else 
	$handleId:=$growState
End if 

$offsetX:=Number((Cos:C18(($r)*Degree:K30:2)*$moveX)+(Sin:C17(($r)*Degree:K30:2)*$moveY))
$offsetY:=Number((Cos:C18(($r)*Degree:K30:2)*$moveY)+(-Sin:C17(($r)*Degree:K30:2)*$moveX))

$offsetX:=$offsetX
$offsetY:=$offsetY

C_REAL:C285($scaleH; $scaleV)
C_BOOLEAN:C305($flipX; $flipY)
C_REAL:C285($absoluteWidth; $absoluteHeight)

Case of 
	: ($handleId="tl")
		
		$height:=$height-$offsetY
		$width:=$width-$offsetX
		
		$y:=-($height/2)
		$x:=-($width/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleH:=Abs:C99($width)/$relativeWidth
			$scaleV:=Abs:C99($height)/$relativeHeight
			
			If ($scaleH>$scaleV)
				
				If ($width<0)
					$x:=$x+$width
					$flipX:=True:C214
				Else 
					$x:=$x+$width-($relativeWidth*$scaleV)
				End if 
				$width:=$relativeWidth*$scaleV
				
				If ($height<0)
					$y:=$y+$height
					$flipY:=True:C214
				Else 
					$y:=$y+$height-($relativeHeight*$scaleV)
				End if 
				$height:=$relativeHeight*$scaleV
				
				If ($flipX)
					$_tx:=$tx+(($relativeWidth+$width)/2)
				Else 
					$_tx:=$tx+(($relativeWidth-$width)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty+(($relativeHeight+$absoluteHeight)/2)
				Else 
					$_ty:=$ty+(($relativeHeight-$absoluteHeight)/2)
				End if 
				
			Else 
				
				If ($width<0)
					$x:=$x+$width
					$flipX:=True:C214
				Else 
					$x:=$x+$width-($relativeWidth*$scaleH)
				End if 
				$width:=$relativeWidth*$scaleH
				
				If ($height<0)
					$y:=$y+$height
					$flipY:=True:C214
				Else 
					$y:=$y+$height-($relativeHeight*$scaleH)
				End if 
				$height:=$relativeHeight*$scaleH
				
				If ($flipX)
					$_tx:=$tx+($relativeWidth+$absoluteWidth/2)
				Else 
					$_tx:=$tx+(($relativeWidth-$absoluteWidth)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty+(($relativeHeight+$height)/2)
				Else 
					$_ty:=$ty+(($relativeHeight-$height)/2)
				End if 
				
			End if 
			
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx+Number(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2)))
		$ty:=$ty+Number((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2)))
		
	: ($handleId="tm")
		
		$height:=$height-$offsetY
		$y:=-($height/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleV:=Abs:C99($height)/$relativeHeight
			
			If ($scaleV<1)
				
				$width:=$relativeWidth*$scaleV
				
				If ($height<0)
					$flipY:=True:C214
				End if 
				
			Else 
				//can not exceed original size
				If ($height<0)
					$y:=$y+$height
					$flipY:=True:C214
				Else 
					$y:=$y+$height-$relativeHeight
				End if 
				$height:=$relativeHeight
			End if 
			
			If ($scaleV<1)
				$_ty:=$ty+(($relativeHeight-$absoluteHeight)/2)
				If ($flipY)
					$_ty:=$_ty-($height)
				End if 
			Else 
				$_ty:=$ty
				If ($flipY)
					$_ty:=$_ty+($height)
				End if 
			End if 
			
			$_tx:=$tx-(($absoluteWidth-$width)/2)
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx-Number(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))
		$ty:=$ty+Number(($offsetY/2)*Cos:C18(($r)*Degree:K30:2))
		
	: ($handleId="tr")
		
		$height:=$height-$offsetY
		$width:=$width+$offsetX
		$y:=-($height/2)
		$x:=-($width/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleH:=Abs:C99($width)/$relativeWidth
			$scaleV:=Abs:C99($height)/$relativeHeight
			
			If ($scaleH>$scaleV)
				
				If ($width<0)
					$width:=-$relativeWidth*$scaleV
					$flipX:=True:C214
				Else 
					$width:=$relativeWidth*$scaleV
				End if 
				
				If ($height<0)
					$y:=$y+$height
					$flipY:=True:C214
				Else 
					$y:=$y+$height-($relativeHeight*$scaleV)
				End if 
				$height:=$relativeHeight*$scaleV
				
				If ($flipX)
					$_tx:=$tx-(($relativeWidth+$width)/2)+$width
				Else 
					$_tx:=$tx-(($relativeWidth-$width)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty+(($relativeHeight+$absoluteHeight)/2)
				Else 
					$_ty:=$ty+(($relativeHeight-$absoluteHeight)/2)
				End if 
				
			Else 
				
				If ($width<0)
					$width:=-$relativeWidth*$scaleH
					$flipX:=True:C214
				Else 
					$width:=$relativeWidth*$scaleH
				End if 
				
				If ($height<0)
					$y:=$y+$height
					$flipY:=True:C214
				Else 
					$y:=$y+$height-($relativeHeight*$scaleH)
				End if 
				$height:=$relativeHeight*$scaleH
				
				If ($flipX)
					$_tx:=$tx-(($relativeWidth+$width)/2)+$width
				Else 
					$_tx:=$tx-(($relativeWidth-$absoluteWidth)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty+(($relativeHeight+$height)/2)
				Else 
					$_ty:=$ty+(($relativeHeight-$height)/2)
				End if 
				
			End if 
			
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx+Number(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2)))
		$ty:=$ty+Number((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2)))
		
	: ($handleId="ml")
		
		$width:=$width-$offsetX
		$x:=-($width/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleH:=Abs:C99($width)/$relativeWidth
			
			If ($scaleH<1)
				
				$height:=$relativeHeight*$scaleH
				
				If ($width<0)
					$flipX:=True:C214
				End if 
				
			Else 
				//can not exceed original size
				If ($width<0)
					$x:=$x+$width
					$flipX:=True:C214
				Else 
					$x:=$x+$width-$relativeWidth
				End if 
				$width:=$relativeWidth
			End if 
			
			If ($scaleH<1)
				$_tx:=$tx+(($relativeWidth-$absoluteWidth)/2)
				If ($flipX)
					$_tx:=$_tx-($width)
				End if 
			Else 
				$_tx:=$tx
				If ($flipX)
					$_tx:=$_tx+($width)
				End if 
			End if 
			
			$_ty:=$ty-(($absoluteHeight-$height)/2)
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx+Number(($offsetX/2)*Cos:C18(($r)*Degree:K30:2))
		$ty:=$ty+Number(($offsetX/2)*Sin:C17(($r)*Degree:K30:2))
		
	: ($handleId="mr")
		
		$width:=$width+$offsetX
		$x:=-($width/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleH:=Abs:C99($width)/$relativeWidth
			
			If ($scaleH<1)
				
				$height:=$relativeHeight*$scaleH
				
				If ($width<0)
					$flipX:=True:C214
				End if 
				
			Else 
				//can not exceed original size
				If ($width<0)
					$width:=-$relativeWidth
					$flipX:=True:C214
				Else 
					$width:=$relativeWidth
				End if 
			End if 
			
			If ($scaleH<1)
				$_tx:=$tx-(($relativeWidth-$absoluteWidth)/2)
				If ($flipX)
					$_tx:=$_tx+($width)
				End if 
			Else 
				$_tx:=$tx
				If ($flipX)
					$_tx:=$_tx+($width)
				End if 
			End if 
			
			$_ty:=$ty-(($absoluteHeight-$height)/2)
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx+Number(($offsetX/2)*Cos:C18(($r)*Degree:K30:2))
		$ty:=$ty+Number(($offsetX/2)*Sin:C17(($r)*Degree:K30:2))
		
	: ($handleId="bl")
		
		$height:=$height+$offsetY
		$width:=$width-$offsetX
		$y:=-($height/2)
		$x:=-($width/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleH:=Abs:C99($width)/$relativeWidth
			$scaleV:=Abs:C99($height)/$relativeHeight
			
			If ($scaleH>$scaleV)
				
				If ($width<0)
					$x:=$x+$width
					$flipX:=True:C214
				Else 
					$x:=$x+$width-($relativeWidth*$scaleV)
				End if 
				$width:=$relativeWidth*$scaleV
				
				If ($height<0)
					$y:=$y-($relativeHeight*$scaleV)
					$flipY:=True:C214
				Else 
					$y:=$y+$height-($relativeHeight*$scaleV)
				End if 
				$height:=$relativeHeight*$scaleV
				
				If ($flipX)
					$_tx:=$tx+(($relativeWidth+$width)/2)
				Else 
					$_tx:=$tx+(($relativeWidth-$width)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty-(($relativeHeight-$absoluteHeight)/2)-$height
				Else 
					$_ty:=$ty-(($relativeHeight-$absoluteHeight)/2)
				End if 
				
			Else 
				
				If ($width<0)
					$x:=$x+$width
					$flipX:=True:C214
				Else 
					$x:=$x+$width-($relativeWidth*$scaleH)
				End if 
				$width:=$relativeWidth*$scaleH
				
				If ($height<0)
					$y:=$y-($relativeHeight*$scaleH)
					$flipY:=True:C214
				Else 
					$height:=$relativeHeight*$scaleH
				End if 
				$height:=$relativeHeight*$scaleH
				
				If ($flipX)
					$_tx:=$tx+($relativeWidth+$absoluteWidth/2)
				Else 
					$_tx:=$tx+(($relativeWidth-$absoluteWidth)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty+(($height-$relativeHeight)/2)-$height
				Else 
					$_ty:=$ty+(($height-$relativeHeight)/2)
				End if 
				
			End if 
			
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx+Number(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2)))
		$ty:=$ty+Number((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2)))
		
	: ($handleId="bm")
		
		$height:=$height+$offsetY
		$y:=-($height/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleV:=Abs:C99($height)/$relativeHeight
			
			If ($scaleV<1)
				
				$width:=$relativeWidth*$scaleV
				
				If ($height<0)
					$flipY:=True:C214
				End if 
				
			Else 
				//can not exceed original size
				If ($height<0)
					$height:=-$relativeHeight
					$flipY:=True:C214
				Else 
					$height:=$relativeHeight
				End if 
			End if 
			
			If ($scaleV<1)
				$_ty:=$ty-(($relativeHeight-$absoluteHeight)/2)
				If ($flipY)
					$_ty:=$_ty+($height)
				End if 
			Else 
				$_ty:=$ty
				If ($flipY)
					$_ty:=$_ty+($height)
				End if 
			End if 
			
			$_tx:=$tx-(($absoluteWidth-$width)/2)
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx-Number(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))
		$ty:=$ty+Number(($offsetY/2)*Cos:C18(($r)*Degree:K30:2))
		
	: ($handleId="br")
		
		$height:=$height+$offsetY
		$width:=$width+$offsetX
		
		$y:=-($height/2)
		$x:=-($width/2)
		
		If ($shiftDown)
			
			$absoluteWidth:=Abs:C99($width)
			$absoluteHeight:=Abs:C99($height)
			
			$scaleH:=Abs:C99($width)/$relativeWidth
			$scaleV:=Abs:C99($height)/$relativeHeight
			
			If ($scaleH>$scaleV)
				
				If ($width<0)
					$width:=-$relativeWidth*$scaleV
					$flipX:=True:C214
				Else 
					$width:=$relativeWidth*$scaleV
				End if 
				
				If ($height<0)
					$height:=-$relativeHeight*$scaleV
					$flipY:=True:C214
				Else 
					$height:=$relativeHeight*$scaleV
				End if 
				
				If ($flipX)
					$_tx:=$tx-(($relativeWidth+$width)/2)+$width
				Else 
					$_tx:=$tx-(($relativeWidth-$width)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty-(($relativeHeight-$absoluteHeight)/2)+$height
				Else 
					$_ty:=$ty-(($relativeHeight-$absoluteHeight)/2)
				End if 
				
			Else 
				
				If ($width<0)
					$width:=-$relativeWidth*$scaleH
					$flipX:=True:C214
				Else 
					$width:=$relativeWidth*$scaleH
				End if 
				
				If ($height<0)
					$height:=-$relativeHeight*$scaleH
					$flipY:=True:C214
				Else 
					$height:=$relativeHeight*$scaleH
				End if 
				
				If ($flipX)
					$_tx:=$tx-(($relativeWidth+$width)/2)+$width
				Else 
					$_tx:=$tx-(($relativeWidth-$absoluteWidth)/2)
				End if 
				
				If ($flipY)
					$_ty:=$ty+(($height-$relativeHeight)/2)
				Else 
					$_ty:=$ty+(($height-$relativeHeight)/2)
				End if 
				
			End if 
			
			$notranslate:="translate("+Str($_tx)+","+Str($_ty)+")"
			
		End if 
		
		$tx:=$tx+Number(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2)))
		$ty:=$ty+Number((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2)))
		
End case 

//flip
If ($width<0)
	$x:=$x+$width
	$width:=-$width
	$x1:=$x+$width
	$x2:=$x
	$flipX:=True:C214
	
	If (Length:C16($growState)#0)
		NEditor_GROW_REVERSE($id)
	End if 
	
Else 
	$x1:=$x
	$x2:=$x+$width
End if 

If ($height<0)
	$y:=$y+$height
	$height:=-$height
	$y1:=$y+$height
	$y2:=$y
	$flipY:=True:C214
	
	If (Length:C16($growState)#0)
		NEditor_GROW_REVERSE($id)
	End if 
	
Else 
	$y1:=$y
	$y2:=$y+$height
End if 

If ($shouldRedraw)
	
	If ($shiftDown)
		$tx:=$_tx
		$ty:=$_ty
	End if 
	
End if 

//move the target
Case of 
	: ($objectType="ellipse")
		
		$rx:=$width/2
		$ry:=$height/2
		
		If ($shouldRedraw)
			DOM SET XML ATTRIBUTE:C866($dom; "rx"; $rx; "ry"; $ry)
		Else 
			SVG SET ATTRIBUTE:C1055($Image->; $id; "rx"; $rx; "ry"; $ry)
		End if 
		
	: ($objectType="rect")
		
		If ($shouldRedraw)
			DOM SET XML ATTRIBUTE:C866($dom; "x"; -($width/2); "y"; -($height/2); "width"; $width; "height"; $height)
			
		Else 
			SVG SET ATTRIBUTE:C1055($Image->; $id; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
		End if 
		
	: ($objectType="line")
		
		C_TEXT:C284($dx; $dy)
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:dx"; $dx)
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:dy"; $dy)
		
		Case of 
			: ($flipX) & ($flipY) & ($dx="left") & ($dy="up")
				
				$x1:=-$width/2
				$y1:=-$height/2
				$x2:=$width/2
				$y2:=$height/2
				
			: ($flipX) & ($flipY) & ($dx="left") & ($dy="down")
				
				$x1:=-$width/2
				$y1:=$height/2
				$x2:=$width/2
				$y2:=-$height/2
				
			: ($flipX) & ($flipY) & ($dx="right") & ($dy="up")
				
				$x1:=$width/2
				$y1:=-$height/2
				$x2:=-$width/2
				$y2:=$height/2
				
			: ($flipX) & ($flipY) & ($dx="right") & ($dy="down")
				
				$x1:=$width/2
				$y1:=$height/2
				$x2:=-$width/2
				$y2:=-$height/2
				
			: ($flipX) & (Not:C34($flipY)) & ($dx="left") & ($dy="up")
				
				$x1:=-$width/2
				$y1:=$height/2
				$x2:=$width/2
				$y2:=-$height/2
				
			: ($flipX) & (Not:C34($flipY)) & ($dx="left") & ($dy="down")
				
				$x1:=-$width/2
				$y1:=-$height/2
				$x2:=$width/2
				$y2:=$height/2
				
			: ($flipX) & (Not:C34($flipY)) & ($dx="right") & ($dy="up")
				
				$x1:=$width/2
				$y1:=$height/2
				$x2:=-$width/2
				$y2:=-$height/2
				
			: ($flipX) & (Not:C34($flipY)) & ($dx="right") & ($dy="down")
				
				$x1:=$width/2
				$y1:=-$height/2
				$x2:=-$width/2
				$y2:=$height/2
				
			: (Not:C34($flipX)) & ($flipY) & ($dx="left") & ($dy="up")
				
				$x1:=$width/2
				$y1:=-$height/2
				$x2:=-$width/2
				$y2:=$height/2
				
			: (Not:C34($flipX)) & ($flipY) & ($dx="left") & ($dy="down")
				
				$x1:=$width/2
				$y1:=$height/2
				$x2:=-$width/2
				$y2:=-$height/2
				
			: (Not:C34($flipX)) & ($flipY) & ($dx="right") & ($dy="up")
				
				$x1:=-$width/2
				$y1:=-$height/2
				$x2:=$width/2
				$y2:=$height/2
				
			: (Not:C34($flipX)) & ($flipY) & ($dx="right") & ($dy="down")
				
				$x1:=-$width/2
				$y1:=$height/2
				$x2:=$width/2
				$y2:=-$height/2
				
			: (Not:C34($flipX)) & (Not:C34($flipY)) & ($dx="left") & ($dy="up")
				
				$x1:=$width/2
				$y1:=$height/2
				$x2:=-$width/2
				$y2:=-$height/2
				
			: (Not:C34($flipX)) & (Not:C34($flipY)) & ($dx="left") & ($dy="down")
				
				$x1:=$width/2
				$y1:=-$height/2
				$x2:=-$width/2
				$y2:=$height/2
				
			: (Not:C34($flipX)) & (Not:C34($flipY)) & ($dx="right") & ($dy="up")
				
				$x1:=-$width/2
				$y1:=$height/2
				$x2:=$width/2
				$y2:=-$height/2
				
			: (Not:C34($flipX)) & (Not:C34($flipY)) & ($dx="right") & ($dy="down")
				
				$x1:=-$width/2
				$y1:=-$height/2
				$x2:=$width/2
				$y2:=$height/2
				
		End case 
		
		If ($shouldRedraw)
			
			If ($x1>$x2)
				$dx:="left"
			Else 
				$dx:="right"
			End if 
			
			If ($y1>$y2)
				$dy:="up"
			Else 
				$dy:="down"
			End if 
			
			DOM SET XML ATTRIBUTE:C866($dom; "editor:dx"; $dx; "editor:dy"; $dy; "x1"; $x1; "y1"; $y1; "x2"; $x2; "y2"; $y2)
			
		Else 
			SVG SET ATTRIBUTE:C1055($Image->; $id; "x1"; $x1; "y1"; $y1; "x2"; $x2; "y2"; $y2)
		End if 
		
	: ($objectType="polyline")
		
		C_TEXT:C284($points)
		
		ARRAY LONGINT:C221($pos; 0)
		ARRAY LONGINT:C221($len; 0)
		
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "points"; $points)
		
		ARRAY REAL:C219($point_x; 0)
		ARRAY REAL:C219($point_y; 0)
		
		C_LONGINT:C283($p)
		
		$p:=1
		
		While (Match regex:C1019("(-?(?:\\d|\\.)+),(-?(?:\\d|\\.)+)"; $points; $p; $pos; $len))
			$px:=Num:C11(Substring:C12($points; $pos{1}; $len{1}); ".")
			$py:=Num:C11(Substring:C12($points; $pos{2}; $len{2}); ".")
			APPEND TO ARRAY:C911($point_x; $px)
			APPEND TO ARRAY:C911($point_y; $py)
			$p:=$pos{2}+$len{2}
		End while 
		
		C_REAL:C285($oldWidth; $oldHeight)
		SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:width"; $oldWidth)
		SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:height"; $oldHeight)
		
		C_REAL:C285($ratioW; $ratioH)
		$ratioW:=$width/$oldWidth
		$ratioH:=$height/$oldHeight
		
		CLEAR VARIABLE:C89($points)
		
		C_LONGINT:C283($i)
		
		For ($i; 1; Size of array:C274($point_x))
			$point_x{$i}:=$point_x{$i}*$ratioW
			$point_y{$i}:=$point_y{$i}*$ratioH
			If ($flipX)
				$point_x{$i}:=-$point_x{$i}
			End if 
			If ($flipY)
				$point_y{$i}:=-$point_y{$i}
			End if 
			$points:=$points+" "+Str($point_x{$i})+","+Str($point_y{$i})
		End for 
		
		If ($shouldRedraw)
			DOM SET XML ATTRIBUTE:C866($dom; "points"; $points)
		Else 
			SVG SET ATTRIBUTE:C1055($Image->; $id; "points"; $points)
		End if 
		
	: ($objectType="text")
		
		C_REAL:C285($strokeWidth)
		SVG GET ATTRIBUTE:C1056($Image->; $id+"-rect"; "stroke-width"; $strokeWidth)
		C_BOOLEAN:C305($wordWrap)
		SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:word-wrap"; $wordWrap)
		C_REAL:C285($lineHeight)
		SVG GET ATTRIBUTE:C1056($Image->; $id+"-textArea"; "editor:line-height"; $lineHeight)
		
		If ($shouldRedraw)
			$textArea:=DOM Find XML element by ID:C1010($Container->; $id+"-textArea")
			$rect:=DOM Find XML element by ID:C1010($Container->; $id+"-rect")
			DOM SET XML ATTRIBUTE:C866($textArea; "x"; -($width/2); "y"; -($height/2); "width"; $width; "height"; $height)
			DOM SET XML ATTRIBUTE:C866($rect; "x"; -($width/2); "y"; -($height/2); "width"; $width; "height"; $height)
			If (Not:C34($wordWrap))
				DOM SET XML ATTRIBUTE:C866($textArea; "height"; $lineHeight)
			End if 
		Else 
			SVG SET ATTRIBUTE:C1055($Image->; $id+"-textArea"; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
			SVG SET ATTRIBUTE:C1055($Image->; $id+"-rect"; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
			If (Not:C34($wordWrap))
				SVG SET ATTRIBUTE:C1055($Image->; $id+"-textArea"; "height"; $lineHeight)
			End if 
		End if 
		
	: ($objectType="image")
		
		If ($shouldRedraw)
			DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($Container->; $id+"-rect"); "x"; -($width/2); "y"; -($height/2); "width"; $width; "height"; $height)
			DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($Container->; $id+"-data"); "width"; $width; "height"; $height)
			DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($Container->; $id+"-image"); "x"; -($width/2); "y"; -($height/2))
		Else 
			SVG SET ATTRIBUTE:C1055($Image->; $id+"-image"; "x"; $x; "y"; $y)
			SVG SET ATTRIBUTE:C1055($Image->; $id+"-rect"; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
			SVG SET ATTRIBUTE:C1055($Image->; $id+"-data"; "width"; $width; "height"; $height)
		End if 
		
End case 

$translate:="translate("+Str($tx)+","+Str($ty)+")"
$scale:="scale("+Str($sx)+","+Str($sy)+")"
$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"

$transform:=$translate+" "+$scale+" "+$rotate
$transformSelect:=$translate+" "+$rotate

If ($shiftDown)
	Case of 
			//these objects have a center
		: ($objectType="ellipse") | ($objectType="polyline") | ($objectType="line")
			$transform:=$notranslate+" "+$scale+" "+$rotate
	End case 
End if 

If ($shouldRedraw)
	
	$domSelect:=DOM Find XML element by ID:C1010($Container->; $selectId)
	$domSelectRect:=DOM Find XML element by ID:C1010($Container->; $selectRectId)
	
	$domSelectTL:=DOM Find XML element by ID:C1010($Container->; $selectTLId)
	$domSelectTM:=DOM Find XML element by ID:C1010($Container->; $selectTMId)
	$domSelectTR:=DOM Find XML element by ID:C1010($Container->; $selectTRId)
	$domSelectML:=DOM Find XML element by ID:C1010($Container->; $selectMLId)
	$domSelectMR:=DOM Find XML element by ID:C1010($Container->; $selectMRId)
	$domSelectBL:=DOM Find XML element by ID:C1010($Container->; $selectBLId)
	$domSelectBM:=DOM Find XML element by ID:C1010($Container->; $selectBMId)
	$domSelectBR:=DOM Find XML element by ID:C1010($Container->; $selectBRId)
	
	If ($shiftDown)
		
		$translate:="translate("+Str($tx)+","+Str($ty)+")"
		$scale:="scale("+Str($sx)+","+Str($sy)+")"
		$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
		$transformSelect:=$translate+" "+$rotate
		$x:=-$width/2
		$y:=-$height/2
		
	End if 
	
	//move the primitive or group
	DOM SET XML ATTRIBUTE:C866($dom; "transform"; $transform; \
		"editor:x"; $x; "editor:y"; $y; \
		"editor:width"; $width; "editor:height"; $height; \
		"editor:tx"; $tx; "editor:ty"; $ty; \
		"editor:sx"; $sx; "editor:sy"; $sy; \
		"editor:cx"; $cx; "editor:cy"; $cy; "editor:r"; $r)
	
	//move the object
	DOM SET XML ATTRIBUTE:C866($domSelect; "transform"; $transformSelect)
	
	//move the rect
	DOM SET XML ATTRIBUTE:C866($domSelectRect; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
	//move the handles
	DOM SET XML ATTRIBUTE:C866($domSelectTL; "x"; $x-5; "y"; $y-5)
	DOM SET XML ATTRIBUTE:C866($domSelectTM; "x"; $x-5+($width/2); "y"; $y-5)
	DOM SET XML ATTRIBUTE:C866($domSelectTR; "x"; $x-5+$width; "y"; $y-5)
	DOM SET XML ATTRIBUTE:C866($domSelectML; "x"; $x-5; "y"; $y-5+($height/2))
	DOM SET XML ATTRIBUTE:C866($domSelectMR; "x"; $x-5+$width; "y"; $y-5+($height/2))
	DOM SET XML ATTRIBUTE:C866($domSelectBL; "x"; $x-5; "y"; $y-5+$height)
	DOM SET XML ATTRIBUTE:C866($domSelectBM; "x"; $x-5+($width/2); "y"; $y-5+$height)
	DOM SET XML ATTRIBUTE:C866($domSelectBR; "x"; $x-5+$width; "y"; $y-5+$height)
	
	$shouldUpdate:=($moveX#0) | ($moveY#0)
	
Else 
	
	//move the primitive or group
	SVG SET ATTRIBUTE:C1055($Image->; $id; "transform"; $transform)
	
	//move the object
	SVG SET ATTRIBUTE:C1055($Image->; $selectId; "transform"; $transformSelect)
	
	//move the rect
	SVG SET ATTRIBUTE:C1055($Image->; $selectRectId; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
	//move the handles
	SVG SET ATTRIBUTE:C1055($Image->; $selectTLId; "x"; $x-5; "y"; $y-5)
	SVG SET ATTRIBUTE:C1055($Image->; $selectTMId; "x"; $x-5+($width/2); "y"; $y-5)
	SVG SET ATTRIBUTE:C1055($Image->; $selectTRId; "x"; $x-5+$width; "y"; $y-5)
	SVG SET ATTRIBUTE:C1055($Image->; $selectMLId; "x"; $x-5; "y"; $y-5+($height/2))
	SVG SET ATTRIBUTE:C1055($Image->; $selectMRId; "x"; $x-5+$width; "y"; $y-5+($height/2))
	SVG SET ATTRIBUTE:C1055($Image->; $selectBLId; "x"; $x-5; "y"; $y-5+$height)
	SVG SET ATTRIBUTE:C1055($Image->; $selectBMId; "x"; $x-5+($width/2); "y"; $y-5+$height)
	SVG SET ATTRIBUTE:C1055($Image->; $selectBRId; "x"; $x-5+$width; "y"; $y-5+$height)
	
End if 

$0:=$shouldUpdate