locals {
  vm_ip = {for k, v in yandex_compute_instance.vm_ubuntu : k=>{
    private_ip = v.network_interface[0].ip_address
    public_ip  = v.network_interface[0].nat_ip_address
  }}
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/hosts.yaml.tpl", {
    vms                 = local.vm_ip
    ans_user            = var.vm_user
    ans_ssh_key         = var.private_path_ssh
    mw_db_internal_ip   = yandex_compute_instance.vm_ubuntu["mw-db1"].network_interface[0].ip_address
 #   zbx_db_internal_ip  = yandex_compute_instance.vm_ubuntu["zbx_database"].network_interface[0].ip_address
  })
  filename = "${path.module}/../../../ansible/inventory/hosts.yaml"
}