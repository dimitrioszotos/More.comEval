resource "azurerm_service_plan" "More_ServicePlan" {
  name                = "More_ServicePlan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

