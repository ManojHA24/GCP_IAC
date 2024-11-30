resource "google_compute_disk" "persistant_disk" {
  name       = var.disk_name
  size       = var.disk_size_gb
  type       = "projects/${lower(var.project_name)}/zones/${var.zone_name}/diskTypes/${var.disk_type}"
  zone       = var.zone_name
  physical_block_size_bytes = 4096
  provisioned_iops           = var.disk_iops
  provisioned_throughput     = var.disk_throughput
  access_mode = "READ_WRITE_MANY"
}
