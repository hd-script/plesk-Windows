$domain = Get-Content D:\automation\dbdomain.txt
$dbuser = Get-Content D:\automation\dbuser.txt
$dbpass = Get-Content D:\automation\dbpass.txt
$db = Get-Content D:\automation\db.txt
$count =$dbuser.Count
for($i=0;$i -lt $count;$i++)
{
  plesk bin database.exe --create $db[$i].Trim() -domain $domain[$i] -type mssql -add_user $dbuser[$i].Trim() -passwd $dbpass[$i].Trim()  
  #plesk bin database.exe --remove $db[$i].Trim() -domain $domain[$i]
  #database user creation
  #plesk bin database.exe --create-dbuser $dbuser[$i].Trim() -passwd $dbpass[$i].Trim() -domain $domain[$i] -type mssql
}


