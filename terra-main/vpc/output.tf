output "vpc_name" { 
    #   value = "${module.vpc.id}"
    value = google_compute_network.vpc.name
  }

output "vpc_id" { 
    #   value = "${module.vpc.id}"
    value = google_compute_network.vpc.id
  }

output "vpc_self_link" { 
    #   value = "${module.vpc.id}"
    value = google_compute_network.vpc.self_link
  }


output "lb-test_name" { 
    #   value = "${module.vpc.id}"
    value = google_compute_network.lb-test.name
  }

output "lb-test_id" { 
    #   value = "${module.vpc.id}"
    value = google_compute_network.lb-test.id
  }

output "lb-test_self_link" { 
    #   value = "${module.vpc.id}"
    value = google_compute_network.lb-test.self_link
  }





output "subnet1_self_link" { 
    #   value = "${module.vpc.id}"
    value = google_compute_subnetwork.subnet1.self_link
  }

output "subnet2_self_link" { 
    #   value = "${module.vpc.id}"
    value = google_compute_subnetwork.subnet2.self_link
  }
