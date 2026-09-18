# 11 — Final Endpoint and MDM Validation

## Objective
Verify the Windows endpoint's Entra join, tenant registration, MDM enrollment and management tasks.

## Step 1 — Run dsregcmd
Open elevated PowerShell / Command Prompt:

```cmd
dsregcmd /status
```

Confirm:
- `AzureAdJoined : YES`
- Device name: `INTUNE-W11`
- Device authentication status: success
- Correct tenant
- MDM enrollment URLs present


![dsregcmd device state](assets/11-01-dsregcmd-Device-State.png)

*Evidence: dsregcmd device state.*


![dsregcmd tenant and MDM information](assets/11-02-dsregcmd-Tenant-MDM.png)

*Evidence: dsregcmd tenant and MDM information.*


## Step 2 — Verify EnterpriseMgmt scheduled tasks
PowerShell:

```powershell
Get-ScheduledTask | Where-Object {
    $_.TaskPath -like "*EnterpriseMgmt*"
} | Select-Object TaskName, State
```


![Intune MDM EnterpriseMgmt scheduled tasks](assets/11-03-EnterpriseMgmt-Scheduled-Tasks.png)

*Evidence: Intune MDM EnterpriseMgmt scheduled tasks.*


## Step 3 — Manual work-account sync
Windows:
**Settings → Accounts → Access work or school → Info → Sync**


![Successful manual MDM sync](assets/11-04-Manual-Sync-Success.png)

*Evidence: Successful manual MDM sync.*


## Final result
The cloud endpoint was Entra joined, Intune managed, compliant, receiving policy and app assignments, and communicating successfully with the MDM service.
