locals {
  webservers = [
    {
      name            = yandex_compute_instance.web[0].name
      nat_ip_address  = yandex_compute_instance.web[0].network_interface[0].nat_ip_address
      fqdn            = yandex_compute_instance.web[0].fqdn
    },
    {
      name            = yandex_compute_instance.web[1].name
      nat_ip_address  = yandex_compute_instance.web[1].network_interface[0].nat_ip_address
      fqdn            = yandex_compute_instance.web[1].fqdn
    }
  ]
  
  databases = [
    {
      name            = yandex_compute_instance.bd["main"].name
      nat_ip_address  = yandex_compute_instance.bd["main"].network_interface[0].nat_ip_address
      fqdn            = yandex_compute_instance.bd["main"].fqdn
    },
    {
      name            = yandex_compute_instance.bd["replica"].name
      nat_ip_address  = yandex_compute_instance.bd["replica"].network_interface[0].nat_ip_address
      fqdn            = yandex_compute_instance.bd["replica"].fqdn
    }
  ]
  
  storage_vm = {
    name            = yandex_compute_instance.storage.name
    nat_ip_address  = yandex_compute_instance.storage.network_interface[0].nat_ip_address
    fqdn            = yandex_compute_instance.storage.fqdn
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tmpl", {
    webservers = local.webservers
    databases  = local.databases
    storage    = [local.storage_vm]
  })
  filename = "${path.module}/ansible_inventory.ini"
}

