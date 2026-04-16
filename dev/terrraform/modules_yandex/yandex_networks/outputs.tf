output "sg_id" {
  value = yandex_vpc_security_group.sg1.id
}

output "sub_id" {
  value = yandex_vpc_subnet.sub_web.id
}
output "static_ip" {
  value = yandex_vpc_address.addr1.external_ipv4_address[0].address
}