resource "aws_security_group" "vault-vpc-Vault-Redis" {
  description               = "Security Group for Vault Redis server"
  name                      = "Vault-Redis"
  tags {
    "Name" = "Vault-Redis"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Redis:
resource "aws_security_group_rule" "ingress_tcp_6379_to_6379_for_vault-vpc-Vault-Redis_via_sg_1020b31" {
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Redis.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-UI.id}"
  to_port                   = 6379
  type                      = "ingress"
}

resource "aws_security_group" "vault-vpc-Vault-NAT" {
  description               = "Security Group for Vault NAT server"
  name                      = "Vault-NAT"
  tags {
    "Name" = "Vault-NAT"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-NAT:
resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_vault-vpc-Vault-NAT_via_sg_e9b6395" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-NAT.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Internet-Access.id}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-NAT:
resource "aws_security_group_rule" "egress_tcp_443_to_443_for_vault-vpc-Vault-NAT_via_cidr_401543e" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-NAT.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-UI-ELB" {
  description               = "Security Group for UI Internal ELB"
  name                      = "Vault-UI-ELB"
  tags {
    "Name" = "Vault-UI-ELB"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-UI-ELB:
resource "aws_security_group_rule" "ingress_tcp_42000_to_42000_for_vault-vpc-Vault-UI-ELB_via_sg_59c92b5" {
  from_port                 = 42000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-UI-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Web.id}"
  to_port                   = 42000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-UI-ELB:
resource "aws_security_group_rule" "egress_tcp_42000_to_42000_for_vault-vpc-Vault-UI-ELB_via_sg_64c0be6" {
  from_port                 = 42000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-UI-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-UI.id}"
  to_port                   = 42000
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-API-ELB" {
  description               = "Security Group for API Internal ELB"
  name                      = "Vault-API-ELB"
  tags {
    "Name" = "Vault-API-ELB"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-API-ELB:
resource "aws_security_group_rule" "ingress_tcp_41000_to_41000_for_vault-vpc-Vault-API-ELB_via_sg_0ba20bf" {
  from_port                 = 41000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Web.id}"
  to_port                   = 41000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-API-ELB:
resource "aws_security_group_rule" "egress_tcp_41000_to_41000_for_vault-vpc-Vault-API-ELB_via_sg_21658a2" {
  from_port                 = 41000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-API.id}"
  to_port                   = 41000
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-API" {
  description               = "Security Group for Vault API"
  name                      = "Vault-API"
  tags {
    "Name" = "Vault-API"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-API:
resource "aws_security_group_rule" "ingress_tcp_41000_to_41000_for_vault-vpc-Vault-API_via_sg_45a65d3" {
  from_port                 = 41000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-API-ELB.id}"
  to_port                   = 41000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-API:
resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_vault-vpc-Vault-API_via_sg_7ef3b05" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-DB.id}"
  to_port                   = 5432
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_vault-vpc-Vault-API_via_sg_60b336c" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API.id}"
  source_security_group_id  = "${var.mgmt-sftp-sg}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_43000_to_43000_for_vault-vpc-Vault-API_via_sg_8440027" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  to_port                   = 43000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40001_to_40001_for_vault-vpc-Vault-API_via_sg_a47d0f0" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-API.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  to_port                   = 40001
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-UI" {
  description               = "Security Group for Vault UI"
  name                      = "Vault-UI"
  tags {
    "Name" = "Vault-UI"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-UI:
resource "aws_security_group_rule" "ingress_tcp_42000_to_42000_for_vault-vpc-Vault-UI_via_sg_b5e1bd4" {
  from_port                 = 42000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-UI.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-UI-ELB.id}"
  to_port                   = 42000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-UI:
resource "aws_security_group_rule" "egress_tcp_6379_to_6379_for_vault-vpc-Vault-UI_via_sg_1db0c38" {
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-UI.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Redis.id}"
  to_port                   = 6379
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40001_to_40001_for_vault-vpc-Vault-UI_via_sg_0a6b88d" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-UI.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  to_port                   = 40001
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-DB" {
  description               = "Security Group for Vault DB"
  name                      = "Vault-DB"
  tags {
    "Name" = "Vault-DB"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-DB:
resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_vault-vpc-Vault-DB_via_self_23580ba" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-DB.id}"
  self                      = true
  to_port                   = 5432
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_vault-vpc-Vault-DB_via_sg_a78a0b2" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-DB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-API.id}"
  to_port                   = 5432
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_vault-vpc-Vault-DB_via_sg_121854c" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-DB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  to_port                   = 5432
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_vault-vpc-Vault-DB_via_sg_26f15e7" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-DB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  to_port                   = 5432
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-DB:
resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_vault-vpc-Vault-DB_via_self_9b29cfa" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-DB.id}"
  self                      = true
  to_port                   = 5432
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Config" {
  description               = "Security Group for Vault Config"
  name                      = "Vault-Config"
  tags {
    "Name" = "Vault-Config"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Config:
resource "aws_security_group_rule" "ingress_tcp_40001_to_40001_for_vault-vpc-Vault-Config_via_sg_68b6de3" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Config.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  to_port                   = 40001
  type                      = "ingress"
}

resource "aws_security_group" "vault-vpc-Vault-Web" {
  description               = "Security Group for Web server"
  name                      = "Vault-Web"
  tags {
    "Name" = "Vault-Web"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Web:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_vault-vpc-Vault-Web_via_sg_48df7e8" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Web.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-ELB-External.id}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_vault-vpc-Vault-Web_via_sg_5a63e3d" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Web.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-ELB-External.id}"
  to_port                   = 443
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_vault-vpc-Vault-Web_via_sg_e4f094a" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Web.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-Web:
resource "aws_security_group_rule" "egress_tcp_41000_to_41000_for_vault-vpc-Vault-Web_via_sg_681ef27" {
  from_port                 = 41000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Web.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-API-ELB.id}"
  to_port                   = 41000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_42000_to_42000_for_vault-vpc-Vault-Web_via_sg_a5121e8" {
  from_port                 = 42000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Web.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-UI-ELB.id}"
  to_port                   = 42000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40000_to_40000_for_vault-vpc-Vault-Web_via_sg_aefe211" {
  from_port                 = 40000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Web.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Gateway-ELB.id}"
  to_port                   = 40000
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Management" {
  description               = "Security Group for managing Vault instances"
  name                      = "Vault-Management"
  tags {
    "Name" = "Vault-Management"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Management:
resource "aws_security_group_rule" "ingress_tcp_0_to_65535_for_vault-vpc-Vault-Management_via_sg_c9a2e51" {
  from_port                 = 0
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nessus-sg}"
  to_port                   = 65535
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_vault-vpc-Vault-Management_via_sg_7fa4b1c" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 5432
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_42000_to_42000_for_vault-vpc-Vault-Management_via_sg_03483d9" {
  from_port                 = 42000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 42000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_41000_to_41000_for_vault-vpc-Vault-Management_via_sg_c8be19d" {
  from_port                 = 41000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 41000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_vault-vpc-Vault-Management_via_sg_1ee4d69" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-deploy-sg}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_vault-vpc-Vault-Management_via_sg_01e1e95" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-bastion-sg}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_41010_to_41010_for_vault-vpc-Vault-Management_via_sg_a95a3dc" {
  from_port                 = 41010
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 41010
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_43000_to_43000_for_vault-vpc-Vault-Management_via_sg_de73690" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 43000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_40001_to_40001_for_vault-vpc-Vault-Management_via_sg_307b030" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 40001
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_40000_to_40000_for_vault-vpc-Vault-Management_via_sg_56008a0" {
  from_port                 = 40000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 40000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_vault-vpc-Vault-Management_via_sg_fa142e3" {
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 5666
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_icmp_8_to_-1_for_vault-vpc-Vault-Management_via_sg_04803c1" {
  from_port                 = 8
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = -1
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-Management:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_vault-vpc-Vault-Management_via_sg_6af3bcd" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-repo-sg}"
  to_port                   = 80
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_1515_to_1515_for_vault-vpc-Vault-Management_via_sg_d02638a" {
  from_port                 = 1515
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-ossec-sg}"
  to_port                   = 1515
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_1514_to_1514_for_vault-vpc-Vault-Management_via_sg_19480ad" {
  from_port                 = 1514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-ossec-sg}"
  to_port                   = 1514
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_636_to_636_for_vault-vpc-Vault-Management_via_sg_35df455" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 636
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_123_to_123_for_vault-vpc-Vault-Management_via_sg_d03e711" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-ntp-sg}"
  to_port                   = 123
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_vault-vpc-Vault-Management_via_cidr_ed070b1" {
  from_port                 = 443
  prefix_list_ids           = ["${var.prefix-list-id}"]
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_2049_to_2049_for_vault-vpc-Vault-Management_via_sg_82ed042" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 2049
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_vault-vpc-Vault-Management_via_sg_8e6c5d4" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-kibana-sg}"
  to_port                   = 9200
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5044_to_5044_for_vault-vpc-Vault-Management_via_sg_8e6c5d4" {
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Management.id}"
  source_security_group_id  = "${var.mgmt-kibana-sg}"
  to_port                   = 5044
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Batch" {
  description               = "Sercurity Group for Vault Batch server"
  name                      = "Vault-Batch"
  tags {
    "Name" = "Vault-Batch"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Outgoing rules for vault-vpc-Vault-Batch:
resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_vault-vpc-Vault-Batch_via_sg_e9bf759" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-DB.id}"
  to_port                   = 5432
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_vault-vpc-Vault-Batch_via_sg_e697a59" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  source_security_group_id  = "${var.mgmt-sftp-sg}"
  to_port                   = 22
  type                      = "egress"
  count                     = "${terraform.env != "sydney" ? 1 : 0}"
}

resource "aws_security_group_rule" "egress_tcp_43000_to_43000_for_vault-vpc-Vault-Batch_via_sg_c5b4d21" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  to_port                   = 43000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40001_to_40001_for_vault-vpc-Vault-Batch_via_sg_be0a001" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  to_port                   = 40001
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-ELB-External" {
  description               = "Security Group for external web access to Web ELB"
  name                      = "Vault-ELB-External"
  tags {
    "Name" = "Vault-ELB-External"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-ELB-External:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_vault-vpc-Vault-ELB-External_via_cidr_5398e0c" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-ELB-External.id}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_vault-vpc-Vault-ELB-External_via_cidr_39f181b" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-ELB-External.id}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-ELB-External:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_vault-vpc-Vault-ELB-External_via_sg_85bd43c" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-ELB-External.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Web.id}"
  to_port                   = 80
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_vault-vpc-Vault-ELB-External_via_sg_aa3f22a" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-ELB-External.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Web.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Config-ELB" {
  description               = "Security Group for Vault Config ELB"
  name                      = "Vault-Config-ELB"
  tags {
    "Name" = "Vault-Config-ELB"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Config-ELB:
resource "aws_security_group_rule" "ingress_tcp_40001_to_40001_for_vault-vpc-Vault-Config-ELB_via_sg_6d60056" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-API.id}"
  to_port                   = 40001
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_40001_to_40001_for_vault-vpc-Vault-Config-ELB_via_sg_17ead08" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-UI.id}"
  to_port                   = 40001
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_40001_to_40001_for_vault-vpc-Vault-Config-ELB_via_sg_2e738a5" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  to_port                   = 40001
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_40001_to_40001_for_vault-vpc-Vault-Config-ELB_via_sg_53646ce" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  to_port                   = 40001
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-Config-ELB:
resource "aws_security_group_rule" "egress_tcp_40001_to_40001_for_vault-vpc-Vault-Config-ELB_via_sg_3062ef6" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Config.id}"
  to_port                   = 40001
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Engine" {
  description               = "Security Group for Vault Engine"
  name                      = "Vault-Engine"
  tags {
    "Name" = "Vault-Engine"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Engine:
resource "aws_security_group_rule" "ingress_tcp_43000_to_43000_for_vault-vpc-Vault-Engine_via_sg_d52df9b" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Engine.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  to_port                   = 43000
  type                      = "ingress"
}

resource "aws_security_group" "vault-vpc-Vault-Engine-ELB" {
  description               = "Security Group for Engine Internal ELB"
  name                      = "Vault-Engine-ELB"
  tags {
    "Name" = "Vault-Engine-ELB"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Engine-ELB:
resource "aws_security_group_rule" "ingress_tcp_43000_to_43000_for_vault-vpc-Vault-Engine-ELB_via_sg_1e0865a" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-API.id}"
  to_port                   = 43000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_43000_to_43000_for_vault-vpc-Vault-Engine-ELB_via_sg_bac0c49" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Batch.id}"
  to_port                   = 43000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_43000_to_43000_for_vault-vpc-Vault-Engine-ELB_via_sg_f9c22eb" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  to_port                   = 43000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-Engine-ELB:
resource "aws_security_group_rule" "egress_tcp_43000_to_43000_for_vault-vpc-Vault-Engine-ELB_via_sg_5f655c9" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Engine.id}"
  to_port                   = 43000
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Gateway-ELB" {
  description               = "Security Group for Gateway Internal ELB"
  name                      = "Vault-Gateway-ELB"
  tags {
    "Name" = "Vault-Gateway-ELB"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Gateway-ELB:
resource "aws_security_group_rule" "ingress_tcp_40000_to_40000_for_vault-vpc-Vault-Gateway-ELB_via_sg_61caad5" {
  from_port                 = 40000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Gateway-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Web.id}"
  to_port                   = 40000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-Gateway-ELB:
resource "aws_security_group_rule" "egress_tcp_40000_to_40000_for_vault-vpc-Vault-Gateway-ELB_via_sg_786fdda" {
  from_port                 = 40000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Gateway-ELB.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  to_port                   = 40000
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Gateway" {
  description               = "Security Group for Vault Gateway"
  name                      = "Vault-Gateway"
  tags {
    "Name" = "Vault-Gateway"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Incoming rules for vault-vpc-Vault-Gateway:
resource "aws_security_group_rule" "ingress_tcp_40000_to_40000_for_vault-vpc-Vault-Gateway_via_sg_4ddb9b4" {
  from_port                 = 40000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Gateway-ELB.id}"
  to_port                   = 40000
  type                      = "ingress"
}

# Outgoing rules for vault-vpc-Vault-Gateway:
resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_vault-vpc-Vault-Gateway_via_sg_362c06f" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-DB.id}"
  to_port                   = 5432
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_43000_to_43000_for_vault-vpc-Vault-Gateway_via_sg_8ffbb66" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"
  to_port                   = 43000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40001_to_40001_for_vault-vpc-Vault-Gateway_via_sg_7c6c7b3" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
  source_security_group_id  = "${aws_security_group.vault-vpc-Vault-Config-ELB.id}"
  to_port                   = 40001
  type                      = "egress"
}

resource "aws_security_group" "vault-vpc-Vault-Internet-Access" {
  description               = "Security Group for server Internet access"
  name                      = "Vault-Internet-Access"
  tags {
    "Name" = "Vault-Internet-Access"
  }
  vpc_id = "${aws_vpc.vault-vpc.id}"
}

# Outgoing rules for vault-vpc-Vault-Internet-Access:
resource "aws_security_group_rule" "egress_tcp_443_to_443_for_vault-vpc-Vault-Internet-Access_via_cidr_6c2bbc4" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vault-vpc-Vault-Internet-Access.id}"
  to_port                   = 443
  type                      = "egress"
}
