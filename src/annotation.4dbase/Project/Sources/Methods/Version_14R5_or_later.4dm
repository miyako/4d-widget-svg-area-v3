//%attributes = {"invisible":true}
C_BOOLEAN:C305($0)

C_LONGINT:C283($build)
$shortVersionCode:=Application version:C493($build)

$majorVersion:=Num:C11(Substring:C12($shortVersionCode; 1; 2))

$rVersion:=Num:C11(Substring:C12($shortVersionCode; 7; 1))

$0:=($majorVersion>15) | (($majorVersion=14) & ($rVersion=5))