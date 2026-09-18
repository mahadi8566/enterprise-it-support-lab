# 04 — Intune Enrollment and Windows 11 Cloud Device

## Objective
Create a separate cloud-managed Windows 11 VM, join it to Microsoft Entra ID and automatically enroll it into Microsoft Intune.

## Design choice
The existing `CLIENT01` remains an on-premises AD domain client. A separate VM, `INTUNE-W11`, is used for the modern cloud-managed scenario.

## Step 1 — Confirm Intune access
Open `intune.microsoft.com`.

![Microsoft Intune admin center](assets/04-01-Intune-Admin-Center.png)

*Evidence: Microsoft Intune admin center.*


## Step 2 — Configure automatic MDM enrollment
Go to **Devices → Windows → Windows enrollment → Automatic Enrollment**.

Lab setting:
- MDM user scope: `All`
- WIP user scope: `None`


![Automatic MDM enrollment configured](assets/04-02-MDM-Automatic-Enrollment-All.png)

*Evidence: Automatic MDM enrollment configured.*


## Step 3 — Create a Windows 11 Pro VM
VirtualBox:
- Name: `INTUNE-W11`
- Windows 11 Pro
- 4 GB RAM
- 2 vCPU
- 64–80 GB disk
- NAT network
- Existing Windows 11 ISO reused


![INTUNE-W11 Windows 11 Pro VM](assets/04-03-VirtualBox-INTUNE-W11-Pro.png)

*Evidence: INTUNE-W11 Windows 11 Pro VM.*


![INTUNE-W11 VirtualBox hardware](assets/04-04-VirtualBox-INTUNE-W11-Hardware.png)

*Evidence: INTUNE-W11 VirtualBox hardware.*


## Step 4 — Install Windows 11 and choose work/school setup
During Windows OOBE, select **Set up for work or school** rather than personal use.

![Windows 11 work or school setup](assets/04-05-Windows11-Setup-Work-School.png)

*Evidence: Windows 11 work or school setup.*


Use the standard cloud user:
`mdmhasan@MahadiITLab.onmicrosoft.com`

Do not use the Global Administrator account as the daily user.

## Step 5 — Verify work-account connection
On Windows:
**Settings → Accounts → Access work or school**


![Windows work account connected to Mahadi IT Lab](assets/04-06-Work-School-Entra-Connection.png)

*Evidence: Windows work account connected to Mahadi IT Lab.*


## Step 6 — Verify cloud-side device management
The device appeared as managed in Microsoft 365 and as Entra joined / Intune managed.

![INTUNE-W11 shown as a managed device](assets/04-07-M365-Device-Managed.png)

*Evidence: INTUNE-W11 shown as a managed device.*


![INTUNE-W11 Entra joined, Intune managed and compliant](assets/04-08-Entra-Joined-Intune-Compliant.png)

*Evidence: INTUNE-W11 Entra joined, Intune managed and compliant.*


## Result
`INTUNE-W11` became the cloud-managed endpoint used for compliance, configuration, app deployment and Conditional Access testing.
