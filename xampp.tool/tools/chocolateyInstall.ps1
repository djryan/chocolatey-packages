$packageName = 'XAMPP.tool'

$binRoot = "$env:systemdrive\"
if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
$installDir = join-path $binRoot $('xampp')

$url = 'http://www.apachefriends.org/download.php?xampp-win32-1.8.1-VC9.7z'
$url64 = $url

try { 
  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  $file = Join-Path $tempDir "$($packageName).7z"
  Get-ChocolateyWebFile "$packageName" "$file" "$url"

  # the 7zip file contains the folder xampp so the target folder has to be binRoot directly
  Start-Process "7za" -ArgumentList "x -o`"$binRoot`" -y `"$file`"" -Wait
  
  if (![System.IO.Directory]::Exists($installDir)) { Write-ChocolateyFailure "$packageName" "xampp folder was not at the expectec position at $installDir" }

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}