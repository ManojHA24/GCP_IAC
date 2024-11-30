module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "valkyrie-vpc"
  snet_name = "valkyrie-worker-snet-01"
  snet_cidr = "10.0.0.0/24"
}