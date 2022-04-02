//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)
C_PICTURE:C286($2)

$params:=Count parameters:C259

If ($params>1)
	
	If (Length:C16($1)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($1; Current method name:C684; *; ""; $2)
		
	Else 
		
		$picture:=$2
		
		C_BOOLEAN:C305($didImageChange)
		$DomBgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomBgImage")
		$BgImage:=OBJECT Get pointer:C1124(Object named:K67:5; "BgImage")
		
		If (NEditor_Load_document($picture))
			
			NEditor_RESIZE_DOCUMENT  //after document size has changed
			
			NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
			
			NEditor_SET_BACKGROUND_IMAGE
			
			$BgImage->:=NEditor_Get_background_image($DomBgImage->)
			
			//natural on data change follows
			
		Else 
			
			NEditor_CHANGE_BACKGROUND_IMAGE($picture)
			
			//do we need to change the document size?
			
			NEditor_RESIZE_CANVAS  //before get_*_image, after document size is set 
			
			$BgImage->:=NEditor_Get_background_image($DomBgImage->)
			
			NEditor_SELECT_DELETE(True:C214)
			
			NEditor_ON_DATA_CHANGE(False:C215)
			
		End if 
		
	End if 
	
End if 