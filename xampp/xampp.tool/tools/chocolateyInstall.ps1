$packageName = 'XAMPP.tool'
$url = 'http://www.apachefriends.org/download.php?xampp-win32-1.8.1-VC9.zip'
$url64 = $url

$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" "$url64"