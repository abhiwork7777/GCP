terraform {
  backend "gcs" {
    bucket = "idp-cluster-tf-file"
    prefix = "terraformcloudsql.tfstate"
  }
}