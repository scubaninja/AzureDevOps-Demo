targetScope = 'subscription'

param location string = 'westeurope'
param rgName string = 'RG-Example'
param webAppName string = 'mywebapp'
param appServicePlanTier string = 'Standard'
param appServicePlanSku string = 'S1'
param dockerRegistryHost string = 'yourregistry.azurecr.io'
param dockerRegistryServerUsername string = 'yourregistry'
param dockerRegistryServerPassword string = 'somepassword'
param dockerImage string = 'imagename'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: location
}

module WebApp './webapp.bicep' = {
  name: webAppName
  scope: resourceGroup(rg.name)
  params: {
    location: location
    webAppName: webAppName
    appServicePlanTier: appServicePlanTier
    appServicePlanSku: appServicePlanSku
    dockerRegistryHost: dockerRegistryHost
    dockerRegistryServerUsername: dockerRegistryServerUsername
    dockerRegistryServerPassword: dockerRegistryServerPassword
    dockerImage: dockerImage
  }
}

