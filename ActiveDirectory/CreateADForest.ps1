#Installs ADDS role and promotes to new forest.

param (
    [string]$DomainName,
    [string]$DomainNetBiosName,
    [securestring]$SafeModePassword
)

Install-WindowsFeature AD-Domain-Services
Add-WindowsFeature RSAT-ADDS-Tools
Install-ADDSForest -CreateDnsDelegation:$false -DomainName $DomainName -DomainNetbiosName $DomainNetBiosName -InstallDns:$true -NoRebootOnCompletion:$false -Force:$true -DomainMode "WinThreshold" -ForestMode "WinThreshold" -SafeModeAdministratorPassword $SafeModePassword