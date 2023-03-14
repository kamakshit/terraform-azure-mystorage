resource "azurerm_storage_account" "sa1" {
  name                     = jayastorage
  resource_group_name      = "TerraformRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_container" "cont1" {
  name                  = jayaconatiner
  storage_account_name  = azurerm_storage_account.sa1.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob1" {
  name                   = jayastorageblob
  storage_account_name   = azurerm_storage_account.sa1.name
  storage_container_name = azurerm_storage_container.cont1.name
  type                   = "Block"
  source                 = "C:/TerraformAzureWS/Demo1StorageAccount/Demo.zip"
}