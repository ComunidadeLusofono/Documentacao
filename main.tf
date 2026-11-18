resource "azurerm_resource_group" "moderndatastackazure" {
  name     = "rg-moderndatastackazure"
  location = "Poland Central"
}

resource "azurerm_storage_account" "moderndatastackazure" {
  name                     = "moderndatastackazure"
  resource_group_name      = azurerm_resource_group.moderndatastackazure.name
  location                 = azurerm_resource_group.moderndatastackazure.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "moderndatastackazure" {
  name                  = "example-container"
  storage_account_id    = azurerm_storage_account.moderndatastackazure.id
  container_access_type = "private"
}
