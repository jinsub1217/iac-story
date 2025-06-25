resource "google_compute_address" "static" {
  name   = "my-static-ip"
  region = "asia-northeast3"
}

resource "google_compute_firewall" "ssh-allow-ingress" {
    name        = "ssh-allow-test"
    network     = "default"

    direction   = "INGRESS"
    priority    = 1000

    allow {
        protocol    = "tcp"
        ports       = ["22", "8022"]
    }

    source_ranges   = ["0.0.0.0/0"]
    target_tags     = ["ssh-allow-test"]
}

resource "google_compute_instance" "default"{
    name             = "test1"
    machine_type     = "e2-medium"
    zone             = "asia-northeast3-a"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2204-lts"
            size = 30
            type = "pd-ssd" # ssd는 "pd-ssd", HDD는 "pd-standard"
        }
    }

    network_interface {
        network      = "default"
        access_config {
            nat_ip = google_compute_address.static.address
        }
    }

    tags = ["http-server", "https-server", "ssh-allow-test"]
}