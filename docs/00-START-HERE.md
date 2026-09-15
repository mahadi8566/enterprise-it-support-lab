# Master Lab 1 — Complete Step-by-Step Documentation

## Enterprise Windows IT Support & Active Directory Home Lab

This archive reconstructs the lab from initial virtual-machine setup through final validation. It is written as a repeatable runbook: each section records the action, commands used where command-line work was actually performed, the observed result, and the associated screenshot evidence.

### Fidelity note

- GUI actions are documented as GUI steps; commands are **not invented** for steps that were completed through the interface.
- Where the lab clearly used a command, that command is included.
- A few optional PowerShell equivalents are labelled **Optional equivalent** and are not presented as commands that were necessarily used during the original run.
- The lab evidence comes from the screenshots preserved during the project.

### Lab identity

| Item | Value |
|---|---|
| Hypervisor | Oracle VirtualBox |
| Domain controller | `DC01` — Windows Server 2022 Standard Evaluation (Desktop Experience) |
| Client | `CLIENT01` — Windows 11 Pro |
| Domain | `adlab.local` |
| NetBIOS domain | `ADLAB` |
| Internal network | `192.168.10.0/24` |
| DC / DNS / DHCP | `192.168.10.10` |
| CLIENT01 lease | `192.168.10.100` |
| DC NAT address observed | `10.0.2.15` |

### Main AD objects

- User OUs: `ADLAB-Users\IT`, `ADLAB-Users\HR`, `ADLAB-Users\Sales`
- Computer OU: `ADLAB-Computers`
- Group OU: `ADLAB-Groups`
- Users: `mdmhasan` (IT), `sahmed` (Sales), `mbrown` (HR)
- Groups: `GG_IT_Users`, `GG_Sales_Users`, `GG_HR_Users`
- Shares: `C:\CompanyShares\IT`, `C:\CompanyShares\HR`, `C:\CompanyShares\Sales`

Open `MASTER-LAB-GUIDE.html` for the easiest offline reading experience, or read the numbered Markdown files in order.
