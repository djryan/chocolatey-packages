$packageName = 'UPX'
$url = 'http://upx.sourceforge.net/download/upx308w.zip' # download url
$url64 = $url

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"