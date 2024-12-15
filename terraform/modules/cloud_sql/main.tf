resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "default" {
  name     = var.user
  password = var.password
  instance = google_sql_database_instance.default.name
}

resource "google_sql_database" "default" {
  name     = var.database_name
  instance = google_sql_database_instance.default.name
}

output "cloud_sql_instance_name" {
  value = google_sql_database_instance.default.name
}

output "cloud_sql_connection_name" {
  value = google_sql_database_instance.default.connection_name
}
