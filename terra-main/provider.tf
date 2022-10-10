provider "google" {
  project = "${var.project_id}"
  region  = "${var.region}"
  zone    = "${var.zone}"
#   credentials = var.gcp-creds
#   impersonate_service_account = var.tf_service_account
#   credentials = file("<NAME>.json")
# credentials = "C:\\Users\\Administrator\\Desktop\\Terraform\\mykey.json"
}

provider "google-beta" {
  project = "${var.project_id}"
  region  = "${var.region}"
  zone    = "${var.zone}"
#   credentials = var.gcp-creds
#   impersonate_service_account = var.tf_service_account
#   credentials = file("<NAME>.json")
# credentials = "C:\\Users\\Administrator\\Desktop\\Terraform\\mykey.json"
}
