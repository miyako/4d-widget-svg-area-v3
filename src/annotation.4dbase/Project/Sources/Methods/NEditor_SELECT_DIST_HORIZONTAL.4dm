//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_BOOLEAN:C305($shouldRedraw; $shouldUpdate)

$Container:=$1

$selects:=DOM Find XML element by ID:C1010($Container->; "selects")
$objects:=DOM Find XML element by ID:C1010($Container->; "objects")

ARRAY TEXT:C222($selectDoms; 0)
$select:=DOM Find XML element:C864($selects; "editor:selects/editor:select"; $selectDoms)

C_TEXT:C284($objectId; $object; $select)

C_LONGINT:C283($i; $level)

C_REAL:C285($leftMost; $rightMost)
C_REAL:C285($editorTx; $editorX)
C_REAL:C285($editorTy; $editorY)
C_REAL:C285($editorWidth; $editorHeight)

ARRAY TEXT:C222($objectDoms; 0)
ARRAY TEXT:C222($objectDomSelects; 0)

C_REAL:C285($left; $right; $leftMost; $rightMost; $center)

ARRAY TEXT:C222($objectDoms; 0)
ARRAY REAL:C219($objectCenters; 0)

C_TEXT:C284($leftMostObject; $rightMostObject)

NEditor_HISTORY_APPEND_SELECT

For ($i; 1; Size of array:C274($selectDoms))
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selectDoms{$i}; "editor:object-id"; $objectId)
	
	$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
	APPEND TO ARRAY:C911($objectDoms; $object)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:tx"; $editorTx)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:x"; $editorX)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:ty"; $editorTy)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:y"; $editorY)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:width"; $editorWidth)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:height"; $editorHeight)
	
	$top:=$editorTy+$editorY
	$bottom:=$top+$editorHeight
	$left:=$editorTx+$editorX
	$right:=$left+$editorWidth
	
	$center:=$left+(($right-$left)/2)
	APPEND TO ARRAY:C911($objectCenters; $center)
	
End for 

MULTI SORT ARRAY:C718($objectCenters; >; $objectDoms)
$leftMostObject:=$objectDoms{1}
$rightMostObject:=$objectDoms{Size of array:C274($objectDoms)}

DOM GET XML ATTRIBUTE BY NAME:C728($leftMostObject; "editor:tx"; $editorTx)
DOM GET XML ATTRIBUTE BY NAME:C728($leftMostObject; "editor:x"; $editorX)
DOM GET XML ATTRIBUTE BY NAME:C728($leftMostObject; "editor:width"; $editorWidth)

$left:=$editorTx+$editorX
$right:=$left+$editorWidth
$leftMost:=$left+(($right-$left)/2)

DOM GET XML ATTRIBUTE BY NAME:C728($rightMostObject; "editor:tx"; $editorTx)
DOM GET XML ATTRIBUTE BY NAME:C728($rightMostObject; "editor:x"; $editorX)
DOM GET XML ATTRIBUTE BY NAME:C728($rightMostObject; "editor:width"; $editorWidth)

$left:=$editorTx+$editorX
$right:=$left+$editorWidth
$rightMost:=$left+(($right-$left)/2)

C_REAL:C285($distance)
$distance:=($rightMost-$leftMost)/(Size of array:C274($selectDoms)-1)

C_REAL:C285($newLeft; $newRight; $width)

$center:=$leftMost

C_REAL:C285($x; $y; $width; $height; $tx; $ty; $sx; $sy; $r; $cx; $cy)

For ($i; 2; Size of array:C274($objectDoms)-1)
	
	$object:=$objectDoms{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:object-id"; $objectId)
	
	$select:=DOM Find XML element by ID:C1010($Container->; "select-"+$objectId)
	APPEND TO ARRAY:C911($objectDomSelects; $select)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:height"; $height)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:tx"; $tx)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:ty"; $ty)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:sx"; $sx)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:sy"; $sy)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:cx"; $cx)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:cy"; $cy)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "editor:r"; $r)
	
	$top:=$ty+$y
	$bottom:=$top+$height
	$left:=$tx+$x
	$right:=$left+$width
	
	$center:=$center+$distance
	
	$newLeft:=$center-($width/2)
	$newRight:=$center+($width/2)
	
	$moveX:=$newLeft-$left
	$tx:=$tx+$moveX
	
	$translate:="translate("+Str($tx)+","+Str($ty)+")"
	$scale:="scale("+Str($sx)+","+Str($sy)+")"
	$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
	
	$transform:=$translate+" "+$scale+" "+$rotate
	$transformSelect:=$translate+" "+$rotate
	
	DOM SET XML ATTRIBUTE:C866($object; "transform"; $transform; "editor:tx"; $tx; "editor:ty"; $ty)
	DOM SET XML ATTRIBUTE:C866($select; "transform"; $transformSelect)
	
	$shouldRedraw:=$shouldRedraw | ($moveX#0)
	
End for 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 
