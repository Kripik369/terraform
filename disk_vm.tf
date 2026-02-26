resource "yandex_compute_disk" "disk" {
  count = 3 
  name  = "disk-1gb-${count.index + 1}"
  type  = "network-hdd"
  size  = 5       
}
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  
  resources {
    cores  = 2
    memory = 4
  }
  
  boot_disk {
    initialize_params {
      size      = 10
      image_id  = "fd80mrhj8fl2oe87o4e1"
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

