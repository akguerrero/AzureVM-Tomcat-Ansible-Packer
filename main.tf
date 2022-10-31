# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
    subscription_id = "c9642077-afde-461c-9e7c-81536f8e0e97"
    client_id       = "91badb49-b9f6-41a5-8e88-e9a924aa69dc"
    client_secret   = "xm08Q~jfpyUKnOM71Ucm2S.-TlQHKtMihzGAvdoO"
    tenant_id       = "40e20b2c-2571-4106-a067-9cad17e7ef47"

}

resource "azurerm_resource_group" "rg" {
  name     = "Jenkins-test"
  location = "westus2"

  tags = {
    Environment = "Jenkins Getting Started"
    Team = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}
