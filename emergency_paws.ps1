# Emergency PAWS network lockdown - mRr3b00t
# disable all inbound windows defender firewall rules then create remote management rules for a specific IP adddress
# use at own risk
# Clean the custom rules out first
Get-NetFirewallRule -DisplayName "*PwnDefend - Allow*" | Remove-NetFirewallRule

#Lockdown ALL inbound rules by disabling them

Disable-NetFirewallRule -Direction Inbound

New-NetFirewallRule -DisplayName "PwnDefend - Allow RDP" -Direction Inbound -Action Allow -LocalPort 3389 -Protocol TCP -RemoteAddress 192.168.1.xx

New-NetFirewallRule -DisplayName "PwnDefend - Allow WINRM" -Direction Inbound -Action Allow -LocalPort 5985 -Protocol TCP -RemoteAddress 192.168.1.xx
New-NetFirewallRule -DisplayName "PwnDefend - Allow WINRMS" -Direction Inbound -Action Allow -LocalPort 5986 -Protocol TCP -RemoteAddress 192.168.1.xx
New-NetFirewallRule -DisplayName "PwnDefend - Allow SMB" -Direction Inbound -Action Allow -LocalPort 5986 -Protocol TCP -RemoteAddress 192.168.1.xx
