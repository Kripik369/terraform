data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ubuntu-2004-lts
}
resource "yandex_compute_instance" "web"{
 count = 2
 name = "web-${count.index+1}"
 resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
 boot_disk {
    initialize_params {
     image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
 network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
 depends_on = [yandex_compute_instance.bd]
 metadata = {
    ssh-keys = "web:${local.public_key}"
  }
}

