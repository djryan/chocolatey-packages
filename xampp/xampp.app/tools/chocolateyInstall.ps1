$packageName = 'XAMPP.app'
$installerType = 'exe'
$url = 'http://www.apachefriends.org/download.php?xampp-win32-1.8.1-VC9-installer.exe'
$url64 = $url
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes