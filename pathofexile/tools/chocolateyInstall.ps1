$packageName = 'pathofexile'
$installerType = 'msi'
$url = 'http://webcdn.pathofexile.com/downloads/PathOfExileInstaller.msi'
$url64 = $url
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes