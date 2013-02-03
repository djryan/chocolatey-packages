$packageName = 'XAMPP.tool'

$binRoot = "$env:systemdrive\"
if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
$xmppPath = join-path $binRoot $('xampp')

$url = 'http://www.apachefriends.org/download.php?xampp-win32-1.8.1-VC9.zip'
$url64 = $url

Install-ChocolateyZipPackage "$packageName" "$url" "$xmppPath" "$url64"