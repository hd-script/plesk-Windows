$email = Get-Content D:\automation\email.txt
$count = $email.Count
#split the words based on space and store it in array
#[string[]]$mailbox = $email.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
$pass = Get-Content D:\automation\email-pass.txt
#[string[]]$passwd = $pass.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
for($i=0;$i -lt $count;$i++)
{
    #plesk bin mail.exe --create $email[$i].Trim() -passwd $pass[$i].Trim() -mailbox true -antivirus inout
    plesk bin mail.exe --update $email[$i].Trim() -antivirus inout -passwd $pass[$i].Trim()
}

#plesk bin mail.exe --create  info@ilmipoint.com -passwd '6Yuy.{QE' -mailbox true -antivirus inout
