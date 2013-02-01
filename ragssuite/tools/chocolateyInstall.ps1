$packageName = 'ragssuite'
$installerType = 'msi'
$url = 'http://www.ragsgame.com/Downloads/RagsSetup.2.4.msi'
$url64 = $url
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes