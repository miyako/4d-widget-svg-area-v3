//%attributes = {"invisible":true}
C_TEXT:C284($1)

$dom:=$1

C_TEXT:C284($id)

$old:=Method called on error:C704
ON ERR CALL:C155("LABEL_ON_ERROR_CALL")
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "id"; $id)
ON ERR CALL:C155($old)

If (OK=1)
	
	DOM SET XML ATTRIBUTE:C866($dom; "id"; $id)  //because the id index needs to be re-built
	
End if 

//also for child elements
ARRAY LONGINT:C221($types; 0)
ARRAY TEXT:C222($nodes; 0)

DOM GET XML CHILD NODES:C1081($dom; $types; $nodes)

C_LONGINT:C283($p)

$p:=1

$p:=Find in array:C230($types; XML ELEMENT:K45:20; $p)

While ($p#-1)
	
	DOM_ELEMENT_REFRESH_ID($nodes{$p})
	
	$p:=Find in array:C230($types; XML ELEMENT:K45:20; $p+1)
	
End while 