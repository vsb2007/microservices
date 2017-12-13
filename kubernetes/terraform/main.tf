provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_container_cluster" "primary" {
  name               = "gke-test"
  zone               = "europe-west1-b"
  initial_node_count = 2

  node_version       = "1.8.3-gke.0"
  min_master_version = "1.8.3-gke.0"

  node_config {
    disk_size_gb = "20"
    machine_type = "g1-small"
  }

  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }
}

module "vpc" {
  source        = "modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
