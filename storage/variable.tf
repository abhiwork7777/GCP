variable "project_id" {
  description = "The ID of the project in which to create the bucket"
  type        = string
}

variable "region" {
  description = "The region where the bucket should be created"
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "STANDARD"
}

variable "location" {
  description = "The location where the bucket is created"
  type        = string
  default     = "US"
}
