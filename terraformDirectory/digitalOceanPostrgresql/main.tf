resource "digitalocean_database_cluster" "ucrconnect" {
  name       = "ucrconnect-postgresql"
  engine     = "pg"
  version    = var.postgresql_version
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}

resource "postgresql_database" "backendDB" {
  name             = var.backend_db_name
  owner            = digitalocean_database_cluster.ucrconnect.user
  template         = "template0"
  lc_collate       = "C"
  connection_limit = -1
  allow_connections = true
  tablespace_name  = "DEFAULT"
}

resource "postgresql_role" "backendUser" {
  name             = var.backend_user_name
  login            = true
  connection_limit = 6
  password         = var.backend_user_password
  encrypted_password = true
}

# //===========================  Development database and user setup

resource "postgresql_database" "backendDB_development" {
  name             = var.backend_db_name_development
  owner            = digitalocean_database_cluster.ucrconnect.user
  template         = "template0"
  lc_collate       = "C"
  connection_limit = -1
  allow_connections = true
  tablespace_name  = "DEFAULT"
}

resource "postgresql_role" "backend_user_development" {
  name             = var.backend_user_name_development
  login            = true
  connection_limit = 6
  password         = var.backend_user_password_development
  encrypted_password = true
}

# Grant all the roles that are necessary for developers of the backend application to use the entire database
# Grant full access on public schema and all tables in it
resource "postgresql_grant" "backend_user_schema_access" {
  database    = postgresql_database.backendDB_development.name
  role        = postgresql_role.backend_user_development.name
  schema      = "public"
  object_type = "schema"
  privileges  = ["USAGE", "CREATE"]
}

resource "postgresql_grant" "backend_user_table_access" {
  database    = postgresql_database.backendDB_development.name
  role        = postgresql_role.backend_user_development.name
  schema      = "public"
  object_type = "table"
  privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
}