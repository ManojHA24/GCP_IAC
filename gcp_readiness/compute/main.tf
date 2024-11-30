module "persistant_disk" {
  source = "../../modules/persistant_disk"

  disk_name = "nix-disk"
  disk_size_gb = 200
  disk_type = "hyperdisk-balanced"
  project_name = "Valkyrie-project"
  zone_name = "asia-south1-c"
  disk_iops = 3500
  disk_throughput = 300
}

module "spot_vm_template" {
  source = "../../modules/spot_vm_template"

	template_name = "valkyrie_worker_template"
	vpc_name = ""#module.vpc.id
	snet_name = ""#module.vpc.snet_id
	machine_type = "n2-custom-2-2048"
	os = "projects/ubuntu-os-cloud/global/images/ubuntu-2410-oracular-amd64-v20241115"
	os_disk_size = 10
	data_disk_name = ""
}

module "spot_mig" {
  source = "../../modules/spot_MIG"

  mig_name = "valkyrie_worker"
  mig_target_size = 1
  vm_template_id = module.spot_vm_template.spot_vm_template_id
  data_disk_name = module.persistant_disk.disk_name
  zone_name = "asia-south1-c"
}