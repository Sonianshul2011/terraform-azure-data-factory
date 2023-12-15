resource_group_name       = "az-tf-demo20"
location                  = "East Us"
nsg_name                  = "az-tf-nsg-demo20"
virtual_network_name      = "az-tf-vn-demo20"
address_space             = ["10.0.0.0/16"]
dns_servers               = ["10.0.0.4", "10.0.0.5"]
subnet_name               = "az-tf-sn-demo20"
subnet_address_prefixes   = ["10.0.2.0/24"]
storage_account_name      = "aztfsademo20"
sql_server_name           = "az-tf-sql-server-demo20"
sql_server_admin_login    = "mysqladmin"
sql_server_admin_password = "Admin@123"
sql_db_name               = "az-tf-sql-db-demo20"
data_factory_name         = "az-tf-df-demo20"
tags = {
  environment = "production"
  project     = "az_tf_df"
  owner       = "anshul_soni"
}

