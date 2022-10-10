resource "google_compute_subnetwork" "subnet1" {
  name          =  "${format("%s","${var.company}-${var.env}-${var.region}")}"
  ip_cidr_range = "${var.net1_region1_subnet}"
  network       = google_compute_network.vpc.id
  # network       = "${google_compute_network.management.self_link}"
  region        = "${var.region}"
}
resource "google_compute_subnetwork" "subnet2" {
  name          =  "${format("%s","${var.company}-${var.env}-${var.region2}")}"
  ip_cidr_range = "${var.net1_region2_subnet}"
  network      = google_compute_network.vpc.id
  region        = "${var.region2}"
}


resource "google_compute_subnetwork" "subnet-for-l7lb" {
  provider = google-beta

  name          = "l7lb-test-subnetwork"
  ip_cidr_range = var.lb_subnet_1
  region        = var.region
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
  network       = google_compute_network.lb-test.id
}
