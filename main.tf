provider "google" {
  credentials = "${file("My First Project-f07fc78c2c16.json")}"
  project     = "green-objective-224814"
  region      = "europe-west1-b"
}

resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
  name         = "gcp-app-test"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata {
    sshKeys = "niko:${file("/home/niko/Documents/id_rsa.pub")}"
  }

  network_interface {
    network = "default"

    access_config {}
  }

  provisioner "file" {
    source      = "prometheus.yml"
    destination = "prometheus.yml"

    connection {
      type        = "ssh"
      user        = "niko"
      private_key = "${file("~/.ssh/authorized_keys")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y install docker; sudo docker pull prom/prometheus",
      "docker run -p 9090:9090 -v /home/niko/prometheus.yml:/etc/prometheus.prometheus.yml prom/prometheus",
    ]

    connection {
      type        = "ssh"
      user        = "niko"
      private_key = "${file("~/.ssh/authorized_keys")}"
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "9090"]
  }
}
