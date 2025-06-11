module "vpc" {
  source = "../vpc" 
  project_id = var.project_id
  # env                   = var.env
  # company               = var.company
  # net1_region1_subnet = var.net1_region1_subnet
  # net1_region2_subnet = var.net1_region2_subnet
  region = var.region
  # lb_subnet_1 = var.lb_subnet_1

}

resource "google_compute_instance" "default" {
  name         = "${format("%s","${var.company}-${var.env}-${var.region}-instance1")}"
  machine_type  = var.machine_type
  #zone         =   "${element(var.var_zones, count.index)}"
  zone          =   var.zone
  tags          = ["ssh","http"]
  boot_disk {
    initialize_params {
      image     =  var.image     
    }
  }
  labels = {
      webserver =  "true"     
    }
  service_account {
    email  = google_service_account.default.email
    scopes = "${var.scopes_web}"
  }
  metadata = {
        startup-script = <<SCRIPT
        apt-get -y update
        apt-get -y install nginx
        export HOSTNAME=$(hostname | tr -d '\n')
        export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
        echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /usr/share/nginx/www/index.html
        service nginx start
        SCRIPT
    } 
  network_interface {
    # network = "${module.vpc.google_compute_network.vpc.id}"
    # subnetwork = "${module.vpc.google_compute_subnetwork.subnet1.name}"
    network = "${var.network}"
    subnetwork = "${var.subnet1}"
    
    access_config {
      // Ephemeral IP
    }
  }
  
  depends_on = [ 
    module.vpc 

    # module.vpc.google_compute_network.vpc ,
    # module.vpc.google_compute_subnetwork.subnet1
  ]
}


resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "${var.public_key}"
}



