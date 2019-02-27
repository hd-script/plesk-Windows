$path = "D:\yourpath"
$configfile = Get-ChildItem $path *.config -recurse 
foreach($file in $configfile)
{
    (Get-Content $file.PSPath) | 
    ForEach-Object { $_ -replace [regex]::Escape('.\MSSQLSERVER2012'), '.\MSSQLSERVER2014' } | #https://stackoverflow.com/questions/2333675/replace-path-in-powershell-string
    #ForEach-Object { $_ -replace "11.22.33.44", 'localhost' } |
    Set-Content $file.PSPath
}
