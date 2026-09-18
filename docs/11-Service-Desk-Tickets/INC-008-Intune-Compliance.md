# INC-008 — Intune Firewall Compliance Evaluation

**Status:** Resolved  
**Category:** Endpoint Management / Intune  
**Priority:** P3 — Medium  
**Environment:** Microsoft Intune / Windows 11

> Simulated Service Desk ticket reconstructed from troubleshooting completed in this personal lab.

## User report
The managed Windows 11 endpoint initially showed a firewall-related compliance evaluation problem in Intune.

## Investigation
Before changing policy, the endpoint firewall state and Windows Defender Firewall service were checked locally.

```powershell
Get-NetFirewallProfile | Select-Object Name,Enabled
Get-Service MpsSvc
```

The endpoint firewall was already enabled.

## Resolution
No unnecessary policy change was made. The device was synced and allowed to re-evaluate compliance.

## Validation
The endpoint subsequently reported compliant and all configured compliance checks passed.

## Evidence
![Firewall verification](../13-Microsoft-365-Entra-Intune/assets/05-08-Firewall-PowerShell-Verification.png)

![Compliance success](../13-Microsoft-365-Entra-Intune/assets/05-09-Compliance-Final-Success.png)

![All checks compliant](../13-Microsoft-365-Entra-Intune/assets/05-10-Per-Setting-All-Compliant.png)
