resource "google_redis_instance" "default" {
  name           = var.instance_name
  memory_size_gb = var.memory_size_gb
  tier           = var.tier
  region         = var.region
}

output "redis_instance_name" {
  value = google_redis_instance.default.name
}

output "redis_host" {
  value = google_redis_instance.default.host
}

output "redis_port" {
  value = google_redis_instance.default.port
}
