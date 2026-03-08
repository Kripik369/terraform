locals {
web_count = 2
db_count = 3
  webservers = [
     for i in range(local.web_count) :
    {
      name            = yandex_compute_instance.web["${i}"].name
      nat_ip_address  = yandex_compute_instance.web["${i}"].network_interface[0].nat_ip_address
      fqdn            = yandex_compute_instance.web["${i}"].fqdn
    }
  ]
  
  databases = [
      for i in range(local.db_count) :
    {
      name            = yandex_compute_instance.bd[i].name
      nat_ip_address  = yandex_compute_instance.bd[i].network_interface[0].nat_ip_address
      fqdn            = yandex_compute_instance.bd[i].fqdn
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

