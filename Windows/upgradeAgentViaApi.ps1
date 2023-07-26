$accessToken="YOUR_API_TOKEN"
$headers=@{"Authorization"="ApiToken $accessToken"}

$functionUrl='https://your-console.sentinelone.net/web/api/v2.1/agents/actions/update-software'

$functionParameters='{
    "data": {
        "isScheduled": false,
        "fileName": "SentinelOneInstaller_windows_64bit_v22_1_5_11025.exe",
         "osType": "windows",
        "packageType": "AgentAndRanger"
    },
    "filter": {
        "computerName": "lab001"
    }
}'

Invoke-WebRequest -Headers $headers -Method Post -Uri $functionUrl -Body $functionParameters -ContentType 'application/json'