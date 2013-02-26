$packageName = 'SpaceBukkit'

$toolkitUrl = 'http://drdanick.com/downloads/dl.php?id=remotetoolkit&ver=latest'
$craftBukkitUrl = 'http://dl.bukkit.org/latest-rb/craftbukkit.jar'
$spaceBukkitModuleUrl = 'http://dev.drdanick.com/jenkins/job/SpaceModule/lastSuccessfulBuild/artifact/target/spacemodule-1.2-SNAPSHOT.jar'

$spaceBukkitPanelsUrl = 'https://github.com/SpaceDev/SpaceBukkitPanel/archive/master.zip'

try {
  $binRoot = "$env:systemdrive\"
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  
  $httpdConfFile = Join-Path $binRoot "/xampp/apache/conf/httpd.conf"
  if (![System.IO.File]::Exists($httpdConfFile)) {Write-ChocolateyFailure "can not find httpd.conf of apache"}
  
  
  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
  
  $installDir = Join-Path $binRoot "SpaceBukkit"
  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}
  
  # STEP 1: set up CraftBukkit with remote toolkit
  # get minecraft remote toolkit
  $remoteToolkitFile = Join-Path $tempDir "$($packageName)-toolkit.zip"
  Install-ChocolateyZipPackage "$packageName" "$toolkitUrl" "$installDir"
  
  # get craftbukkit
  Get-ChocolateyWebFile "$packageName" "$craftBukkitUrl" "$installDir"

  $moduleDir = Join-Path $installDir "serverdir\toolkit\modules"
  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}
  
  # get spacebukkit module for remote toolkit
  $moduleFile = Join-Path $moduleDir "$($packageName)Module.jar"
  Get-ChocolateyWebFile "$packageName" "$moduleFile" "$spaceBukkitModuleUrl"
  
  # create desktop link
  #$target = Join-Path $MyInvocation.MyCommand.Definition "$($packageName).exe"
  #Install-ChocolateyDesktopLink $target
  
  # STEP 2: get pannels (direct download of stable master branch)
  $panelFile = Join-Path $tempDir "$($packageName)Panels.zip"
  Get-ChocolateyWebFile "$packageName" "$panelFile" "$spaceBukkitPanelsUrl"
  Get-ChocolateyUnzip "panelFile" "$installDir"
  
  # result
  $panelDir = Join-Path $installDir "SpaceBukkitPanel-master"
  
  # STEP 3: configure xampp
  
  # enable curl - curl is active by default
  # enable rewrite - mod_rewrite is active by default
  # enable alias - alias is active by default
  # add alias - add following block to httpd.conf
  
  # Add-Content c:\sample.txt "`r`n<Directory `"$panelDir`"=`"`">
  # `r`n  Options Indexes FollowSymLinks Includes ExecCGI
  # `r`n  AllowOverride All
  # `r`n  Order allow,deny
  # `r`n  Allow from all
  # `r`n</Directory>
  # `r`nAlias /spacebukkit `"$panelDir`""
  
  # STEP 4: restart appache and open web based installation
  
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
