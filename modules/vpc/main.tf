resource "google_compute_network" "vpc_network" {
  name = var.vpc_name

}

resource "google_compute_subnetwork" "subnet" {
  name          = var.snet_name
  ip_cidr_range = var.snet_cidr
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
