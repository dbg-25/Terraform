# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "remote" {
    resource_group_name  = "terraformPipelineObjects"
    storage_account_name = "terraformstorage36745495"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


#resource group creation
resource "azurerm_resource_group" "Up-andAway" {
    name = "Up-andAway"
    location = "Canada Central"
    tags = "ToBeDeleted"
}

resource "azurerm_virtual_network" "MyVnet" {
    name = "MyVnet"
    resource_group_name = azurerm_resource_group.Up-andAway.name
    location = azurerm_resource_group.Up-andAway.location
    address_space = [ "10.10.10.0/24" ]
}

