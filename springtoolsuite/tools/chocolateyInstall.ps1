#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one

$packageName = 'springtoolsuite' # arbitrary name for the package, used in messages
$url = 'http://dist.springsource.com/release/STS/3.1.0/dist/e4.2/spring-tool-suite-3.1.0.RELEASE-e4.2-win32.zip' # download url
$url64 = 'http://dist.springsource.com/release/STS/3.1.0/dist/e4.2/spring-tool-suite-3.1.0.RELEASE-e4.2-win32-x86_64.zip' # 64bit URL here or just use the same as $url

try { 
  #$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot "$packageName"

  #Write-Host "Adding `'$installDir`' to the path and the current shell path"
  #Install-ChocolateyPath "$installDir"
  #$env:Path = "$($env:Path);$installDir"
  #Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" "$url64"
  ### OR for 7z ###
  
  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}

  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  $file = Join-Path $tempDir "$($packageName).zip"
  Get-ChocolateyWebFile "$packageName" "$file" "$url" "$url64"

  Start-Process "7za" -ArgumentList "x -o`"$installDir`" -y `"$file`"" -Wait

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}