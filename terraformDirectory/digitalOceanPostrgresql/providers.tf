terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    postgresql = {
      source  = "doctolib/postgresql"
      version = "2.25.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Using the postgresql provider to use this providers functions to do further Postgresql actions
provider "postgresql" {
  host            = digitalocean_database_cluster.ucrconnect.host
  port            = digitalocean_database_cluster.ucrconnect.port
  username        = digitalocean_database_cluster.ucrconnect.user
  password        = digitalocean_database_cluster.ucrconnect.password
  sslmode         = var.postgresql_sslmode
  connect_timeout = var.postgresql_connect_timeout
  superuser       = false
  database        = var.postgresql_default_database_name
}
