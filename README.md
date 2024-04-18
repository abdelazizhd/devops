# Technical Interview Exercise

The example project is structured in 3 directories
* charts
* sources
* terraform

## Sources

Source files of an example API in a small development environment using docker compose. It has two services:
* **app:** API implementation.
* **db:** Mysql server used by the API.

## Charts

Helm charts to deploy the necessary resources in the AKS cluster.

## Terraform

Terraform code to provision an AKS cluster with the desired infrastructure.

---

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | = 2.12.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.99.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | Azure/aks/azurerm | 8.0.0 |
| <a name="module_api"></a> [api](#module\_api) | ./modules/api | n/a |
| <a name="module_database"></a> [database](#module\_database) | ./modules/database | n/a |
| <a name="module_network"></a> [network](#module\_network) | Azure/network/azurerm | 5.3.0 |
| <a name="module_nic"></a> [nic](#module\_nic) | ./modules/nginx-ingress-controller | n/a |

### Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_namespace"></a> [aks\_namespace](#input\_aks\_namespace) | Environment. | `string` | `"tech-interview"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name. | `string` | `"tech-interview.local"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. | `string` | `"dev"` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Image repository. | `string` | `"myacrregistry.azurecr.io/myimage/tech-interview"` | no |
| <a name="input_mysql_database"></a> [mysql\_database](#input\_mysql\_database) | Database name. | `string` | n/a | yes |
| <a name="input_mysql_username"></a> [mysql\_username](#input\_mysql\_username) | Username. | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | `"westeurope"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | `"westeurope"` | no |

### Outputs

No outputs.

---

## Database module

### Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [helm_release.mysql](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database"></a> [database](#input\_database) | Database name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Release name. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace. | `string` | `"tech-interview"` | no |
| <a name="input_password"></a> [password](#input\_password) | User password | `string` | `null` | no |
| <a name="input_root_password"></a> [root\_password](#input\_root\_password) | Root password | `string` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | Username. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_password"></a> [password](#output\_password) | n/a |
| <a name="output_root_password"></a> [root\_password](#output\_root\_password) | n/a |

--- 

## Nginx Ingress Controller module

### Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [helm_release.nginx-ingress-controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Release name. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace. | `string` | `"tech-interview"` | no |

### Outputs

No outputs.

---

## API module

## Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [helm_release.api](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_host"></a> [database\_host](#input\_database\_host) | Database host. | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Database name. | `string` | n/a | yes |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | Database password. | `string` | n/a | yes |
| <a name="input_database_user"></a> [database\_user](#input\_database\_user) | Database user. | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name. | `string` | n/a | yes |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Image repository. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Release name. | `string` | `"api"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace. | `string` | `"tech-interview"` | no |

### Outputs

No outputs.





