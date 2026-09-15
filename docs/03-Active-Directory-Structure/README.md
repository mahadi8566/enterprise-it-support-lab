# 3. Active Directory Organisational Structure, Users and Groups

## Step 3.1 — Create the OU structure

Using **Active Directory Users and Computers (ADUC)**, create:

```text
ADLAB-Users
├── IT
├── HR
└── Sales
ADLAB-Computers
ADLAB-Groups
```

Move `CLIENT01` into `ADLAB-Computers` so computer-targeted GPOs can be linked cleanly.

**Observed result:** Users, computers and security groups were separated into predictable administrative containers.

**Evidence — Active Directory OU structure**

![Active Directory OU structure](evidence/01-AD-Users-OUs-Structure.png)


## Step 3.2 — Create department users

Create these lab accounts:

| Display name | Username | Department |
|---|---|---|
| Md Mahadi Hasan | `mdmhasan` | IT |
| Sarah Ahmed | `sahmed` | Sales |
| Michael Brown | `mbrown` | HR |

Each account was placed in the appropriate departmental OU.

## Step 3.3 — Create security groups

In `ADLAB-Groups`, create Global Security groups:

- `GG_IT_Users`
- `GG_HR_Users`
- `GG_Sales_Users`

Add department users to the matching group.

**Evidence — AD users and groups**

![AD users and groups](evidence/02-AD-Users-and-Groups.png)


## Step 3.4 — Validate group membership

PowerShell/AD validation was used to confirm membership. A typical command used later in the lab was:

```powershell
Get-ADPrincipalGroupMembership -Identity mdmhasan | Select-Object Name
```

For a group-centric check:

```powershell
Get-ADGroupMember -Identity GG_Sales_Users
```

**Observed result:** Users belonged to their department group plus normal domain membership such as `Domain Users`.

**Evidence — Department security-group membership validation**

![Department security-group membership validation](evidence/03-AD-Group-Membership-Validation.png)

