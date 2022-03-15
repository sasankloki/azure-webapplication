provider "azurerm" {
    version = 1.38
    }

resource "azurerm_app_service_plan" "svcplan" {
  name                = "newweb-appserviceplan"
  location            = "eastus"
  resource_group_name = "191-931e5e21-deploy-a-web-application-with-terrafo"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "custom-tf-webapp-for-thestudent"
  location            = "eastus"
  resource_group_name = "191-931e5e21-deploy-a-web-application-with-terrafo"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}