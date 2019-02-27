$list = Get-Content D:\automation\domain.txt
foreach($i in $list)
{
    C:\Windows\System32\cmd.exe /c "plesk bin dns.exe --add $i -ns """" -nameserver old1a.dns-server.net" 
    C:\Windows\System32\cmd.exe /c "plesk bin dns.exe --add $i -ns """" -nameserver old1b.dns-server.net" 
    C:\Windows\System32\cmd.exe /c "plesk bin dns.exe --del $i -ns """" -nameserver new1a.dns-server.net" 
    C:\Windows\System32\cmd.exe /c "plesk bin dns.exe --del $i -ns """" -nameserver new1b.dns-server.net" 
}
