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

