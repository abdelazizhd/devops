terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "= 2.12.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "helm" {
  # debug   = true
  kubernetes {
    host = module.aks.host

    client_key             = base64decode(module.aks.client_key)
    client_certificate     = base64decode(module.aks.client_certificate)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}
