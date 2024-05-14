//%attributes = {}
$schema:=mdb test(File:C1566("/RESOURCES/顧客管理.accde").platformPath)

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

If (Match regex:C1019("(?m:That file uses encoding.*$)(.*)"; $schema; 1; $pos; $len))
	
	$sql:=Substring:C12($schema; $pos{1})
	
	SET TEXT TO PASTEBOARD:C523($sql)
	
End if 