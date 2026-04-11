#======================================
# YANDEX_INSTANCES VARIBLES
#======================================

#-----------------------
# provider
#-----------------------
variable "yandex_zone" {
  type = string
  default = "ru-central1-a"
}

#-----------------------
# disk configuration
#-----------------------
variable "yandex_disk" {
  type = map(object({
    disk_name = string
    disk_type = string
    disk_size = number
  }))
}


#-----------------------
# configuration cloud vm
#-----------------------

variable "vm_configuration" {
  type = map(object({
    vm_name     = string
    vm_profile  = string
  }))
}

variable "vms_profile" {
  type = map(object({
    platform_id = string
    cores       = number
    memory      = number
  }))
}

variable "subnet_id" {} 

variable "security_group_id" {}


variable "path_ssh" {
  type = string
}