resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  resource_group_name = azurerm_resource_group.rg.name
  use_for_each = true
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "8.0.0"

  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku_tier = "Standard"
  enable_auto_scaling = true
  vnet_subnet_id = module.network.vnet_id
}

module "database" {
  source = "./modules/database"

  name = var.environment
  namespace = var.aks_namespace
  database = var.mysql_database
  username = var.mysql_username
}

module "nic" {
  source = "./modules/nginx-ingress-controller"

  name = var.environment
  namespace = var.aks_namespace
}

module "api" {
  source = "./modules/api"

  image_repository = var.image_repository
  database_host = module.database.host
  database_name = var.mysql_database
  database_user = var.mysql_username
  database_password = module.database.password
  namespace = var.aks_namespace
  domain
}

