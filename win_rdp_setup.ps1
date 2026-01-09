# ==============================
# Enable RDP and Grant Access
# ==============================

param (
    [Parameter(Mandatory = $true)]
    [string]$Username
)

Write-Host "[*] Adding user to Remote Desktop Users group..."
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $Username -ErrorAction SilentlyContinue

Write-Host "[*] Adding user to Remote Management Users group..."
Add-LocalGroupMember -Group "Remote Management Users" -Member $Username -ErrorAction SilentlyContinue

# ------------------------------
# Enable RDP via Registry
# ------------------------------
Write-Host "[*] Enabling RDP in registry..."
Set-ItemProperty `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" `
    -Name "fDenyTSConnections" `
    -Value 0

# ------------------------------
# Start RDP Service
# ------------------------------
Write-Host "[*] Starting Remote Desktop Services (TermService)..."
Start-Service -Name TermService -ErrorAction SilentlyContinue

# ------------------------------
# Enable Firewall Rules
# ------------------------------
Write-Host "[*] Enabling Windows Firewall rules for Remote Desktop..."
Enable-NetFirewallRule -DisplayGroup "Remote Desktop" -ErrorAction SilentlyContinue

# ------------------------------
# Verify Port 3389
# ------------------------------
Write-Host "[*] Checking if RDP is listening on port 3389..."
Get-NetTCPConnection -LocalPort 3389 -State Listen | Select-Object LocalAddress, LocalPort, State

Write-Host "[+] RDP setup complete."
