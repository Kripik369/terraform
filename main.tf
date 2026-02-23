resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

# Подсеть для зоны B  
resource "yandex_vpc_subnet" "public-b" {
  name           = "public-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ubuntu-2004-lts
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_a 
  platform_id = var.vm_web_name_standard-v3
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
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
data "yandex_compute_image" "ubuntub" {
  family = var.vm_db_ubuntu-2004-lts
}
resource "yandex_compute_instance" "platformb" {
  name        = local.vm_web_b
  platform_id = var.vm_db_standard-v3
  allow_stopping_for_update = true
  zone        = "ru-central1-b"
  resources {
    cores         = local.web_resources.cores
    memory        = local.web_resources.memory
    core_fraction = 20 
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public-b.id
    nat       = true
  }
}
locals {
  # Имена VM с интерполяцией нескольких переменных
  vm_web_a  = "${var.vm_name_prefix}-web-a"
  vm_web_b  = "${var.vm_name_prefix}-web-b"
  
  # Ресурсы из map vms_resources
  web_resources  = var.vms_resources["web"]
  db_resources   = var.vms_resources["db"]
}


