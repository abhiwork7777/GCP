provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_sql_database_instance" "my_instance" {
  name             = var.instance_name
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-custom-2-4096"
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.my_instance.name
}

resource "google_sql_user" "user" {
  name     = var.db_user
  instance = google_sql_database_instance.my_instance.name
  password = var.db_password
}
