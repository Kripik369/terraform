###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_zoneb" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = 
  description = "ssh-keygen -t ed25519"
}
variable "vm_web_ubuntu-2004-lts"{
  type  = string
  default = "ubuntu-2004-lts"
  description = "name_family_os"
}
variable "vm_web_name_netology-develop-platform-web"{
  type  = string
  default = "netology-develop-platform-web"
}
variable "vm_web_name_standard-v3"{
  type  = string
  default = "standard-v3"
}
variable "cores"{
  type  = string
  default = "2"
}
variable "memory"{
  type  = string
  default = "4"
}
variable "core_fraction"{
  type  = string
  default = "20"
}
variable "vms_resources" {
  description = "Ресурсы VM"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 5
    }
    db  = {
      cores         = 2
      memory        = 4
      core_fraction = 20
    }
  }
}

variable "vm_name_prefix" {
  description = "Префикс имени VM"
  type        = string
  default     = "netology-develop-platform"
}

