###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

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
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "vm_web_ubuntu-2004-lts"{
  type  = string
  default = "ubuntu-2004-lts"
  description = "name_family_os"
}
#variable "sec_id"{
#  type  = string
#  default = "enprbdcbsbl6kibpdkjk"
#  description = "security_group_id"
#}
variable "each_vm" {
  type = list(object({  vm_name=list(string), cpu=number, ram=number, disk_volume=number }))
  default = []
}
variable "web_cores" {
  description = "CPU cores for web instances"
  type        = number
  default     = 2
}

variable "web_memory" {
  description = "RAM for web instances (GB)"
  type        = number
  default     = 1
}

variable "web_core_fraction" {
  description = "CPU core fraction"
  type        = number
  default     = 20
}
variable "d_size" {
  description = "disc_size"
  type        = number
  default     = 10
}
variable "m_c" {
  description = "c_size"
  type        = number
  default     = 2
}
variable "m_d" {
  description = "m_size"
  type        = number
  default     = 4
}

variable "si_d" {
  description = "m_size"
  type        = number
  default     = 2
}
variable "d_count" {
  description = "counter"
  type        = number
  default     = 2
}
variable "vm_count" {
  type        = number
  description = "Количество VM для создания"
  default     = 5
}

variable "base_vm_name" {
  type        = string
  description = "Базовое имя VM (будет добавлен номер)"
  default     = "main"
}

variable "base_cpu" {
  type        = number
  description = "Количество CPU для каждой VM"
  default     = 4
}

variable "base_ram" {
  type        = number
  description = "Объем RAM (ГБ) для каждой VM"
  default     = 8
}

variable "base_disk" {
  type        = number
  description = "Размер диска (ГБ) для каждой VM"
  default     = 5
}

