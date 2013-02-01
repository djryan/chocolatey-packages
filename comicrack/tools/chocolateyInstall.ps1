$packageName = 'comicrack'
$installerType = 'exe'
$url = 'http://comicrack.cyolito.com/downloads/func-download/110/chk,ab592beb2bf864b2febba5d9484c08af/no_html,1/'
$url64 = $url 
$silentArgs = '/S' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes