#
# Start.ps1
#
$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$FullName = $directorypath + '\NS.txt'
$Lines = Get-Content $FullName


foreach($Comp in $Lines)
{
	$Service = Get-Service -ComputerName $Comp -Name 'MicrosoftDynamicsNavServer$ADU'
	Start-Service -InputObject $Service -Verbose
}

