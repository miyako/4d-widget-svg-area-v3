//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)
C_TEXT:C284($3; $4)

$DomTextEdit:=OBJECT Get pointer:C1124(Object named:K67:5; "DomTextEdit")
$DomTextEditId:=OBJECT Get pointer:C1124(Object named:K67:5; "DomTextEditId")

$Container:=$1
$Image:=$2
$object:=$3
$objectId:=$4

$DomTextEdit->:=$object
$DomTextEditId->:=$objectId

//hide text during edit
SVG SET ATTRIBUTE:C1055($Image->; $objectId+"-textArea"; "visibility"; "hidden")
SVG SET ATTRIBUTE:C1055($Image->; $objectId+"-rect"; "stroke-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-rect-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-rect-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-tl-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-tl-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-tm-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-tm-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-tr-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-tr-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-ml-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-ml-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-mr-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-mr-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-bl-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-bl-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-bm-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-bm-"+$objectId; "fill-opacity"; 0)

SVG SET ATTRIBUTE:C1055($Image->; "select-br-"+$objectId; "stroke-opacity"; 0)
SVG SET ATTRIBUTE:C1055($Image->; "select-br-"+$objectId; "fill-opacity"; 0)

C_REAL:C285($x; $y; $width; $height; $sx; $sy; $tx; $ty; $r)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:x"; $x)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:y"; $y)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:width"; $width)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:height"; $height)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:sx"; $sx)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:sy"; $sy)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:tx"; $tx)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:ty"; $ty)
SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:r"; $r)

$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$_x:=($x+$tx)*$Zoom->
$_y:=($y+$ty)*$Zoom->
C_LONGINT:C283($scrH; $scrV)
OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrV; $scrH)
$_x:=$_x-$scrH
$_y:=$_y-$scrV

$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")  //x of container
$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")  //y of container
$OffsetH:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetH")  //x of image in Editor
$OffsetV:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetV")  //y of image in Editor

$_x:=$_x+$OffsetH->
$_y:=$_y+$OffsetV->

$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$left:=$_x
$top:=$_y

//adjustments
$left:=$left
$top:=$top+1

$right:=$left+($width*$Zoom->)
$bottom:=$top+($height*$Zoom->)

//cut off at borders
C_LONGINT:C283($imageLeft; $imageTop; $imageRight; $imageBottom)
OBJECT GET COORDINATES:C663(*; "Image"; $imageLeft; $imageTop; $imageRight; $imageBottom)
If ($left<$imageLeft)
	$left:=$imageLeft
End if 
If ($top<$imageTop)
	$top:=$imageTop
End if 
If ($bottom>$imageBottom)
	$bottom:=$imageBottom
End if 
If ($right>$imageRight)
	$right:=$imageRight
End if 

OBJECT MOVE:C664(*; "TextEdit"; $left; $top; $right; $bottom; *)

C_TEXT:C284($strokeColor; $fillColor)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "fill"; $strokeColor)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-rect"; "fill"; $fillColor)

C_TEXT:C284($fillOpacity)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-rect"; "fill-opacity"; $fillOpacity)

C_TEXT:C284($textValue; $fontName)
C_REAL:C285($fontSize; $strokeWidth)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "4D-text"; $textValue)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "font-family"; $fontName)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "font-size"; $fontSize)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-rect"; "stroke-width"; $strokeWidth)

C_TEXT:C284($textDecoration; $fontWeight)
C_TEXT:C284($style; $alignment; $textAlign)
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "text-decoration"; $textDecoration)  //none
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "text-align"; $textAlign)  //start
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "display-align"; $alignment)  //before
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "font-weight"; $fontWeight)  //normal
SVG GET ATTRIBUTE:C1056($Image->; $objectId+"-textArea"; "font-style"; $style)  //normal

C_LONGINT:C283($fontStyle)

$fontStyle:=Plain:K14:1
$fontStyle:=Choose:C955($style="@italic@"; $fontStyle | Italic:K14:3; $fontStyle)
$fontStyle:=Choose:C955($style="@bold@"; $fontStyle | Bold:K14:2; $fontStyle)
$fontStyle:=Choose:C955($style="@underline@"; $fontStyle | Underline:K14:4; $fontStyle)

$p:=OBJECT Get pointer:C1124(Object named:K67:5; "TextEdit")
$p->:=$textValue

Case of 
	: ($alignment="center")
		//OBJECT SET HORIZONTAL ALIGNMENT(*;"TextEdit";Align center)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "TextEdit"; Align left:K42:2)
	: ($alignment="end") | ($alignment="right")
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "TextEdit"; Align right:K42:4)
	Else 
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "TextEdit"; Align left:K42:2)
End case 

OBJECT SET FONT SIZE:C165(*; "TextEdit"; $fontSize*$Zoom->)
OBJECT SET FONT STYLE:C166(*; "TextEdit"; $fontStyle)
OBJECT SET FONT:C164(*; "TextEdit"; $fontName)

C_LONGINT:C283($rectFillColor)
If (Num:C11($fillOpacity)<0.5) | ($r#0)
	If (Version_14_or_later)
		$rectFillColor:=-16  //Background color none
	Else 
		$rectFillColor:=Background color:K23:2
		SVG SET ATTRIBUTE:C1055($Image->; $objectId+"-rect"; "visibility"; "hidden")
	End if 
Else 
	$rectFillColor:=Unhex($fillColor)
End if 

OBJECT SET RGB COLORS:C628(*; "TextEdit"; Unhex($strokeColor); $rectFillColor)

If (Version_15_or_later)
	//since v15, the border color is fixed to black
	EXECUTE FORMULA:C63("OBJECT SET BORDER STYLE:C1262(*;\"TextEdit\";0)")
End if 

OBJECT SET VISIBLE:C603(*; "TextEdit"; True:C214)
GOTO OBJECT:C206(*; "TextEdit")