$packageName = 'teamspeak3'
$installerType = 'exe'
$url = 'http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.9.2/TeamSpeak3-Client-win32-3.0.9.2.exe'
$url64 = 'http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.9.2/TeamSpeak3-Client-win64-3.0.9.2.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes