# 8. Advanced Audit Policy and Event Viewer Investigation

## Step 8.1 — Enable logon auditing

Edit the workstation security baseline:

`Computer Configuration → Policies → Windows Settings → Security Settings → Advanced Audit Policy Configuration → Audit Policies → Logon/Logoff`

Configure:

`Audit Logon = Success and Failure`

**Evidence — GPO advanced audit policy for logon success and failure**

![GPO advanced audit policy for logon success and failure](evidence/01-GPO-Audit-Logon-Success-Failure.png)


## Step 8.2 — Refresh and verify the policy on CLIENT01

Run:

```cmd
gpupdate /force
auditpol /get /subcategory:"Logon"
```

**Observed result:** The `Logon` subcategory showed **Success and Failure**.

**Evidence — CLIENT01 audit policy verification**

![CLIENT01 audit policy verification](evidence/02-Audit-Policy-CLIENT01-Verified.png)


## Step 8.3 — Generate a controlled failed logon

1. Attempt one intentionally incorrect password for `sahmed`.
2. Then log in correctly.
3. Open Event Viewer with administrative privileges (a standard user could not read the Security log directly).
4. Navigate to **Windows Logs → Security**.
5. Filter for Event ID `4625`.

## Step 8.4 — Investigate Event ID 4625

The captured event showed:

- Event ID: `4625`
- Account Name: `sahmed`
- Account Domain: `ADLAB`
- Failure Reason: `Unknown user name or bad password`
- Computer: `CLIENT01.adlab.local`
- Audit result: Failure

**Observed result:** The failed authentication was visible and attributable to the intended lab account.

**Evidence — Event Viewer failed-logon investigation — Event ID 4625**

![Event Viewer failed-logon investigation — Event ID 4625](evidence/03-Event4625-Failed-Logon-sahmed.png)

