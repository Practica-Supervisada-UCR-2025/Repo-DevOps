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

Assign the backendUser role the capabilities to create, modify, delete and insert/remove data from tables