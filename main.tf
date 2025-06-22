resource "google_compute_address" "static" {
  name   = "my-static-ip"
  region = "asia-northeast3"
}

resource "google_compute_instance" "default"{
    name             = "test1"
    machine_type     = "e2-medium"
    zone             = "asia-northeast3-a"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2204-lts"
        }
    }

    network_interface {
        network      = "default"
        access_config {
            nat_ip = google_compute_address.static.address
        }
    }

    tags = ["ssh-allow-multi"]
}