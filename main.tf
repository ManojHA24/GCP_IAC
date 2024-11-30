
resource "google_compute_instance" "instance-20241130-101036" {
  attached_disk {
    device_name = "disk-2"
    mode        = "READ_WRITE"
    source      = "projects/valkyrie-project/zones/us-east1-b/disks/disk-2"
  }

  zone = "us-east1-b"

  boot_disk {
    auto_delete = true
    device_name = "instance-20241130-101036"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2410-oracular-amd64-v20241115"
      size  = 10
      type  = "pd-standard"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "n2-standard-2"

  metadata = {
    startup-script = "test.txt"
  }

  name = "instance-20241130-101036"

  network_interface {
    access_config {
      network_tier = "STANDARD"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/valkyrie-project/regions/us-east1/subnetworks/test-subnet"
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = false
    provisioning_model  = "SPOT"
  }

  service_account {
    email  = "808850579741-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

}
