resource "yandex_compute_disk" "disk" {
  count = var.d_count
  name  = "disk-1gb-${count.index + 1}"
  type  = "network-hdd"
  size  = var.si_d
}
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  
  resources {
    cores  = var.m_c
    memory = var.m_d
  }
  
  boot_disk {
    initialize_params {
      size      = var.d_size
      image_id  = data.yandex_compute_image.ubuntu.id
    }
  }
  
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk
    content {
      disk_id    = secondary_disk.value.id
      auto_delete = true
    }
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}

