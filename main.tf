#creates a resource group for the services below
resource "azurerm_resource_group" "demo-resource-group" {
  name     = var.resource_group_name
  location = var.resource_group_geolocation
}

#creates a storage account for your containers
resource "azurerm_storage_account" "demo-storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.demo-resource-group.name
  location                 = azurerm_resource_group.demo-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#creates a container to store your content
resource "azurerm_storage_container" "demo-storage-container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.demo-storage-account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "index-file" {
  name                   = "index.yaml"
  storage_account_name   = azurerm_storage_account.demo-storage-account.name
  storage_container_name = azurerm_storage_container.demo-storage-container.name
  type                   = "Block"
  source                 = "index.yaml" #path to file
}


resource "azurerm_storage_blob" "mysql-file" {
  name                   = "mysql-10.1.1.tgz"
  storage_account_name   = azurerm_storage_account.demo-storage-account.name
  storage_container_name = azurerm_storage_container.demo-storage-container.name
  type                   = "Block"
  source                 = "mysql-10.1.1.tgz" #path to file
}

resource "azurerm_storage_blob" "nginx-file" {
  name                   = "nginx-16.0.3.tgz"
  storage_account_name   = azurerm_storage_account.demo-storage-account.name
  storage_container_name = azurerm_storage_container.demo-storage-container.name
  type                   = "Block"
  source                 = "nginx-16.0.3.tgz" #path to file
}


resource "azurerm_storage_blob" "redis-file" {
  name                   = "redis-19.1.0.tgz"
  storage_account_name   = azurerm_storage_account.demo-storage-account.name
  storage_container_name = azurerm_storage_container.demo-storage-container.name
  type                   = "Block"
  source                 = "redis-19.1.0.tgz" #path to file
}