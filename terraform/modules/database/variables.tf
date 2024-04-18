variable "name" {
  type        = string
  description = "Release name."
}

variable "namespace" {
  type        = string
  default = "tech-interview"
  description = "Namespace."
}

variable "root_password" {
  type        = string
  default     = null
  description = "Root password"
}

variable "database" {
  type        = string
  description = "Database name."
}

variable "username" {
  type        = string
  description = "Username."
}

variable "password" {
  type        = string
  default     = null
  description = "User password"
}