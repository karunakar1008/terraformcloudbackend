terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
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

resource "azurerm_resource_group" "rgdemo" {
  name     = var.rg_name
  location = var.location
  tags = {
    "environment" = "dev",
    "createdby"   = var.created_by,
    "location"    = var.location
  }

}

module "storage-account" {
  source  = "Umanis/storage-account/azurerm"
  version = "2.0.0"
  # insert the 4 required variables here
}
