wget "https://www.zabbix.com/downloads/4.2.1/zabbix_agents-4.2.1-win-amd64.zip"  -OutFile "c:\zabbix\tst.zip"
Expand-Archive -Path "C:\zabbix\tst.zip" -DestinationPath C:\zabbix
Move-Item -Path C:\zabbix\conf\zabbix_agentd.conf -Destination C:\zabbix
$path = "C:\zabbix"
$hostname = $env:COMPUTERNAME
$hostname +=".is.cc"
write-host $hostname
$configfile = Get-ChildItem $path *.conf -recurse 
foreach($file in $configfile)
{
    (Get-Content $file.PSPath) | 
    ForEach-Object { $_ -replace "127.0.0.1", 'hv-server-ip' ` -replace "Windows host",$hostname } | #https://stackoverflow.com/questions/3403217/how-to-replace-multiple-strings-in-a-file-using-powershell
    #ForEach-Object { $_ -replace "Windows host", "hyperv44.is.cc" }
    Set-Content $file.PSPath
}
c:\zabbix\bin\zabbix_agentd.exe -c c:\zabbix\zabbix_agentd.conf -i
Start-Service "Zabbix Agent"
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="Open Port 10050" dir=in action=allow protocol=TCP localport=10050
