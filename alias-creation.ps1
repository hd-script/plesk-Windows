$alias = Get-Content D:\automation\alias.txt
foreach($i in $alias)
{
    plesk bin domalias --create $i -domain primarydomain.com -status enabled -mail true
}