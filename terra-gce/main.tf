terraform {
    required_version = "~>0.14.0"
    # backend “gcs” {}
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>3.64.0"
        }
    }   
}

provider "google" {
  project = "${var.var_project}"
  region  = "us-central1"
  zone    = "us-central1-c"
#   impersonate_service_account = var.tf_service_account
#   credentials = file("<NAME>.json")
}

module "vpc" {
  source = "../modules/global" 
  env                   = "${var.var_env}"
  company               = "${var.var_company}"
  var_uc1_public_subnet = "${var.uc1_public_subnet}"
  var_uc1_private_subnet= "${var.uc1_private_subnet}"
  var_ue1_public_subnet = "${var.ue1_public_subnet}"
  var_ue1_private_subnet= "${var.ue1_private_subnet}"
}
module "uc1" {
  source                = "../modules/uc1"
  network_self_link     = "${module.vpc.out_vpc_self_link}"
  subnetwork1           = "${module.uc1.uc1_out_public_subnet_name}"
  env                   = "${var.var_env}"
  company               = "${var.var_company}"
  var_uc1_public_subnet = "${var.uc1_public_subnet}"
  var_uc1_private_subnet= "${var.uc1_private_subnet}"
}
module "ue1" {
  source                = "../modules/ue1"
  network_self_link     = "${module.vpc.out_vpc_self_link}"
  subnetwork1           = "${module.ue1.ue1_out_public_subnet_name}"
  env                   = "${var.var_env}"
  company               = "${var.var_company}"
  var_ue1_public_subnet = "${var.ue1_public_subnet}"
  var_ue1_private_subnet= "${var.ue1_private_subnet}"
}
######################################################################
# Display Output Public Instance
######################################################################
output "uc1_public_address"  { value = "${module.uc1.uc1_pub_address}"}
output "uc1_private_address" { value = "${module.uc1.uc1_pri_address}"}
output "ue1_public_address"  { value = "${module.ue1.ue1_pub_address}"}
output "ue1_private_address" { value = "${module.ue1.ue1_pri_address}"}
output "vpc_self_link" { value = "${module.vpc.out_vpc_self_link}"}











# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "flask-vm"
  machine_type = "f1-micro"
  zone         = "us-west1-a"
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
