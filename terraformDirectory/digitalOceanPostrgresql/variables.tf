# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
  type        = string
  description = "Digital Ocean token for authentication"
  sensitive   = true
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
  sensitive   = true # Mark as sensitive to prevent output in logs
}

variable "postgresql_host" {
  type        = string
  description = "The hostname of the PostgreSQL flexible server"
  default     = "example-psqlflexibleserver-kelim2.postgres.database.azure.com"
}

variable "postgresql_port" {
  type        = number
  description = "The port for PostgreSQL connections"
  default     = 5432
}

variable "postgresql_admin_username" {
  type        = string
  description = "The administrator username for PostgreSQL"
  default     = "psqladmin"
}

variable "postgresql_admin_password" {
  type        = string
  description = "The administrator password for PostgreSQL"
  sensitive   = true # Mark as sensitive to prevent output in logs
}

variable "postgresql_sslmode" {
  type        = string
  description = "The SSL mode for PostgreSQL connections"
  default     = "require"
}

variable "postgresql_connect_timeout" {
  type        = number
  description = "The connection timeout for PostgreSQL in seconds"
  default     = 15
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group"
  default     = "example-resources"
}

variable "resource_group_location" {
  type        = string
  description = "The location for the Azure Resource Group"
  default     = "Central US"
}

variable "postgresql_server_name" {
  type        = string
  description = "The name of the Azure PostgreSQL Flexible Server"
  default     = "example-psqlflexibleserver-kelim2"
}

variable "postgresql_version" {
  type        = string
  description = "The PostgreSQL server version"
  default     = "15"
}

variable "postgresql_storage_mb" {
  type        = number
  description = "The storage size in MB for the PostgreSQL server"
  default     = 32768
}

variable "postgresql_storage_tier" {
  type        = string
  description = "The storage tier for the PostgreSQL server"
  default     = "P4"
}

variable "postgresql_sku_name" {
  type        = string
  description = "The SKU name for the PostgreSQL server"
  default     = "B_Standard_B1ms"
}

variable "postgresql_firewall_rule_name" {
  type        = string
  description = "The name of the PostgreSQL firewall rule"
  default     = "example-fw"
}

variable "postgresql_default_database_name" {
  type        = string
  description = "The name of the initial PostgreSQL database"
  default     = "defaultdb"
}

variable "backend_db_name" {
  type        = string
  description = "The name of the backend PostgreSQL database"
  default     = "backendDB"
}

variable "backend_user_name" {
  type        = string
  description = "The username for the backend PostgreSQL user"
  default     = "backendUser"
}

variable "backend_user_password" {
  type        = string
  description = "The password for the backend PostgreSQL user"
  sensitive   = true # Mark as sensitive
  # You should ideally not set a default for sensitive values
}
