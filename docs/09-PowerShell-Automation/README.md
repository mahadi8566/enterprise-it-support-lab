# 9. PowerShell Administration and Helpdesk Automation

## Step 9.1 — Work with AD users and groups

Commands used across the lab included:

```powershell
Import-Module ActiveDirectory
Get-ADGroupMember -Identity GG_Sales_Users
Get-ADPrincipalGroupMembership -Identity mdmhasan | Select-Object Name
```

These commands were used to verify group membership and support RBAC troubleshooting.

**Evidence — PowerShell AD user-health / membership work**

![PowerShell AD user-health / membership work](evidence/01-PowerShell-AD-User-Health.png)


## Step 9.2 — Practice group lifecycle administration

A temporary security group named `GG_Test_PowerShell` was created, membership was tested, then it was cleaned up. The workflow used standard AD cmdlets:

```powershell
New-ADGroup -Name "GG_Test_PowerShell" -GroupScope Global -GroupCategory Security `
  -Path "OU=ADLAB-Groups,DC=adlab,DC=local"

Add-ADGroupMember -Identity "GG_Test_PowerShell" -Members mdmhasan
Get-ADGroupMember -Identity "GG_Test_PowerShell"
Remove-ADGroupMember -Identity "GG_Test_PowerShell" -Members mdmhasan -Confirm:$false
Remove-ADGroup -Identity "GG_Test_PowerShell" -Confirm:$false
```

**Observed result:** The temporary group and membership were successfully created, validated, removed and cleaned up.

**Evidence — PowerShell group-management practice**

![PowerShell group-management practice](evidence/02-PowerShell-Group-Management.png)


## Step 9.3 — Package common helpdesk tasks as functions

The final reusable script is saved in this archive as:

`../scripts/Helpdesk-AD-Toolkit.ps1`

Functions:

```text
Get-ADUserHealth
Unlock-HelpdeskUser
Get-DepartmentMembers
Get-FailedPasswordStatus
```

To load the script during the lab:

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force
. "C:\IT-Lab\Scripts\Helpdesk-AD-Toolkit.ps1"
```

Test command:

```powershell
Get-ADUserHealth -Username mdmhasan
```

**Observed result:** The function returned:

```text
Username        : mdmhasan
Enabled         : True
LockedOut       : False
PasswordLastSet : 9/13/2026 11:49:25 AM
LastLogonDate   : 9/11/2026 10:48:34 PM
Groups          : Domain Users, GG_IT_Users
```

**Evidence — Final PowerShell Helpdesk AD Toolkit output**

![Final PowerShell Helpdesk AD Toolkit output](evidence/03-PowerShell-Helpdesk-AD-Toolkit.png)

