resource mysa 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: saname
  location: myLocation
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}


@allowed(
  [
    'WestEurope'
    'NorthEurope'
  ]
)
param myLocation string = 'WestEurope'

var saname = 'sa${uniqueString(resourceGroup().id)}'

output mysaname string = mysa.properties.primaryEndpoints.blob
