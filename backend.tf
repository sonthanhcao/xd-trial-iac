terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.84.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.4.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 1.1.0" # 0.15
  # Back End Terraform Cloud
  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "fs-mc"

  #   workspaces {
  #     name = "sc-devops"
  #   }
  # }
  # Backend Gitlab HTTP
  backend "http" {
  
  }


}

provider "azurerm" {
  alias = "vhub"

  partner_id = "ca4078f8-9bc4-471b-ab5b-3af6b86a42c8"
  # partner identifier for CAF Terraform landing zones.
  # subscription_id = "c50abfab-96bd-4073-99dc-d4c19c34624a"
  features {
    template_deployment {
      delete_nested_items_during_deletion = true
    }
  }
}
