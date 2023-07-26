# This script connects to the Management Console, gets the Agent passphrase, 
# and then uninstalls the Agent with the passphrase:
# Check script is run as admin
​$user = [Security.Principal.WindowsIdentity]::GetCurrent();
$admin=(New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
​
if ($admin -eq $false) {
    "Please run the script as Administrator"
​    Start-Sleep -s 10
}
​
#  Set API token
$token = "YOUR_TOKEN_GOES_HERE"
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "$token")
​
# Get Management URL
$config = & 'C:\Program Files\SentinelOne\Sentinel*\SentinelCtl.exe' config | select-string -Pattern "server.mgmtServer"
$mgmt = $config -split ' ' | select -last 1
​
# Get Agent passphrase
$uuid = & 'C:\Program Files\SentinelOne\Sentinel*\SentinelCtl.exe' agent_id
$passphrase_url = $mgmt + "/web/api/v2.1/agents/passphrases?uuids="+"$uuid"
$passphrase = (Invoke-RestMethod ("$passphrase_url") -Method 'GET' -Headers $headers).data.passphrase
​
# Get SiteID for logging
$site_url = $mgmt + "/web/api/v2.1/agents?uuids="+"$uuid"
$siteID = (Invoke-RestMethod ("$site_url") -Method 'GET' -Headers $headers).data.siteId
​
# Uninstall Agent
Write-Host "Uninstalling Agent..." 
Write-Host "This may take a while, please do not close the window."
& 'C:\Program Files\SentinelOne\Sentinel*\uninstall.exe' /uninstall /norestart /q /k "$passphrase"