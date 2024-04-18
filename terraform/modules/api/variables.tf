variable "name" {
  type        = string
  default     = "api"
  description = "Release name."
}

variable "image_repository" {
  type        = string
  description = "Image repository."
}

variable "database_host" {
  type        = string
  description = "Database host."
}

variable "database_name" {
  type        = string
  description = "Database name."
}

variable "database_user" {
  type        = string
  description = "Database user."
}

variable "database_password" {
  type        = string
  description = "Database password."
}

variable "namespace" {
  type        = string
  default = "tech-interview"
  description = "Namespace."
}