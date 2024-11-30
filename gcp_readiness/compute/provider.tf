terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.5.0"

  # backend "gcs" {
  #   bucket  = "my-terraform-state-bucket"
  #   prefix  = "terraform/state"
  #   project = "my-gcp-project"
  # }
}

provider "google" {
  credentials = "/home/manojha/Desktop/GCP_IAC/valkyrie-project-ef3c60c604de.json"
  project     = "valkyrie-project"
  region      = "asia-south1"
}   