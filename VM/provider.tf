terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}


# terraform {
#   backend "azurerm" {
#     resource_group_name  = ""                # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
#     storage_account_name = "devopsinsiders1storage" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
#     container_name       = "tfstate"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
#     key                  = "virtualmachin.tfstate"  # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
#   }



provider "azurerm" {
  features {}
}