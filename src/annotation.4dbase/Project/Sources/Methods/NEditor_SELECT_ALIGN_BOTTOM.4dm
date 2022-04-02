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

C_REAL:C285($bottomMost)
C_REAL:C285($editorTx; $editorX)
C_REAL:C285($editorTy; $editorY)
C_REAL:C285($editorWidth; $editorHeight)

ARRAY TEXT:C222($objectDoms; 0)
ARRAY TEXT:C222($objectDomSelects; 0)

NEditor_HISTORY_APPEND_SELECT

For ($i; 1; Size of array:C274($selectDoms))
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selectDoms{$i}; "editor:object-id"; $objectId)
	
	$object:=DOM Find XML element by ID:C1010($Container->; $objectId)
	APPEND TO ARRAY:C911($objectDoms; $object)
	
	$select:=DOM Find XML element by ID:C1010($Container->; "select-"+$objectId)
	APPEND TO ARRAY:C911($objectDomSelects; $select)
	
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
	
	If ($i#1) & ($bottom#$bottomMost)
		$shouldUpdate:=True:C214
	End if 
	
	If ($i=1) | ($bottom>$bottomMost)
		$bottomMost:=$bottom
	End if 
	
End for 

If ($shouldUpdate)
	
	C_REAL:C285($x; $y; $width; $height; $tx; $ty; $sx; $sy; $r; $cx; $cy)
	
	For ($i; 1; Size of array:C274($objectDoms))
		
		$object:=$objectDoms{$i}
		$select:=$objectDomSelects{$i}
		
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
		
		$moveY:=$bottomMost-$bottom
		$ty:=$ty+$moveY
		
		$translate:="translate("+Str($tx)+","+Str($ty)+")"
		$scale:="scale("+Str($sx)+","+Str($sy)+")"
		$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
		
		$transform:=$translate+" "+$scale+" "+$rotate
		$transformSelect:=$translate+" "+$rotate
		
		DOM SET XML ATTRIBUTE:C866($object; "transform"; $transform; "editor:tx"; $tx; "editor:ty"; $ty)
		DOM SET XML ATTRIBUTE:C866($select; "transform"; $transformSelect)
		
		$shouldRedraw:=$shouldRedraw | ($moveY#0)
		
	End for 
	
End if 

If ($shouldRedraw)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=NEditor_Get_layer_image($Container->)
	NEditor_HISTORY_APPEND
End if 