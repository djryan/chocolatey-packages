$packageName = 'minecraft'
$url = 'https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.exe'
$url64 = $url

try {
  $scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $nodePath = Join-Path $scriptPath 'minecraft.exe'
  Get-ChocolateyWebFile "$packageName" "$nodePath" "$url" "$url64"
  Install-ChocolateyPath "$nodePath" 'Machine' # Machine will assert administrative rights
  Install-ChocolateyDesktopLink "$nodePath"
  
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}