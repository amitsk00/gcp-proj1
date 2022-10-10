variable "project_id" { 
    description = "The GCP project name"
    type        = string
}

variable "credentials_file" { 
    description = "The crednetial based file"
    type        = string
}

variable "gcp-creds" {
    description = "The crednetial based file"
    default= ""
}

variable "env" {
        description = "Environment - just for ref purpose"
        default = "dev"
    }
variable "company" { 
        description = "The ccompany name"
        default = "myown"
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

variable "sa1" {
    description = "1 service account for GCE"
    default = "sa-gce-tf"
}



variable "firewall_name" {
    default = "am-vm"
}

variable "image" {
    description = "Your_VM_Series_Image"
    default = "debian-cloud/debian-11"
  
  # /Cloud Launcher API Calls to images/
  # default = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-byol-810"
  # default = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle2-810"
  # default = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle1-810"

}

variable "public_key" {
    description = "public key for the VM SSH"
    default = "id_rsa_amit"
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














variable "machine_type" {
    default = "n1-standard-4"
}

variable "machine_cpu" {
    default = "Intel Skylake"
}

variable "bootstrap_bucket" {
  default = "Your_Bootstrap_Bucket"
}

variable "nic0_name" {
  default = "management"
}

variable "nic1_name" {
  default = "untrust"
}

variable "scopes" {
  default = ["https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
  ]
}

// DB-SERVER Variables
variable "db_server_name" {
  default = "db-vm"
}

variable "machine_type_db" {
  default = "f1-micro"
}

variable "interface_3_name" {
  default = "db"
}

variable "image_db" {
  default = "debian-8"
}

variable "db_startup_script_bucket" {
  default = "Your_Startup_Bucket"

  // Example of string for startup bucket "gs://startup-2-tier/dbserver-startup.sh"
}

variable "scopes_db" {
  default = ["https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}

variable "ip_db" {
  default = "10.5.3.5"
}

// WEB-SERVER Vaiables
variable "web_server_name" {
  default = "am-webserver"
}

variable "machine_type_web" {
  default = "f1-micro"
}

variable "interface_2_name" {
  default = "web"
}

variable "image_web" {
  default = "debian-8"
}

variable "web_startup_script_bucket" {
  default = "Your_Startup_Bucket"

  //  Example of string for startup bucket  "gs://startup-2-tier/webserver-startup.sh"
}

variable "scopes_web" {
  default = ["https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}

variable "ip_web" {
  default = "10.5.2.5"
}


