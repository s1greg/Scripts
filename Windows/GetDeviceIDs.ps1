Get-PnpDevice -Class 'USB' | ForEach-Object {$_.FriendlyName, $_.InstanceID}
Get-PnpDevice -Class 'Bluetooth' | ForEach-Object {$_.FriendlyName, $_.InstanceID}