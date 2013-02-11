$packageName = 'SpringToolSuite'
$url = 'http://dist.springsource.com/release/STS/3.1.0/dist/e4.2/spring-tool-suite-3.1.0.RELEASE-e4.2-win32.zip'
$url64 = 'http://dist.springsource.com/release/STS/3.1.0/dist/e4.2/spring-tool-suite-3.1.0.RELEASE-e4.2-win32-x86_64.zip'

try { 
  $binRoot = "$env:systemdrive\"
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot "springsource"
  $stsDir = Join-Path $installDir "sts-3.1.0.RELEASE"
  $stsFile = Join-Path $stsDir "STS.exe"
  $vFabricDir = Join-Path $installDir "vfabric-tc-server-developer-2.7.2.RELEASE"
  $rooDir = Join-Path $installDir "spring-roo-1.2.2.RELEASE\bin"
  
  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  $file = Join-Path $tempDir "$($packageName).zip"
  Get-ChocolateyWebFile "$packageName" "$file" "$url" "$url64"

  Start-Process "7za" -ArgumentList "x -o`"$binRoot`" -y `"$file`"" -Wait

  #Install-ChocolateyPath "$stsDir"
  Install-ChocolateyPath "$vFabricDir"
  Install-ChocolateyPath "$rooDir"

  Install-ChocolateyDesktopLink $stsFile

  $home = Join-Path [environment]::getfolderpath("mydocuments") "Repositories"  
  if($env:HOME -eq $null){Install-ChocolateyEnvironmentVariable "HOME" $home }
  
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}