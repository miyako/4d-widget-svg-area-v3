//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_REAL:C285($2)

$params:=Count parameters:C259

If ($params>1)
	
	If (Length:C16($1)#0)
		
		If ($2#NEditor_Get_rotate($1))
			
			EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; *; ""; $2)
			
		End if 
		
	Else 
		
		$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		$canvas:=DOM Find XML element by ID:C1010($Container->; "canvas")
		
		C_REAL:C285($sx; $sy; $tx; $ty; $cx; $cy; $r)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:sx"; $sx)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:sy"; $sy)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:tx"; $tx)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:ty"; $ty)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:cx"; $cx)
		DOM GET XML ATTRIBUTE BY NAME:C728($canvas; "editor:cy"; $cy)
		
		$r:=$2
		
		$translate:="translate("+Str($tx)+","+Str($ty)+")"
		$scale:="scale("+Str($sx)+","+Str($sy)+")"
		$rotate:="rotate("+Str($r)+","+Str($cx)+","+Str($cy)+")"
		$transform:=$translate+" "+$scale+" "+$rotate
		
		DOM SET XML ATTRIBUTE:C866($canvas; "editor:r"; $r; "transform"; $transform)
		
		$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
		$canvas:=DOM Find XML element by ID:C1010($DomBgImage->; "canvas")
		DOM SET XML ATTRIBUTE:C866($canvas; "editor:r"; $r)
		
		If (False:C215)
			$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
			$BgImage->:=NEditor_Get_background_image($DomBgImage->)
			
			//this will update image
			NEditor_ON_DATA_CHANGE
		End if 
		
		$IsRotating:=OBJECT Get pointer:C1124(Object named:K67:5; "IsRotating")
		$IsRotating->:=1
		
		SET TIMER:C645(NEditor_Get_timer_for_event)
		
	End if 
	
End if 