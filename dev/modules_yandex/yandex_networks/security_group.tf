resource "yandex_vpc_security_group" "sg1_web" {
  name        = "Firewall web servers"
  network_id  = yandex_vpc_network.net_web.id

  labels = {
    my-label = "sg1-web"
  }

  dynamic "ingress" {
    for_each = var.allowe_ports
    content{
        protocol       = "TCP"
        description    = "allowed ports"
        v4_cidr_blocks = ["0.0.0.0/0"]
        port           = ingress.value
    }
  }

  ingress {
    protocol       = "TCP"
    description    = "rule1 description"
    v4_cidr_blocks = [var.cidr_v4]
    port           = 80
  }

  egress {
    protocol       = "ANY"
    description    = "rule3 description"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
