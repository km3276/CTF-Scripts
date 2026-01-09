@echo off
setlocal

REM ==============================
REM Enable RDP and Grant Access
REM ==============================

set USERNAME=dave

echo [*] Adding user to Remote Desktop Users...
net localgroup "Remote Desktop Users" %USERNAME% /add

echo [*] Adding user to Remote Management Users...
net localgroup "Remote Management Users" %USERNAME% /add

echo [*] Starting Remote Desktop Services...
sc query TermService
net start TermService

echo [*] Enabling RDP in registry...
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" ^
 /v fDenyTSConnections ^
 /t REG_DWORD ^
 /d 0 ^
 /f

echo [*] Enabling Windows Firewall rules for RDP...
netsh advfirewall firewall show rule name="Remote Desktop"
netsh advfirewall firewall set rule group="Remote Desktop" new enable=yes

echo [*] Checking if port 3389 is listening...
netstat -an | findstr :3389

echo [+] Done.
endlocal
