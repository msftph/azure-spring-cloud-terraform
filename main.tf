# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.28.0"  
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "default"{
    name        = var.resource_group
    location    = var.location
}

# Create Spring Cloud Service
resource "azurerm_spring_cloud_service" "default" {
  name                = "example-springcloud"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku_name            = "B0"

  config_server_git_setting {
    uri          = "git@github.com:msftph/azure-spring-cloud-terraform.git"
    label        = "master"
    search_paths = ["config"]

    ssh_auth{
        private_key = file(var.private_key_path)
    }
  }
}