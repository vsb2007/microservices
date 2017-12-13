provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

###############

resource "google_container_cluster" "primary" {
  name               = "gke-test"
  zone               = "europe-west1-b"
  initial_node_count = 2

  #  additional_zones = [
  #    "us-central1-b",
  #    "us-central1-c",
  #  ]

  #  master_auth {
  #    username = "mr.yoda"
  #    password = "adoy.rm"
  #  }
  node_version = "1.8.3-gke.0"
  min_master_version = "1.8.3-gke.0"
  node_config {
    #    oauth_scopes = [  #      "https://www.googleapis.com/auth/compute",  #      "https://www.googleapis.com/auth/devstorage.read_only",  #      "https://www.googleapis.com/auth/logging.write",  #      "https://www.googleapis.com/auth/monitoring",  #    ]

    #    labels {  #      foo = "bar"  #    }

    #    tags = ["foo", "bar"]

    disk_size_gb = "20"
    machine_type = "g1-small"
  }

  addons_config {
    kubernetes_dashboard  {
      disabled = false
    }
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
#output "client_certificate" {
#  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
#}


#output "client_key" {
#  value = "${google_container_cluster.primary.master_auth.0.client_key}"
#}


#output "cluster_ca_certificate" {
#  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
#}

module "vpc" {
  source        = "modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
