resource "aws_security_group" "mgmt-vpc-Mgmt-Deploy" {
  description               = "Security Group for Ansible deploy server"
  name                      = "Mgmt-Deploy"
  tags {
    "Name" = "Mgmt-Deploy"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Outgoing rules for mgmt-vpc-Mgmt-Deploy:
resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Mgmt-Deploy_via_sg_b7b4d0a" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Mgmt-Deploy_via_sg_ff4c477" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}"
  source_security_group_id  = "${var.cb-management-sg}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Mgmt-Deploy_via_sg_1191a9f" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Mgmt-Deploy_via_sg_7c99f3c" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Mgmt-Shearwater" {
  description               = "This security group is for Shearwater pentest access"
  name                      = "Mgmt-Shearwater"
  tags {
    "Name" = "Mgmt-Shearwater"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Mgmt-Shearwater:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_mgmt-vpc-Mgmt-Shearwater_via_cidr_8d6bfe6" {
  cidr_blocks               = ["121.127.199.220/32", "58.111.154.115/32", "113.29.245.69/32", "115.70.19.185/32", "120.151.211.162/32", "123.243.208.184/32", "220.245.9.150/32", "27.33.217.14/32", "27.33.217.56/29", "52.62.196.66/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Shearwater.id}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_3389_to_3389_for_mgmt-vpc-Mgmt-Shearwater_via_cidr_a3e141e" {
  cidr_blocks               = ["121.127.199.220/32", "58.111.154.115/32", "113.29.245.69/32", "115.70.19.185/32", "120.151.211.162/32", "123.243.208.184/32", "220.245.9.150/32", "27.33.217.14/32", "27.33.217.56/29", "52.62.196.66/32"]
  from_port                 = 3389
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Shearwater.id}"
  to_port                   = 3389
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Mgmt-Shearwater:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_mgmt-vpc-Mgmt-Shearwater_via_cidr_67ab30f" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-Shearwater.id}"
  to_port                   = 0
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V" {
  description               = "Enable USM Connections"
  name                      = "${terraform.env}-mgmt-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V"
  tags {
    "Name" = "Mgmt-AlienVaultSensor"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-staging-mgmt-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V:
resource "aws_security_group_rule" "ingress_udp_514_to_514_for_mgmt-vpc-mgmt-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V_via_sg_a511793" {
  from_port                 = 514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  to_port                   = 514
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-staging-mgmt-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V:
resource "aws_security_group_rule" "egress_tcp_7100_to_7100_for_mgmt-vpc-mgmt-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V_via_sg_8fc9982" {
  from_port                 = 7100
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 7100
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Bastion" {
  description               = "Security Group for external access to bastion"
  name                      = "Vault-Mgmt-Bastion"
  tags {
    "Name" = "Mgmt-Bastion"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-Bastion:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-Bastion_via_cidr_8e2aaa9" {
  # 103.205.28.155/32 - Jay
  # 113.29.245.69/32  - Sydney Office
  # 175.143.67.5/32   - KL Office
  # 13.54.14.102/32   - Denis
  cidr_blocks               = ["103.205.28.155/32", "113.29.245.69/32", "175.143.67.5/32", "13.54.14.102/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}"
  to_port                   = 22
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-Bastion:
resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-Bastion_via_sg_8c254b1" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-Bastion_via_sg_c5cf333" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-Bastion_via_sg_39e2e8a" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 22
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-NTP" {
  description               = "Security Group for NTP server"
  name                      = "Vault-Mgmt-NTP"
  tags {
    "Name" = "Mgmt-NTP"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-NTP:
resource "aws_security_group_rule" "ingress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NTP_via_sg_07c5759" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 123
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NTP_via_sg_57679f1" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  source_security_group_id  = "${var.cb-management-sg}"
  to_port                   = 123
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NTP_via_sg_74a8a9e" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 123
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NTP_via_sg_044fd8e" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 123
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-NTP:
resource "aws_security_group_rule" "egress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NTP_via_sg_e34e77a" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 123
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Kibana" {
  description               = "Security Group for Kibana server"
  name                      = "Vault-Mgmt-Kibana"
  tags {
    "Name" = "Mgmt-Kibana"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-Kibana:
resource "aws_security_group_rule" "ingress_tcp_5601_to_5601_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_d738cf2" {
  from_port                 = 5601
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  to_port                   = 5601
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_9200_to_9200_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_093f31a" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 9200
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_9200_to_9200_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_65e292f" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 9200
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_9200_to_9200_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_c4f430f" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 9200
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5044_to_5044_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_093f31a" {
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 5044
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5044_to_5044_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_65e292f" {
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 5044
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5044_to_5044_for_mgmt-vpc-Vault-Mgmt-Kibana_via_sg_c4f430f" {
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 5044
  type                      = "ingress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-NAT" {
  description               = "Security Group management NAT server"
  name                      = "Vault-Mgmt-NAT"
  tags {
    "Name" = "Mgmt-NAT"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-NAT:
resource "aws_security_group_rule" "ingress_tcp_873_to_873_for_mgmt-vpc-Vault-Mgmt-NAT_via_sg_ea976c1" {
  from_port                 = 873
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  to_port                   = 873
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_7100_to_7100_for_mgmt-vpc-Vault-Mgmt-NAT_via_sg_e8e6c86" {
  from_port                 = 7100
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V.id}"
  to_port                   = 7100
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-NAT_via_sg_43185c3" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Internet-Access.id}"
  to_port                   = 443
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NAT_via_sg_237afba" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  to_port                   = 123
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-NAT:
resource "aws_security_group_rule" "egress_tcp_873_to_873_for_mgmt-vpc-Vault-Mgmt-NAT_via_cidr_82c953c" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 873
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 873
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_7100_to_7100_for_mgmt-vpc-Vault-Mgmt-NAT_via_cidr_6480a93" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 7100
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 7100
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-NAT_via_cidr_5cded25" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 123
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-NAT_via_cidr_a6448b2" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Nessus" {
  description               = "Vault Management Nessus-webUI"
  name                      = "Vault-Mgmt-Nessus"
  tags {
    "Name" = "Mgmt-Nessus"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-Nessus:
resource "aws_security_group_rule" "ingress_tcp_8834_to_8834_for_mgmt-vpc-Vault-Mgmt-Nessus_via_sg_f20d439" {
  from_port                 = 8834
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  to_port                   = 8834
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-Nessus:
resource "aws_security_group_rule" "egress_tcp_0_to_65535_for_mgmt-vpc-Vault-Mgmt-Nessus_via_sg_ca40f8a" {
  from_port                 = 0
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 65535
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_0_to_65535_for_mgmt-vpc-Vault-Mgmt-Nessus_via_sg_ce33af7" {
  from_port                 = 0
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 65535
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_0_to_65535_for_mgmt-vpc-Vault-Mgmt-Nessus_via_sg_f0f6a95" {
  from_port                 = 0
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 65535
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Mgmt-OSSEC" {
  description               = "Security Group for OSSEC server"
  name                      = "Mgmt-OSSEC"
  tags {
    "Name" = "Mgmt-OSSEC"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Mgmt-OSSEC:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_mgmt-vpc-Mgmt-OSSEC_via_sg_3e8cd6c" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_1515_to_1515_for_mgmt-vpc-Mgmt-OSSEC_via_sg_1c886e5" {
  from_port                 = 1515
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 1515
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_1515_to_1515_for_mgmt-vpc-Mgmt-OSSEC_via_sg_63ea0cb" {
  from_port                 = 1515
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 1515
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_1515_to_1515_for_mgmt-vpc-Mgmt-OSSEC_via_sg_9a8956d" {
  from_port                 = 1515
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 1515
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_1514_to_1514_for_mgmt-vpc-Mgmt-OSSEC_via_sg_9333703" {
  from_port                 = 1514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 1514
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_1514_to_1514_for_mgmt-vpc-Mgmt-OSSEC_via_sg_3a16730" {
  from_port                 = 1514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 1514
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_1514_to_1514_for_mgmt-vpc-Mgmt-OSSEC_via_sg_8331ef2" {
  from_port                 = 1514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 1514
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Mgmt-OSSEC:
resource "aws_security_group_rule" "egress_udp_514_to_514_for_mgmt-vpc-Mgmt-OSSEC_via_sg_e957752" {
  from_port                 = 514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V.id}"
  to_port                   = 514
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Nagios" {
  description               = "Security Group for Nagios server"
  name                      = "Vault-Mgmt-Nagios"
  tags {
    "Name" = "Mgmt-Nagios"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-Nagios:
resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_e7f945c" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-Nagios:
resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_5c73625" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-db-sg}"
  to_port                   = 5432
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_42000_to_42000_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_37444f4" {
  from_port                 = 42000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-ui-sg}"
  to_port                   = 42000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_41000_to_41000_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_0c3f78a" {
  from_port                 = 41000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-api-sg}"
  to_port                   = 41000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_50000_to_50000_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_cddfa2b" {
  from_port                 = 50000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.iam-service-sg}"
  to_port                   = 50000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_41010_to_41010_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_c6eca4d" {
  from_port                 = 41010
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-batch-sg}"
  to_port                   = 41010
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40000_to_40000_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_fb6b082" {
  from_port                 = 40000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-gateway-sg}"
  to_port                   = 40000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_43000_to_43000_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_4b60a69" {
  from_port                 = 43000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-engine-sg}"
  to_port                   = 43000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_8b0241a" {
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 5666
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_fba4c28" {
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 5666
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_e515dd7" {
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 5666
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_40001_to_40001_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_6323e14" {
  from_port                 = 40001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-config-sg}"
  to_port                   = 40001
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_f544309" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.iam-web-sg}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_3219d9c" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-web-sg}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_icmp_8_to_-1_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_ea40938" {
  from_port                 = 8
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = -1
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_icmp_8_to_-1_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_3c1a410" {
  from_port                 = 8
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = -1
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_icmp_8_to_-1_for_mgmt-vpc-Vault-Mgmt-Nagios_via_sg_2b220b5" {
  from_port                 = 8
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = -1
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-LDAP" {
  description               = "Security Group for LDAP server"
  name                      = "Vault-Mgmt-LDAP"
  tags {
    "Name" = "Mgmt-LDAP"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-LDAP:
resource "aws_security_group_rule" "ingress_tcp_636_to_636_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_3c31d49" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 636
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_636_to_636_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_99ec341" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${var.cb-management-sg}"
  to_port                   = 636
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_636_to_636_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_e0641af" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 636
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_636_to_636_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_9b1e0ad" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 636
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_b3c5d23" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  to_port                   = 443
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_2049_to_2049_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_5faeb2b" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 2049
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_2049_to_2049_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_cf18b1f" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${var.cb-management-sg}"
  to_port                   = 2049
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_2049_to_2049_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_be95490" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 2049
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_2049_to_2049_for_mgmt-vpc-Vault-Mgmt-LDAP_via_sg_13d02c3" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 2049
  type                      = "ingress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-SFTP" {
  description               = "Security Group for access to SFTP"
  name                      = "Vault-Mgmt-SFTP"
  tags {
    "Name" = "Mgmt-SFTP"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-SFTP:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-SFTP_via_sg_72d79da" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-SFTP.id}"
  source_security_group_id  = "${var.vault-api-sg}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-SFTP_via_sg_c3bc051" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-SFTP.id}"
  source_security_group_id  = "${var.vault-batch-sg}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group" "mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM" {
  description               = "Enable USM Services Connectivity"
  name                      = "${terraform.env}-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM"
  tags {
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-staging-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM:
resource "aws_security_group_rule" "ingress_udp_12201_to_12201_for_mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM_via_sg_d7107d0" {
  from_port                 = 12201
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL.id}"
  to_port                   = 12201
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_udp_514_to_514_for_mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM_via_sg_91ad749" {
  from_port                 = 514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL.id}"
  to_port                   = 514
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-staging-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM_via_cidr_e7fba21" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.mgmt-vpc-mgmt-AlienVaultSensor-USMServicesSG-15A1R4D6BK6CM.id}"
  to_port                   = 0
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL" {
  description               = "Enable USM Connections"
  name                      = "${terraform.env}-mgmt-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL"
  tags {
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Outgoing rules for mgmt-vpc-staging-mgmt-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_mgmt-vpc-mgmt-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL_via_cidr_6f412fc" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.mgmt-vpc-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL.id}"
  to_port                   = 0
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Mgmt-VPN" {
  description               = "Security Group for VPN access"
  name                      = "Mgmt-VPN"
  tags {
    "Name" = "Mgmt-VPN"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Mgmt-VPN:
resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_mgmt-vpc-Mgmt-VPN_via_cidr_9124084" {
  # 103.205.28.155/32 - Jay
  # 113.29.245.69/32  - Sydney Office
  # 175.143.67.5/32   - KL Office
  # 13.54.14.102/32   - Denis
  cidr_blocks               = ["103.205.28.155/32", "113.29.245.69/32", "175.143.67.5/32", "13.54.14.102/32"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Mgmt-VPN:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_mgmt-vpc-Mgmt-VPN_via_sg_95c90db" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  to_port                   = 80
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_8834_to_8834_for_mgmt-vpc-Mgmt-VPN_via_sg_247398c" {
  from_port                 = 8834
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
  to_port                   = 8834
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5601_to_5601_for_mgmt-vpc-Mgmt-VPN_via_sg_8711e47" {
  from_port                 = 5601
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  to_port                   = 5601
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Mgmt-VPN_via_sg_5aa23ba" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Mgmt-VPN_via_sg_b90455b" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_mgmt-vpc-Mgmt-VPN" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${var.cb-postgres-sg}"
  to_port                   = 5432
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_mgmt-vpc-Mgmt-VPN_via_sg" {
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
  source_security_group_id  = "${var.cb-rabbitmq-sg}"
  to_port                   = 15672
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Repo" {
  description               = "vault management Repository"
  name                      = "Vault-Mgmt-Repo"
  tags {
    "Name" = "Mgmt-Repo"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-Repo:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_mgmt-vpc-Vault-Mgmt-Repo_via_sg_840a797" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  source_security_group_id  = "${var.vault-management-sg}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_mgmt-vpc-Vault-Mgmt-Repo_via_sg_04cc74c" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  source_security_group_id  = "${var.cb-management-sg}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_mgmt-vpc-Vault-Mgmt-Repo_via_sg_90431c6" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  source_security_group_id  = "${var.iam-management-sg}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_mgmt-vpc-Vault-Mgmt-Repo_via_sg_7be18db" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 80
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-Repo:
resource "aws_security_group_rule" "egress_tcp_873_to_873_for_mgmt-vpc-Vault-Mgmt-Repo_via_sg_b461e0b" {
  from_port                 = 873
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}"
  to_port                   = 873
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Management" {
  description               = "Security Group for managing management instances"
  name                      = "Vault-Mgmt-Management"
  tags {
    "Name" = "Mgmt-Management"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Incoming rules for mgmt-vpc-Vault-Mgmt-Management:
resource "aws_security_group_rule" "ingress_tcp_0_to_65535_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_84be416" {
  from_port                 = 0
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
  to_port                   = 65535
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_4735d32" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_4282912" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_74f1622" {
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  to_port                   = 5666
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_icmp_8_to_-1_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_216a3d6" {
  from_port                 = 8
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
  to_port                   = -1
  type                      = "ingress"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-Management:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_2887927" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
  to_port                   = 80
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_1515_to_1515_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_6536747" {
  from_port                 = 1515
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  to_port                   = 1515
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_1514_to_1514_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_d806ac5" {
  from_port                 = 1514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
  to_port                   = 1514
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_636_to_636_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_9788771" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  to_port                   = 636
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_123_to_123_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_66118ed" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
  to_port                   = 123
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-Management_via_cidr_4325b4c" {
  from_port                 = 443
  prefix_list_ids           = ["${var.prefix-list-id}"]
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_2049_to_2049_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_5e73866" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
  to_port                   = 2049
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_mgmt-vpc-Vault-Mgmt-Management_via_sg_ccbf37b" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}"
  source_security_group_id  = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
  to_port                   = 9200
  type                      = "egress"
}

resource "aws_security_group" "mgmt-vpc-Vault-Mgmt-Internet-Access" {
  description               = "Security Group for Internet access for management servers"
  name                      = "Vault-Mgmt-Internet-Access"
  tags {
    "Name" = "Mgmt-Internet-Access"
  }
  vpc_id = "${aws_vpc.mgmt-vpc.id}"
}

# Outgoing rules for mgmt-vpc-Vault-Mgmt-Internet-Access:
resource "aws_security_group_rule" "egress_tcp_443_to_443_for_mgmt-vpc-Vault-Mgmt-Internet-Access_via_cidr_0094e10" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Internet-Access.id}"
  to_port                   = 443
  type                      = "egress"
}
