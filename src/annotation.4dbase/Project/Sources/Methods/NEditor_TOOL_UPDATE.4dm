//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$count:=NEditor_SELECT_Get_count($Container->)

OBJECT SET ENABLED:C1123(*; "Delete"; 0<$count)
OBJECT SET ENABLED:C1123(*; "Back"; 0<$count)

OBJECT SET ENABLED:C1123(*; "Align@"; 1<$count)
OBJECT SET ENABLED:C1123(*; "Distribute@"; 2<$count)

$objects:=DOM Find XML element by ID:C1010($Container->; "objects")
$total:=DOM Count XML elements:C726($objects; "object")

OBJECT SET ENABLED:C1123(*; "AlignCombo@"; 1<$count)
OBJECT SET ENABLED:C1123(*; "MoveCombo@"; ($total#1) & (0<$count))

OBJECT SET ENABLED:C1123(*; "MoveFront@"; ($total#1) & (0<$count))
OBJECT SET ENABLED:C1123(*; "MoveBack@"; ($total#1) & (0<$count))

OBJECT SET ENABLED:C1123(*; "MoveLeft@"; 0<$count)
OBJECT SET ENABLED:C1123(*; "MoveRight@"; 0<$count)
OBJECT SET ENABLED:C1123(*; "MoveUp@"; 0<$count)
OBJECT SET ENABLED:C1123(*; "MoveDown@"; 0<$count)

OBJECT SET ENABLED:C1123(*; "GrowLeft@"; 0<$count)
OBJECT SET ENABLED:C1123(*; "GrowRight@"; 0<$count)
OBJECT SET ENABLED:C1123(*; "GrowUp@"; 0<$count)
OBJECT SET ENABLED:C1123(*; "GrowDown@"; 0<$count)

$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$HistoryContainers:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryContainers")

OBJECT SET ENABLED:C1123(*; "Rewind"; 1<$HistoryIndex->)
OBJECT SET ENABLED:C1123(*; "Forward"; Size of array:C274($HistoryContainers->)>$HistoryIndex->)