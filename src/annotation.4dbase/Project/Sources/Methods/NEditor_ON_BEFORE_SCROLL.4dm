//%attributes = {"invisible":true}
//$Container:=OBJECT Get pointer(Object subform container)
//$IsScrolling:=OBJECT Get pointer(Object named;"IsScrolling")
//$IsTracking:=OBJECT Get pointer(Object named;"IsTracking")
//
//If ($IsScrolling->=0)
//
//NEditor_TEXT_EDIT_End 
//
//$IsScrolling->:=1
//
//C_LONGINT($imVisible;$bgVisible)
//
//C_BOOLEAN($shouldRedraw)
//
//$canvas:=DOM Find XML element by ID($Container->;"canvas")
//$use:=DOM Find XML element by ID($Container->;"use")
//
//C_TEXT($visible)
//DOM GET XML ATTRIBUTE BY NAME($use;"visibility";$visible)
//
//If (0=$IsTracking->)
//OBJECT SET VISIBLE(*;"BgImage";False)
//$imVisible:=1
//$bgVisible:=0
//If ($visible#"visible")
//DOM SET XML ATTRIBUTE($use;"visibility";"visible")
//$shouldRedraw:=True
//End if 
//Else 
////scroll can happen while tracking; in that case, keep bg visible
//OBJECT SET VISIBLE(*;"BgImage";True)
//$imVisible:=0
//$bgVisible:=1
//If ($visible#"hidden")
//DOM SET XML ATTRIBUTE($use;"visibility";"hidden")
//$shouldRedraw:=True
//End if 
//End if 
//
//SET TIMER(-1)
//
//If ($shouldRedraw)
//$Image:=OBJECT Get pointer(Object named;"Image")
//$Image->:=NEditor_Get_layer_image ($Container->)
//End if 
//
//If (NEditor_Get_debug_mode )
//$Debug_BgVisible:=OBJECT Get pointer(Object named;"Debug_BgVisible")
//$Debug_ImVisible:=OBJECT Get pointer(Object named;"Debug_ImVisible")
//$Debug_BgVisible->:=$bgVisible
//$Debug_ImVisible->:=$imVisible
//End if 
//
//End if 