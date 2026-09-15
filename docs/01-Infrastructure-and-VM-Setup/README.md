# 1. Infrastructure and Virtual Machine Setup

## Step 1.1 — Create the Windows Server VM

1. In VirtualBox, create a Windows Server 2022 VM.
2. Install **Windows Server 2022 Standard Evaluation (Desktop Experience)**.
3. Complete the first boot and administrator setup.
4. Rename the server to `DC01` using **Server Manager → Local Server → Computer name**.
5. Restart when prompted.

**Observed result:** The server came online as `DC01` and was ready to be configured as the domain controller.

**Evidence — DC01 renamed and visible in Server Manager**

![DC01 renamed and visible in Server Manager](evidence/01-DC01-Renamed-Local-Server.png)


## Step 1.2 — Configure two network adapters on DC01

In VirtualBox, configure:

- **Adapter 1:** NAT — internet access.
- **Adapter 2:** Internal Network — name `ADLAB` — isolated domain traffic.

On Windows Server:

- NAT NIC (`Ethernet-Internet`) used the VirtualBox NAT network and had `10.0.2.15` during the lab.
- Internal NIC (`Ethernet-ADLAB`) was configured as `192.168.10.10/24`.
- DNS on the internal interface pointed to `192.168.10.10` after DNS/AD DS was available.

**Important final state:** DNS registration was disabled on the NAT-facing interface and enabled on `Ethernet-ADLAB` so the NAT IP would not pollute AD DNS.

**Evidence — DC01 NAT adapter configuration**

![DC01 NAT adapter configuration](evidence/02-DC01-Adapter1-NAT.png)


**Evidence — DC01 ADLAB internal adapter configuration**

![DC01 ADLAB internal adapter configuration](evidence/03-DC01-Adapter2-ADLAB.png)


## Step 1.3 — Create the Windows 11 client VM

1. Create `CLIENT01` as a Windows 11 Pro VM.
2. Configure two NICs:
   - Adapter 1: NAT
   - Adapter 2: Internal Network `ADLAB`
3. The ADLAB adapter later received a DHCP lease from DC01.

**Observed result:** CLIENT01 could keep internet access through NAT while also participating in the isolated ADLAB domain network.

**Evidence — CLIENT01 dual-NIC configuration**

![CLIENT01 dual-NIC configuration](evidence/05-CLIENT01-Dual-NIC.png)


## Step 1.4 — Confirm server roles after build

By the completed state, DC01 hosted the required Windows Server roles for the lab, including AD DS, DNS and DHCP.

**Evidence — DC01 Server Manager roles**

![DC01 Server Manager roles](evidence/04-DC01-Server-Manager-Roles.png)

