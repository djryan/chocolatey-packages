$packageName = 'comicrack'
$installerType = 'exe'
$url = 'http://comicrack.cyolito.com/downloads/comicrack/func-startdown/111/'
$url64 = $url 
$silentArgs = '/S' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes