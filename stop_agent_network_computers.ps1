# Totally not tested outside of core logic - there are way nicer ways to write this but I'm tired
# THis will attempt to enumeate all domain computers and stop the agent service using win-RM
# Use at own risk
# be safe - mRr3b00t

$computers = [adsisearcher]"(&(objectCategory=Computer))"

$computerlist = ($computers.findall()).properties

foreach($object in $computerlist ){

$object.name
$s = New-PSSession -ComputerName $object.name
Invoke-Command -Session $s -ScriptBlock {Stop-Service -Name Kaysea Agent -Force} -AsJob

}

#wait a few minutes
Start-Sleep -Seconds 120

#get the job status
#clearly you could check the status etc.

$j = Get-Job
$j | Format-List -Property *
$results = $j | Receive-Job

$results
