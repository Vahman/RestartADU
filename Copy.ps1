#
# Copy.ps1
#
$AssemblyPath = 'c:\Users\wahnenko\Documents\Visual Studio 2013\Projects\ADU\bin\Release\'
$AssemblyName = 'ADU*.dll'
$FullPath = $AssemblyPath + $AssemblyName

$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$FullName = $directorypath + '\NS.txt'
$Lines = Get-Content $FullName

foreach($Comp in $Comps)
{
	$ResultComp = '\\' + $Comp + '\c$\Program Files\Microsoft Dynamics NAV\71\Service\Add-ins\ADU'
	Copy-Item -Path $FullPath -Destination $ResultComp -Force
}