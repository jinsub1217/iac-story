resource "google_compute_address" "static" {
  name   = var.address_name
  region = var.region
}

resource "google_compute_firewall" "ssh-allow-ingress" {
    name        = var.firewall_name
    network     = "default"

    direction   = "INGRESS"
    priority    = 1000

    allow {
        protocol    = "tcp"
        ports       = concat(
            ["22"],
            [tostring(var.ssh_port)]
        )
    }

    source_ranges   = ["0.0.0.0/0"]
    target_tags     = var.target_tags
}

resource "google_compute_instance" "default"{
    name             = var.instance_name
    machine_type     = var.machine_type
    zone             = var.zone

    boot_disk {
        initialize_params {
            image = var.instance_image
            size = var.instance_size
            type = var.instance_type
        }
    }

    network_interface {
        network      = "default"
        access_config {
            nat_ip = google_compute_address.static.address
        }
    }

    tags = var.instance_tags
}