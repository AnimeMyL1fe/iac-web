resource "yandex_compute_disk" "vm_disk" {
  for_each = var.yandex_disk
  name     = each.value.disk_name
  type     = each.value.disk_type
  zone     = var.yandex_zone
  image_id = data.yandex_compute_image.ubuntu_image.id
  size     = each.value.disk_size

  labels = {
    environment = "ubuntu-disk"
  }
}