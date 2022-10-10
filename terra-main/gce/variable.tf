variable "env" {
        description = "Environment - just for ref purpose"
        default = "dev"
    }
variable "company" { 
        description = "The ccompany name"
        default = "myown"
    }

variable "project_id" { 
    description = "The GCP project name"
    type        = string
}

variable "region" {
    description = "GCP region name"
    default = "us-central1"
}

variable "region2" {
    description = "GCP region name 2nd"
    default = "us-east4"
}


variable "zone" {
    description = "GCP zone name"
    default = "us-central1-c"
}

variable "zone2" {
    description = "GCP zone name 2nd"
    default = "us-west4-b"
}




variable "public_key" {
    description = "public key for the VM SSH"
    default = "id_rsa_amit"
}


variable "sa1" {
    description = "1 service account for GCE"
    default = "sa-gce-tf"
}




variable "machine_type" {
    description = "Machine type for VM"
    default = "n1-standard-4"
}


variable "image" {
    description = "Image for VM"
    default = "debian-cloud/debian-11"
}


variable "scopes_web" {
    description = "Scopes for VM"
    # default = "sa-gce-tf"
}



variable "net1_region1_subnet" {
        default = "10.26.1.0/24"
    }
variable "net1_region2_subnet" {
        default = "10.26.2.0/24"
    }
variable "net2_region1_subnet" {
        default = "10.26.3.0/24"
    }
variable "net2_region2_subnet" {
        default = "10.26.4.0/24"
    } 
variable "lb_subnet_1" {
        default = "10.26.5.0/24"
    } 

variable "network" {
    description = "VPC network for VM"
    
}
variable "subnet1" {
    description = "Subnet 1 inside VPC"
    
}
variable "subnet2" {
    description = "Subnet 2 inside VPC"

}