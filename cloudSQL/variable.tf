variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
}

variable "db_name" {
  description = "The name of the initial database to create"
  type        = string
  default     = "my-database"
}

variable "db_user" {
  description = "The name of the DB user"
  type        = string
}

variable "db_password" {
  description = "The password for the DB user"
  type        = string
  sensitive   = true
}
