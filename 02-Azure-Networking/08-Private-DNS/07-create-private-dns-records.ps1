
# ---------------------------------------------------------------------------------------------------

$resourceGroup = "RG-Labs-AZ104"
$dnsZoneName = "myprivatedns.lab"
$recordName = "webserver"
$ipAddress = "10.1.1.4"

# Crear un objeto de tipo PrivateDnsARecord
$aRecord = New-AzPrivateDnsRecordConfig -Ipv4Address $ipAddress

# Crear el registro con el objeto
New-AzPrivateDnsRecordSet -ResourceGroupName $resourceGroup `
  -ZoneName $dnsZoneName `
  -Name $recordName `
  -RecordType A `
  -Ttl 3600 `
  -PrivateDnsRecords $aRecord


# ---------------------------------------------------------------------------------------------------

$recordName = "dbserver"
$ipAddress = "10.1.2.4"

# Crear un objeto de tipo PrivateDnsARecord
$aRecord = New-AzPrivateDnsRecordConfig -Ipv4Address $ipAddress

# Crear el registro con el objeto
New-AzPrivateDnsRecordSet -ResourceGroupName $resourceGroup `
  -ZoneName $dnsZoneName `
  -Name $recordName `
  -RecordType A `
  -Ttl 3600 `
  -PrivateDnsRecords $aRecord


# --------------------------------------------------Test--------------------------------------------------


Get-AzPrivateDnsRecordSet -ResourceGroupName $resourceGroup -ZoneName $dnsZoneName -RecordType A

# RUN COMMAND

# nslookup webserver.myprivatedns.lab = "webserver"
# nslookup dbserver.myprivatedns.lab = "webserver"
