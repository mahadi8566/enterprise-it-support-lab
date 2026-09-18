# 06 — Intune Settings Catalog Security Baseline

## Objective
Use Intune to actively configure Windows security settings, then validate them both from Intune and locally on the endpoint.

## Step 1 — Create Settings Catalog profile
Name:
`Windows 11 Corporate Security Baseline`

![Windows 11 Corporate Security Baseline basics](assets/06-01-Configuration-Policy-Basics.png)

*Evidence: Windows 11 Corporate Security Baseline basics.*


## Step 2 — Configure Microsoft Defender
Selected Administrative Templates → Microsoft Defender Antivirus → Real-time Protection.

Settings:
- Turn on behavior monitoring → Enabled
- Turn off real-time protection → Disabled
- Scan all downloaded files and attachments → Enabled
- Monitor file and program activity → Enabled


![Defender real-time protection settings](assets/06-02-Defender-Realtime-Settings.png)

*Evidence: Defender real-time protection settings.*


## Step 3 — Configure Windows Firewall
Enable:
- Domain Network Firewall
- Private Network Firewall
- Public Network Firewall


![Firewall settings selected in Settings Catalog](assets/06-03-Firewall-Settings-Catalog.png)

*Evidence: Firewall settings selected in Settings Catalog.*


## Step 4 — Assign to SG_IT_Users

![Security baseline assigned to SG_IT_Users](assets/06-04-Config-Assignment-SG-IT.png)

*Evidence: Security baseline assigned to SG_IT_Users.*


## Step 5 — Review and create

![Security baseline review](assets/06-05-Config-Review.png)

*Evidence: Security baseline review.*


## Step 6 — Force device sync
Windows:
**Settings → Accounts → Access work or school → Info → Sync**

## Step 7 — Verify Defender locally
Run PowerShell as Administrator:
```powershell
Get-MpComputerStatus |
Select-Object AntivirusEnabled,RealTimeProtectionEnabled,BehaviorMonitorEnabled
```


![Defender endpoint verification](assets/06-06-Defender-Endpoint-Verification.png)

*Evidence: Defender endpoint verification.*


## Step 8 — Verify effective Firewall configuration
```cmd
netsh advfirewall show allprofiles
```

Expected effective state:
- Domain / Private / Public → ON
- Inbound → Block
- Outbound → Allow


![Effective Windows Firewall configuration](assets/06-07-Firewall-Netsh-Verification.png)

*Evidence: Effective Windows Firewall configuration.*


## Step 9 — Verify Intune deployment status

![Intune policy deployment succeeded](assets/06-08-Config-Deployment-Succeeded.png)

*Evidence: Intune policy deployment succeeded.*


![Real-time protection policy setting succeeded](assets/06-09-Realtime-Policy-Succeeded.png)

*Evidence: Real-time protection policy setting succeeded.*


## Result
The lab proved both administrator-side deployment and endpoint-side security enforcement.
