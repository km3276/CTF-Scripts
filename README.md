# CTF Scripts

Small utility scripts for CTFs and lab environments.
For educational and authorized testing only.

---

## Files

### win_rdp_setup.bat

Enables RDP and grants a specified user remote access.

**Actions**
- Adds user to:
  - `Remote Desktop Users`
  - `Remote Management Users`
- Starts `TermService`
- Enables RDP in registry: HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnections = 0
- Enables Windows Firewall RDP rules
- Verifies port `3389`

**Configure**
```bat
set USERNAME=dave
```

### shared_lib_privesc.sh

Compiles a malicious shared library that automatically creates a SUID root shell when loaded by a privileged process.
- Copies /bin/sh to /tmp/sh
- Sets SUID bit
- Root shell:
```bat 
/tmp/sh -p
```

### suid_root_shell.c

Small SUID root shell launcher

