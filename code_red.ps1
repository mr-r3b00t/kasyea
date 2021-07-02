# Insane PAWS creation script - don't use this it's bonkers and will probably nuke ur network access... but lulz



$computers = [adsisearcher]"(&(objectCategory=Computer))"

$computerlist = ($computers.findall()).properties

foreach($object in $computerlist ){

$object.name
$s = New-PSSession -ComputerName $object.name
Invoke-Command -Session $s -ScriptBlock {Get-NetFirewallRule -DisplayName "*PwnDefend - Allow*" | Remove-NetFirewallRule ; Disable-NetFirewallRule -Direction Inbound; New-NetFirewallRule -DisplayName "PwnDefend - Allow RDP" -Direction Inbound -Action Allow -LocalPort 3389 -Protocol TCP -RemoteAddress 192.168.1.xx;New-NetFirewallRule -DisplayName "PwnDefend - Allow WINRM" -Direction Inbound -Action Allow -LocalPort 5985 -Protocol TCP -RemoteAddress 192.168.1.xx;New-NetFirewallRule -DisplayName "PwnDefend - Allow WINRMS" -Direction Inbound -Action Allow -LocalPort 5986 -Protocol TCP -RemoteAddress 192.168.1.xx;New-NetFirewallRule -DisplayName "PwnDefend - Allow SMB" -Direction Inbound -Action Allow -LocalPort 5986 -Protocol TCP -RemoteAddress 192.168.1.xx;} -AsJob

}

#wait a few minutes
Start-Sleep -Seconds 120

#get the job status
#clearly you could check the status etc.

$j = Get-Job
$j | Format-List -Property *
$results = $j | Receive-Job

$results

Get-PSSession | Remove-PSSession
