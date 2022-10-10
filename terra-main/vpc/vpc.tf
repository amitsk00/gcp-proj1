resource "google_compute_network" "vpc" {
  name          =  "${format("%s","${var.company}-${var.env}-vpc")}"
  description   = "new custom network"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  # project_id = var.project_id
}

resource "google_compute_network" "lb-test" {
  provider = google-beta

  name                    = "l7lb-test-network"
  auto_create_subnetworks = false
  # project_id = var.project_id
}
