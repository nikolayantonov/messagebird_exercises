provider "google" {
 credentials = "${file("My First Project-f07fc78c2c16.json")}"
 project     = "green-objective-224814"
 region      = "europe-west1-b"
 version    = "1.2"
}

resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_instance" "default" {
 name         = "gcp-app-${random_id.instance_id.hex}"
 machine_type = "n1-standard-2"
 zone         = "europe-west1-b"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

 metadata_startup_script = "sudo apt-get update; sudo docker pull prom/prometheus"

 network_interface {
   network = "default"

   access_config {
   }
 }
}
