resource "yandex_compute_instance" "ubuntu" {
  for_each    = var.vm_configuration
  name        = each.value.vm_name
  platform_id = var.vms_profile[each.value.vm_profile].platform_id
  zone        = "ru-central1-a"

  resources {
    cores  = var.vms_profile[each.value.vm_profile].cores
    memory = var.vms_profile[each.value.vm_profile].memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.vm_disk.id
  }

  network_interface {
    index               = 1
    subnet_id           = var.subnet_id
    security_group_ids  = [var.security_group_id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("${var.path_ssh}")}"
  }
}