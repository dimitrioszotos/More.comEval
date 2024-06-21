resource "azurerm_linux_web_app" "more-eval-client-app" {
  name                = "more-eval-client-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  https_only = "false"
  
  site_config {

    always_on = true

    application_stack {
          python_version = "3.10"
    }
  }

   app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
  }

}

resource "azurerm_linux_web_app" "more-eval-server-app" {
  name                = "more-eval-server-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  https_only = "false"
  
  site_config {

    always_on = true

    application_stack {
          python_version = "3.10"
    }
  }

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
  }

}
