# Troubleshooting Log — Problems Encountered and Resolutions

## 1. Stale DC01 NAT IP in DNS

**Symptom:** `dc01.adlab.local` could resolve to the VirtualBox NAT IP `10.0.2.15` instead of the intended ADLAB address.

**Cause:** DNS registration on the wrong network interface.

**Resolution:** Keep NAT-interface DNS registration disabled, enable registration on the ADLAB interface, remove the stale A record, flush the client DNS cache and verify `192.168.10.10` resolution.

---

## 2. Sales account lockout

**Symptom:** `sahmed` could not sign in after repeated bad passwords.

**Diagnosis:** `LockedOut=True`, `BadPwdCount=5`.

**Resolution:** `Unlock-ADAccount -Identity sahmed`, then confirm `LockedOut=False` and successful login.

---

## 3. Department access denied

**Symptom:** Sales user received access denied for HR/IT paths.

**Interpretation:** This was the *expected* RBAC outcome, not a fault, because Sales should only access the Sales share.

**Validation:** `S:` and `\\DC01\Sales` worked; `\\DC01\HR` and `\\DC01\IT` returned Access is denied.

---

## 4. Security log access denied as a standard user

**Symptom:** Sarah's standard user account could not read the Security log.

**Resolution:** Open Event Viewer with administrative privileges and investigate Event ID 4625 there.

---

## 5. Copy/paste problems between host and CLIENT01

**Symptom:** Clipboard sharing in VirtualBox did not work reliably.

**Resolution:** Confirm **Shared Clipboard = Bidirectional**, insert the Guest Additions CD image and install **Oracle VirtualBox Guest Additions 7.1.8** on CLIENT01.

---

## 6. `nslookup` showed Server: UnKnown

**Symptom:** Forward lookup worked, but `nslookup` displayed the DNS server name as `UnKnown`.

**Cause:** No reverse PTR record for the DNS server.

**Decision:** Not a blocker for this lab; forward DNS, domain discovery and secure-channel checks were healthy.
