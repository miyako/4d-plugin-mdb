//%attributes = {"invisible":true}
$path:=File:C1566(File:C1566("/RESOURCES/顧客管理.accde").platformPath; fk platform path:K87:2).path

$status:=mdb tables($path)

If ($status.success)
	For each ($table; $status.tables.query("type == :1"; "user"))
		$output:=File:C1566(Folder:C1567(fk desktop folder:K87:19).file("export/顧客管理/"+$table.name+".sql").platformPath; fk platform path:K87:2).path
		File:C1566($output).parent.create()
		$status:=mdb export($path; $table.name; $output)
	End for each 
End if 