terraform {
    # required_version = "~>0.13.0"
    required_version = "~>1.2"
    # backend “gcs” {}
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>3.64.0"
        }
    }   
}




module "vpc" {
  source = "./vpc" 
  project_id = var.project_id
  env                   = var.env
  company               = var.company
  net1_region1_subnet = var.net1_region1_subnet
  net1_region2_subnet = var.net1_region2_subnet
  region = var.region
  lb_subnet_1 = var.lb_subnet_1

}

module "gce" {
  source                = "./gce"
  env                   = var.env
  company               = var.company
  sa1 = var.sa1
  project_id = var.project_id
  region = var.region
  machine_type = var.machine_type
  zone = var.zone
  image = var.image 
  scopes_web = var.scopes_web
  public_key = var.public_key
  network = module.vpc.vpc_self_link
  subnet1 = module.vpc.subnet1_self_link
  subnet2 = module.vpc.subnet2_self_link


}
# module "ue1" {
#   source                = "../modules/ue1"
#   network_self_link     = "${module.vpc.out_vpc_self_link}"
#   subnetwork1           = "${module.ue1.ue1_out_public_subnet_name}"
#   env                   = "${var.var_env}"
#   company               = "${var.var_company}"
#   var_ue1_public_subnet = "${var.ue1_public_subnet}"
#   var_ue1_private_subnet= "${var.ue1_private_subnet}"
# }














