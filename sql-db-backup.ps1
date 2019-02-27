$dbname = Get-Content D:\automation\db.txt
$backuppath ="C:\bak"
foreach($i in $dbname)
{ 
    Write-Host "backup database [$($i.trim())] to disk = '$backuppath\$i.bak'"
}