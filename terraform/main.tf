terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}

provider "azurerm" {
    features {}
}


module "ResourceGroups" {
  source = "./Resource Groups"
  resource_group_name = module.ResourceGroups.RG_name
  location = module.ResourceGroups.RG_location
}


module "ServicePlans" {
  source = "./Service Plans"
  resource_group_name = module.ResourceGroups.RG_name
  location = module.ResourceGroups.RG_location

}

module "WebApps" {
  source = "./WebApps"
  resource_group_name = module.ResourceGroups.RG_name
  location = module.ResourceGroups.RG_location
  service_plan_id = module.ServicePlans.SP_id
  
}
