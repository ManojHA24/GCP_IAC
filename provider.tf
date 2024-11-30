terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.5.0"

  backend "gcs" {
    #bucket  = "my-terraform-state-bucket"
    #prefix  = "terraform/state"
   # project = "my-gcp-project"
  }
}

provider "google" {
  project     = "my-project-id"
  region      = "us-central1"
}   