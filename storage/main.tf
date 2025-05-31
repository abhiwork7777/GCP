provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_name}-${random_string.bucket_suffix.result}"  # Use random string for uniqueness
  location      = var.location
  storage_class = var.storage_class
  project       = var.project_id

  versioning {
    enabled = true
  }

  lifecycle {
    # Allow deletion temporarily by commenting out prevent_destroy
    prevent_destroy = false
  }

  # Enable force_destroy to allow the deletion of the bucket even if it contains objects
  force_destroy = true

  labels = {
    environment = "dev"
    team        = "devops"
  }
}

resource "google_storage_bucket_object" "sample_object" {
  name    = "sample-object.txt"
  bucket  = google_storage_bucket.bucket.name
  content = "This is a test object for the bucket."
}
