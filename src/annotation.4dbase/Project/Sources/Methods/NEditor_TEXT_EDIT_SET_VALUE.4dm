//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)

$textArea:=$1
$textValue:=$2

C_LONGINT:C283($i; $j; $count)
$count:=DOM Count XML elements:C726($textArea; "tbreak")

ARRAY TEXT:C222($tbreaks; 0)
$tbreak:=DOM Find XML element:C864($textArea; "textArea/tbreak"; $tbreaks)

For ($i; 1; Size of array:C274($tbreaks))
	DOM REMOVE XML ELEMENT:C869($tbreaks{$i})
End for 

$i:=1

ARRAY LONGINT:C221($len; 0)
ARRAY LONGINT:C221($pos; 0)

While (Match regex:C1019("(.+)"; $textValue; $i; $pos; $len))
	$line:=Substring:C12($textValue; $pos{1}; $len{1})
	If ($i=1)
		DOM SET XML ELEMENT VALUE:C868($textArea; $line)
	Else 
		$breaks:=Substring:C12($textValue; $i; $pos{1}-$i)
		$count:=Length:C16(Replace string:C233($breaks; "\r\n"; "\n"; *))
		For ($j; 1; $count)
			$tbreak:=DOM Create XML element:C865($textArea; "tbreak")
		End for 
		$append:=DOM Append XML child node:C1080($textArea; XML DATA:K45:12; $line)
	End if 
	$i:=$pos{1}+$len{1}
End while 