#   required_version = ">= 0.13"
#   backend "s3" {
#     endpoints = {
#       s3 = "https://storage.yandexcloud.net"
#     }
#     bucket = "ya-prac-grishin"
#     region = "ru-central1"
#     key    = "prac/instance/terraform.tfstate"

#     skip_region_validation      = true
#     skip_credentials_validation = true
#     skip_requesting_account_id  = true 
#     skip_s3_checksum            = true 
#   }

module "yandex_network" {
  source        = "./modules_yandex/yandex_networks"

  allowed_ports = var.allowed_ports
  cidr_v4       = var.cidr_v4
}
module "yandex_instances" {
  depends_on = [ module.yandex_network ]
  source           = "./modules_yandex/yandex_instances"
  
  vm_configuration  = var.vm_configuration
  vms_profile       = var.vms_profile
  path_ssh          = var.path_ssh
  private_path_ssh  = var.private_path_ssh
  vm_user           = var.vm_user
  subnet_id         = module.yandex_network.sub_id
  security_group_id = module.yandex_network.sg_id
}