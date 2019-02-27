$webspace = Get-Content D:\automation\primarydomain.txt
$addon = Get-Content D:\automation\addon.txt
$count = $addon.count
for($i=0;$i -lt $count;$i++)
{
    #& 'D:\Plesk\bin\site.exe' --create $addon[$i] -webspace-name $webspace[$i] -www-root $addon[$i]
    #plesk bin site.exe --update $addon[$i] -www-root $addon[$i]
    if($($addon[$i].Trim()) -ne $($webspace[$i].Trim()))
    {
        #Write-Host "adding $($addon[$i])"
        plesk bin site.exe --create $addon[$i].Trim() -webspace-name $webspace[$i].Trim() -www-root $addon[$i].Trim()
        #plesk bin site.exe -r $addon[$i].Trim()
    }
    else { Write-Host "Primary domain skipped" }
}

