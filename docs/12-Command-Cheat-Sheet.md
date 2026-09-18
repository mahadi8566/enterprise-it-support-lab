# Command Cheat Sheet

## Client networking and DNS

```cmd
ipconfig /all
ipconfig /flushdns
nslookup dc01.adlab.local
ping dc01.adlab.local
nltest /dsgetdc:adlab.local
nltest /sc_verify:adlab.local
```

## Group Policy

```cmd
gpupdate /force
gpresult /scope computer /r
```

## RBAC / mapped drive validation

```cmd
whoami
net use
dir S:\
dir \\DC01\Sales
dir \\DC01\HR
dir \\DC01\IT
```

## Defender and auditing

```powershell
Get-MpComputerStatus | Select-Object AntivirusEnabled,RealTimeProtectionEnabled
```

```cmd
auditpol /get /subcategory:"Logon"
```

## Active Directory user/group checks

```powershell
Import-Module ActiveDirectory
Get-ADUser -Identity sahmed -Properties LockedOut,BadPwdCount,LastBadPasswordAttempt
Unlock-ADAccount -Identity sahmed
Get-ADGroupMember -Identity GG_Sales_Users
Get-ADPrincipalGroupMembership -Identity mdmhasan | Select-Object Name
```

## DNS-client registration / cleanup

```powershell
Get-DnsClient | Select-Object InterfaceAlias,RegisterThisConnectionsAddress
Set-DnsClient -InterfaceAlias "Ethernet-ADLAB" -RegisterThisConnectionsAddress $true
Remove-DnsServerResourceRecord -ZoneName "adlab.local" -RRType "A" -Name "dc01" -RecordData "10.0.2.15" -Force
```

## Helpdesk toolkit

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force
. "C:\IT-Lab\Scripts\Helpdesk-AD-Toolkit.ps1"
Get-ADUserHealth -Username mdmhasan
Unlock-HelpdeskUser -Username sahmed
Get-DepartmentMembers -GroupName GG_Sales_Users
Get-FailedPasswordStatus -Username sahmed
```
