resource "yandex_compute_instance" "bd"{
 for_each = {
    for vm in var.each_vm : 
    vm.vm_name => vm
  }
 name = "${each.key}"
 resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }
 boot_disk {
    initialize_params {
     size = each.value.disk_volume
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
