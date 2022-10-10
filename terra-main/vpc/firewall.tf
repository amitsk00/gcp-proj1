resource "google_compute_firewall" "allow-internal" {
  name    = "${var.company}-fw-allow-internal"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    "${var.net1_region1_subnet}",
    "${var.net1_region2_subnet}"
  ]
}
resource "google_compute_firewall" "allow-http" {
  name    = "${var.company}-fw-allow-http"
  network = "${google_compute_network.vpc.name}"
allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"] 
}
resource "google_compute_firewall" "allow-bastion" {
  name    = "${var.company}-fw-allow-bastion"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
  }
  





# // Adding GCP Firewall Rules for MANGEMENT
# resource "google_compute_firewall" "allow-mgmt" {
#   name    = "allow-mgmt"
#   network = "${google_compute_network.management.self_link}"

#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["443", "22"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

# // Adding GCP Firewall Rules for INBOUND
# resource "google_compute_firewall" "allow-inbound" {
#   name    = "allow-inbound"
#   network = "${google_compute_network.untrust.self_link}"

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "22", "221", "222"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

# // Adding GCP Firewall Rules for OUTBOUND
# resource "google_compute_firewall" "web-allow-outbound" {
#   name    = "web-allow-outbound"
#   network = "${google_compute_network.web.self_link}"

#   allow {
#     protocol = "all"
#   }

#   source_ranges = ["0.0.0.0/0"]
# }
