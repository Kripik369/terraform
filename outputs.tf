output "platform_a_ip" {
  value       = yandex_compute_instance.platform.network_interface[0].nat_ip_address
  description = "Public IP VM в ru-central1-a"
}

output "platform_b_ip" {
  value       = yandex_compute_instance.platformb.network_interface[0].nat_ip_address
  description = "Public IP VM в ru-central1-b"
}

#output "all_public_ips" {
#  value = {
#    web_a = yandex_compute_instance.platforma.network_interface[0].nat_ip_address
#    web_b = yandex_compute_instance.platformb.network_interface[0].nat_ip_address
#  }
#}
