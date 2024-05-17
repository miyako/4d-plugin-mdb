//%attributes = {"invisible":true}
$path:=File:C1566(File:C1566("/RESOURCES/顧客管理.accde").platformPath; fk platform path:K87:2).path

$table:="W12_顧客マスター"

$output:=File:C1566(Folder:C1567(fk desktop folder:K87:19).file("export/顧客管理/W12_顧客マスター.sql").platformPath; fk platform path:K87:2).path
File:C1566($output).parent.create()

$status:=mdb export($path; $table; $output)

If ($status.success)
	ALERT:C41(JSON Stringify:C1217($status.values))
End if 