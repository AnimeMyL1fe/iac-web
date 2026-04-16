resource "yandex_vpc_address" "addr1" {
  name = "static-for-balancer"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
