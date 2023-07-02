terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "karunakar1008organization"
    workspaces {
      name = "ws_dev_terraformcloudbackend"
    }
  }
}

# Authenticate using azure CLI
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-nextops-vedios-demo2"
  location = "East Us"
}