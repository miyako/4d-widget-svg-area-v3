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

$dom:=DOM Find XML element by ID:C1010($Container->; $id)

C_REAL:C285($tx; $ty; $sx; $sy; $r; $cx; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sx"; $sx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sy"; $sy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cx"; $cx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cy"; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:r"; $r)

If ($shiftDown)
	
	C_REAL:C285($width; $height)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $height)
	
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
	$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
	
	C_REAL:C285($MouseX; $MouseY; $w; $h)
	$MouseX:=($moveX+$ClickX->)/$Zoom->
	$MouseY:=($moveY+$ClickY->)/$Zoom->
	
	$w:=$MouseX-$tx
	$h:=$MouseY-$ty
	
	Case of 
		: ($w=0) & ($h>0)
			
			$r:=0
			
		: ($w<0) & ($h>0)
			
			$r:=90+(Arctan:C20($h/$w)*Radian:K30:3)
			
		: ($h=0) & ($W<0)
			
			$r:=90
			
		: ($w<0) & ($h<0)
			
			$r:=90+(Arctan:C20($h/$w)*Radian:K30:3)
			
		: ($w=0) & ($h<0)
			
			$r:=180
			
		: ($w>0) & ($h<0)
			
			$r:=270+(Arctan:C20($h/$w)*Radian:K30:3)
			
		Else 
			
			$r:=270+(Arctan:C20($h/$w)*Radian:K30:3)
			
	End case 
	
	$translate:="translate("+Str($tx)+","+Str($ty)+")"
	$scale:="scale("+Str($sx)+","+Str($sy)+")"
	$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
	
	$transform:=$translate+" "+$scale+" "+$rotate
	$transformSelect:=$translate+" "+$rotate
	
	$Debug_R:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_R")
	$Debug_R->:=Int:C8($r)
	
Else 
	
	$Debug_R:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug_R")
	$Debug_R->:=0
	
	$tx:=$tx+$moveX
	$ty:=$ty+$moveY
	
	$translate:="translate("+Str($tx)+","+Str($ty)+")"
	$scale:="scale("+Str($sx)+","+Str($sy)+")"
	$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
	
	$transform:=$translate+" "+$scale+" "+$rotate
	$transformSelect:=$translate+" "+$rotate
	
End if 

If ($shouldRedraw)
	
	$domSelect:=DOM Find XML element by ID:C1010($Container->; $selectId)
	
	If ($shiftDown)
		DOM SET XML ATTRIBUTE:C866($dom; "transform"; $transform; "editor:r"; $r)
	Else 
		DOM SET XML ATTRIBUTE:C866($dom; "transform"; $transform; "editor:tx"; $tx; "editor:ty"; $ty)
	End if 
	
	DOM SET XML ATTRIBUTE:C866($domSelect; "transform"; $transformSelect)
	
	$shouldUpdate:=($moveX#0) | ($moveY#0)
	
Else 
	
	//do not update the dom during this event, we need the original tx,ty during movement
	SVG SET ATTRIBUTE:C1055($Image->; $id; "transform"; $transform)
	SVG SET ATTRIBUTE:C1055($Image->; $selectId; "transform"; $transformSelect)
	
End if 

$0:=$shouldUpdate