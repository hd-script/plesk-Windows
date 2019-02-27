$dbname = Get-Content D:\automation\db.txt
$dbserver = ".\MSSQLSERVER2014"
$count = $dbname.count
for($i=0;$i -lt $count;$i++)
{
    write-host "Restoring $($dbname[$i])"
    SQLCMD -S $dbserver -d master -Q "Alter Database [$($dbname[$i])] SET SINGLE_USER With ROLLBACK IMMEDIATE"
    $RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("$($dbname[$i])", "D:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\$($dbname[$i]).mdf")
    $RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("$($dbname[$i])_log", "D:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\$($dbname[$i])_log.LDF")
    Restore-SqlDatabase -ServerInstance $dbserver -Database "$($dbname[$i])" -BackupFile "D:\sql-backup\$($dbname[$i]).bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog) -KeepReplication
    SQLCMD -S $dbserver -d master -Q "Alter Database [$($dbname[$i])] SET MULTI_USER WITH ROLLBACK IMMEDIATE "
}