$domain = Get-Content D:\automation\domain.txt
$subdom = Get-Content D:\automation\sub-domain.txt
$count = $subdom.count
for($i=0;$i -lt $count; $i++)
{
    
    $path = $subdom[$i]
    $path +="."+$domain[$i]
    Write-Host $path
    plesk bin subdomain.exe --create $subdom[$i] -domain $domain[$i] -www-root /$path
    #& 'D:\Plesk\bin\subdomain.exe' --update $subdom[$i] -domain $domain[$i] -www-root /$path
} 