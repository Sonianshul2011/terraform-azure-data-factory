variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Location for the Azure resources"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Azure Network Security Group"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the Azure Virtual Network"
  type        = list(string)
}

variable "dns_servers" {
  description = "DNS servers for the Azure Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Azure Subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the Azure Subnet"
  type        = list(string)
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the Azure SQL Server"
  type        = string
}

variable "sql_server_admin_login" {
  description = "Administrator login for the Azure SQL Server"
  type        = string
}

variable "sql_server_admin_password" {
  description = "Administrator password for the Azure SQL Server"
  type        = string
}

variable "sql_db_name" {
  description = "Name of the Azure SQL Database"
  type        = string
}

variable "data_factory_name" {
  description = "Name of the Azure Data Factory"
  type        = string
}

variable "tags" {
  description = "Tags for Azure resources"
  type        = map(string)
}
