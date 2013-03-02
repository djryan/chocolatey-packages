$packageName = 'RazerSynapse'
$installerType = 'exe'
$url = 'http://www.razersupport.com/index.php?_m=downloads&_a=downloadfile&downloaditemid=861'
$url64 = $url
$silentArgs = '/S /v/qn'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
