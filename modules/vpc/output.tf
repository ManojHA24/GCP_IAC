output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "snet_id" {
  value = google_compute_subnetwork.subnet.id
}