output "sg_id" {
  value = yandex_vpc_security_group.sg1_web.id
}

output "sub_id" {
  value = yandex_vpc_subnet.sub_web.id
}