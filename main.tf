# Create a resource group
resource "azurerm_resource_group" "az-tf-demo" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Create a network security group
resource "azurerm_network_security_group" "az-tf-nsg-demo" {
  name                = var.nsg_name
  location            = azurerm_resource_group.az-tf-demo.location
  resource_group_name = azurerm_resource_group.az-tf-demo.name

  tags = var.tags
}

# Create a virtual network
resource "azurerm_virtual_network" "az-tf-vn-demo" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.az-tf-demo.location
  resource_group_name = azurerm_resource_group.az-tf-demo.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = var.tags
}

# Create a subnet
resource "azurerm_subnet" "az-tf-sn-demo" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.az-tf-demo.name
  virtual_network_name = azurerm_virtual_network.az-tf-vn-demo.name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

# Create a storage account
resource "azurerm_storage_account" "az-tf-sa-demo" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.az-tf-demo.name

  location                 = azurerm_resource_group.az-tf-demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Allow"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.az-tf-sn-demo.id]
  }

  tags = var.tags
}

# Create a SQL server
resource "azurerm_mysql_server" "az-tf-sql-server-demo" {
  name                = var.sql_server_name
  location            = azurerm_resource_group.az-tf-demo.location
  resource_group_name = azurerm_resource_group.az-tf-demo.name

  administrator_login          = var.sql_server_admin_login
  administrator_login_password = var.sql_server_admin_password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  tags = var.tags
}

# Create a SQL Database
resource "azurerm_mysql_database" "az-tf-sql-db-demo" {
  name                = var.sql_db_name
  resource_group_name = azurerm_resource_group.az-tf-demo.name
  server_name         = azurerm_mysql_server.az-tf-sql-server-demo.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

# Create a data factory
resource "azurerm_data_factory" "az-tf-df-demo" {
  name                = var.data_factory_name
  location            = azurerm_resource_group.az-tf-demo.location
  resource_group_name = azurerm_resource_group.az-tf-demo.name

  tags = var.tags
}



