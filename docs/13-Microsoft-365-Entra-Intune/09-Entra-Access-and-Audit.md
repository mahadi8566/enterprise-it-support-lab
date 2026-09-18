# 09 — Entra Group Access Lifecycle and Audit Logs

## Objective
Simulate a temporary access request, audit the administrative change, then revoke the access and restore least privilege.

## Initial state
Sarah Ahmed is the Sales user.

![Original SG_Sales_Users membership](assets/09-01-SG-Sales-Original-Member.png)

*Evidence: Original SG_Sales_Users membership.*


## Step 1 — Grant temporary access
Add Michael Brown to `SG_Sales_Users`.

![Temporary Sales group access added](assets/09-02-Temporary-Sales-Access-Added.png)

*Evidence: Temporary Sales group access added.*


## Step 2 — Verify Add member audit event
Go to the group's **Audit logs**.


![Add member to group audit activity](assets/09-03-Audit-Add-Member-Activity.png)

*Evidence: Add member to group audit activity.*


![Administrator actor for the access change](assets/09-04-Audit-Add-Member-Actor.png)

*Evidence: Administrator actor for the access change.*


> **Publishing warning:** crop or blur public IP addresses shown in audit details.

## Step 3 — Remove temporary access
Remove Michael Brown from `SG_Sales_Users`, leaving Sarah as the intended Sales member.

![Temporary access removed and least privilege restored](assets/09-05-Least-Privilege-Restored.png)

*Evidence: Temporary access removed and least privilege restored.*


## Step 4 — Verify Remove member audit event

![Remove member from group audit activity](assets/09-06-Audit-Remove-Member-Activity.png)

*Evidence: Remove member from group audit activity.*


![Audit target for removed membership](assets/09-07-Audit-Remove-Member-Target.png)

*Evidence: Audit target for removed membership.*


## Result
The complete access lifecycle was documented: request → grant → audit → revoke → audit → least-privilege restored.
