//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_BOOLEAN:C305($0)

$id:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

C_TEXT:C284($objectId)
SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:object-id"; $objectId)

$0:=($objectId=$id)

$0:=(1=Position:C15($id; $objectId; *)) & (Length:C16($id)=Length:C16($objectId))