resource "yandex_compute_instance" "bd"{
 count = 3
 name        = "main-${count.index}"
 platform_id = "standard-v3"
 zone        = "ru-central1-b"
 resources {
    cores  = var.web_cores 
    memory = var.web_memory
  }
 boot_disk {
    initialize_params {
     size = var.d_size 
     image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
 network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
 metadata = {
    ssh-keys = "web:${local.public_key}"
  }
}
