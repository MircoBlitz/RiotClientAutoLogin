# Auto-login script for Riot Games clients
param(
    [Parameter(Mandatory=$true)]
    [string]$Username,
    
    [Parameter(Mandatory=$true)]
    [string]$Password
)

# Add Windows Forms assembly for SendKeys
Add-Type -AssemblyName System.Windows.Forms

# Wait for client to load
Write-Host "Waiting for login screen..."
Start-Sleep -Seconds 5

# Input username
[System.Windows.Forms.SendKeys]::SendWait($Username)
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Milliseconds 500

# Input password
[System.Windows.Forms.SendKeys]::SendWait($Password)
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

Write-Host "Login credentials sent"
