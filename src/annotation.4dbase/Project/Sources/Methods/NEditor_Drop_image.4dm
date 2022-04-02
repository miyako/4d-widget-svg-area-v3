//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $isAccepted)

$MouseX:=$1
$MouseY:=$2

If (Macintosh option down:C545)
	If ($MouseX>0) & ($MouseY>0)
		
		C_PICTURE:C286($picture)
		GET PICTURE FROM PASTEBOARD:C522($picture)
		
		$size:=Picture size:C356($picture)
		
		If ($size#0)
			
			
			C_BOOLEAN:C305($didImageChange)
			$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
			$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
			
			If (NEditor_Load_document($picture))
				
				NEditor_RESIZE_DOCUMENT  //after document size has changed
				
				NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
				
				NEditor_SET_BACKGROUND_IMAGE
				
				$BgImage->:=NEditor_Get_background_image($DomBgImage->)
				
				//On Bound Variable Change is not called because of filtered event ($0:=-1)
				
				NEditor_ON_DATA_CHANGE(False:C215)
				
			Else 
				
				NEditor_CHANGE_BACKGROUND_IMAGE($picture)
				
				//do we need to change the document size?
				
				NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
				
				$BgImage->:=NEditor_Get_background_image($DomBgImage->)
				
				NEditor_SELECT_DELETE(True:C214)
				
				NEditor_ON_DATA_CHANGE(False:C215)
				
			End if 
			
			$isAccepted:=True:C214
			
		End if 
		
	End if 
End if 

$0:=$isAccepted