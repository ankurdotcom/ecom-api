variable "instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "database_name" {
  description = "Name of the database"
  type        = string
}

variable "user" {
  description = "Database username"
  type        = string
}

variable "password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Region for the Cloud SQL instance"
  type        = string
  default     = "us-central1"
}
