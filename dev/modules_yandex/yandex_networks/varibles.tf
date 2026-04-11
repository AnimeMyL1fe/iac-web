#======================================
# YANDEX_NETWORKS VARIBLES
#======================================

#-----------------------
# provider
#-----------------------
variable "yandex_zone" {
  type = string
  default = "ru-central1-a"
}

#-----------------------
# security_group
#-----------------------
variable "allowe_ports" {
  type = list(string)
}

#-----------------------
# subnet
#-----------------------
variable "cidr_v4" {
  type = list(string)
}
