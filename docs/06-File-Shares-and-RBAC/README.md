# 6. Department File Shares and Role-Based Access Control (RBAC)

## Step 6.1 — Create department folders

On DC01 create:

```text
C:\CompanyShares\IT
C:\CompanyShares\HR
C:\CompanyShares\Sales
```

Share each folder and use department AD groups for access control rather than assigning permissions user-by-user.

## Step 6.2 — Configure share and NTFS permissions

Apply least-privilege access so each department group has appropriate access only to its own share.

Example design:

- `GG_IT_Users` → IT share
- `GG_HR_Users` → HR share
- `GG_Sales_Users` → Sales share

Both share permissions and NTFS permissions were reviewed to ensure the effective permission model matched the intended RBAC design.

**Evidence — Server-side share permission configuration**

![Server-side share permission configuration](evidence/01-Share-Permission-Configuration.png)


## Step 6.3 — Validate the Sales drive as Sarah

Log in to CLIENT01 as Sales user `ADLAB\sahmed`.

Commands used during final validation:

```cmd
whoami
net use
dir S:\
```

**Observed result:**

- `whoami` returned `adlab\sahmed`.
- `S:` mapped to `\\DC01\Sales`.
- The Sales content was accessible.

**Evidence — Sarah receiving the Sales S: drive**

![Sarah receiving the Sales S: drive](evidence/02-Sales-Drive-Mapped-Sarah.png)


## Step 6.4 — Verify least privilege / access denied

From the same Sales session:

```cmd
dir \\DC01\HR
dir \\DC01\IT
```

**Observed result:** Both HR and IT access attempts returned **Access is denied**, while the Sales share remained accessible.

**Evidence — Sales user denied HR and IT shares**

![Sales user denied HR and IT shares](evidence/03-Sales-User-RBAC-Access-Denied.png)


**Evidence — End-to-end RBAC validation**

![End-to-end RBAC validation](evidence/04-RBAC-End-to-End-Validation.png)

