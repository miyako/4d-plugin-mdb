//%attributes = {"invisible":true}
$path:=File:C1566(File:C1566("/RESOURCES/顧客管理.accde").platformPath; fk platform path:K87:2).path

$sql:="select * from [W12_顧客マスター]"

$status:=mdb sql($path; $sql)

If ($status.success)
	ALERT:C41(JSON Stringify:C1217($status.values))
End if 