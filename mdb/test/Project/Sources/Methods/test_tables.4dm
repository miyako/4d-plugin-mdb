//%attributes = {"invisible":true}
$path:=File:C1566(File:C1566("/RESOURCES/顧客管理.accde").platformPath; fk platform path:K87:2).path

$status:=mdb tables($path)

If ($status.success)
	SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($status.tables; *))
End if 