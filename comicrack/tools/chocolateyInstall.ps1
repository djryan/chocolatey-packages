$packageName = 'comicrack'
$installerType = 'exe'
$url = 'http://comicrack.cyolito.com/files/comicrack/ComicRackSetup09177.exe'
$url64 = $url 
$silentArgs = '/S' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes