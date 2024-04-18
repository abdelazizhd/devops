variable "resource_group_name" {
  type        = string
  default     = "westeurope"
  description = "Name of the resource group."
}

variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "mysql_database" {
  type        = string
  description = "Database name."
}

variable "mysql_username" {
  type        = string
  description = "Username."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment."
}

variable "aks_namespace" {
  type        = string
  default     = "tech-interview"
  description = "Environment."
}

variable "image_repository" {
  type        = string
  default     = "myacrregistry.azurecr.io/myimage/tech-interview"
  description = "Image repository."
}

variable "domain" {
  type        = string
  default     = "tech-interview.local"
  description = "Domain name."
}

