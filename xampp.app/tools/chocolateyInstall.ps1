$packageName = 'XAMPP.app'

$binRoot = "$env:systemdrive\"
if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
$xmppPath = join-path $binRoot 'xampp'

$installerType = 'exe'
$url = 'http://www.apachefriends.org/download.php?xampp-win32-1.8.1-VC9-installer.exe'
$url64 = $url
$silentArgs = "--mode unattended --prefix `"$xmppPath`""
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes