# 5. Group Policy and Endpoint Security

## Step 5.1 — Configure the domain account lockout policy

Edit **Default Domain Policy** under:

`Computer Configuration → Policies → Windows Settings → Security Settings → Account Policies → Account Lockout Policy`

Configured values:

- Account lockout threshold: **5 invalid logon attempts**
- Account lockout duration: **30 minutes**
- Reset account lockout counter after: **30 minutes**

**Observed result:** Five bad-password attempts could lock a domain account as designed.

**Evidence — Account lockout policy in Group Policy**

![Account lockout policy in Group Policy](evidence/01-GPO-Account-Lockout-Policy.png)


## Step 5.2 — Configure the user workplace GPO and Sales drive mapping

A user GPO named `GPO-User-Workplace-Setting` was linked to `ADLAB-Users`.

Drive mapping preference:

- Path: `\\DC01\Sales`
- Drive letter: `S:`
- Label: `Sales Department`
- Target: members of `GG_Sales_Users`

Use **Group Policy Preferences → Windows Settings → Drive Maps**.

**Evidence — GPO Sales drive mapping configuration**

![GPO Sales drive mapping configuration](evidence/02-GPO-Drive-Maps-Configuration.png)


Use **Common → Item-level targeting** to target the Sales security group.

**Evidence — Security-group targeting for the Sales drive**

![Security-group targeting for the Sales drive](evidence/03-GPO-Security-Group-Targeting.png)


## Step 5.3 — Create a workstation security baseline

A computer GPO named `GPO-Workstation-Security-Baseline` was linked to `ADLAB-Computers`.

Controls configured/validated included:

- Interactive logon security banner.
- Microsoft Defender Firewall Domain Profile: **On**.
- Default inbound action: **Block**.
- Default outbound action: **Allow**.
- Microsoft Defender real-time protection enforced.
- Advanced logon auditing (covered in the auditing section).

## Step 5.4 — Enforce Microsoft Defender real-time protection

GPO path:

`Computer Configuration → Policies → Administrative Templates → Windows Components → Microsoft Defender Antivirus → Real-time Protection`

Set:

`Turn off real-time protection = Disabled`

That wording is intentional: **Disabled** means users/policy cannot turn real-time protection off through that setting.

**Evidence — GPO enforcing Defender real-time protection**

![GPO enforcing Defender real-time protection](evidence/04-GPO-Defender-Realtime-Protection.png)


On CLIENT01, refresh policy:

```cmd
gpupdate /force
```

Then verify in PowerShell:

```powershell
Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled
```

**Observed result:**

```text
AntivirusEnabled             True
RealTimeProtectionEnabled    True
```

**Evidence — Defender antivirus and real-time protection verified**

![Defender antivirus and real-time protection verified](evidence/05-Defender-Realtime-Protection-Verified.png)


## Step 5.5 — Verify applied computer policy

On CLIENT01:

```cmd
gpupdate /force
gpresult /scope computer /r
```

**Observed result:** `GPO-Workstation-Security-Baseline` and `Default Domain Policy` were listed as applied. The computer DN showed `CLIENT01` in `OU=ADLAB-Computers`.

**Evidence — Final Group Policy validation on CLIENT01**

![Final Group Policy validation on CLIENT01](evidence/06-GPO-Final-Validation-CLIENT01.png)

