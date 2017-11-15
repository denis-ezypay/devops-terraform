resource "aws_security_group" "iam-vpc-IAM-ELB-External" {
  description               = "Security Group for IAM External ELB"
  name                      = "IAM-ELB-External"
  tags {
    "Name" = "IAM-ELB-External"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-ELB-External:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_iam-vpc-IAM-ELB-External_via_cidr_d355cf3" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-ELB-External.id}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_iam-vpc-IAM-ELB-External_via_cidr_6618a84" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-ELB-External.id}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-ELB-External:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_iam-vpc-IAM-ELB-External_via_sg_159070a" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-ELB-External.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Web.id}"
  to_port                   = 80
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_iam-vpc-IAM-ELB-External_via_sg_9d77791" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-ELB-External.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Web.id}"
  to_port                   = 443
  type                      = "egress"
}



resource "aws_security_group" "iam-vpc-IAM-Service-ELB" {
  description               = "Security Group for IAM Service ELB"
  name                      = "IAM-Service-ELB"
  tags {
    "Name" = "IAM-Service-ELB"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Service-ELB:
resource "aws_security_group_rule" "ingress_tcp_50000_to_50000_for_iam-vpc-IAM-Service-ELB_via_sg_b08b281" {
  from_port                 = 50000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Service-ELB.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Web.id}"
  to_port                   = 50000
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-Service-ELB:
resource "aws_security_group_rule" "egress_tcp_50000_to_50000_for_iam-vpc-IAM-Service-ELB_via_sg_12218ce" {
  from_port                 = 50000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Service-ELB.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Service.id}"
  to_port                   = 50000
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-Redis" {
  description               = "Security Group for IAM Redis"
  name                      = "IAM-Redis"
  tags {
    "Name" = "IAM-Redis"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Redis:
resource "aws_security_group_rule" "ingress_tcp_6379_to_6379_for_iam-vpc-IAM-Redis_via_sg_26eea02" {
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Redis.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Service.id}"
  to_port                   = 6379
  type                      = "ingress"
}

resource "aws_security_group" "iam-vpc-IAM-Internet-Access" {
  description               = "Security Group for IAM VPC internet access"
  name                      = "IAM-Internet-Access"
  tags {
    "Name" = "IAM-Internet-Access"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Outgoing rules for iam-vpc-IAM-Internet-Access:
resource "aws_security_group_rule" "egress_tcp_443_to_443_for_iam-vpc-IAM-Internet-Access_via_cidr_483e4a6" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Internet-Access.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-Service" {
  description               = "Security Group for IAM Service server"
  name                      = "IAM-Service"
  tags {
    "Name" = "IAM-Service"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Service:
resource "aws_security_group_rule" "ingress_tcp_50000_to_50000_for_iam-vpc-IAM-Service_via_sg_8362b7f" {
  from_port                 = 50000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Service.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Service-ELB.id}"
  to_port                   = 50000
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-Service:
resource "aws_security_group_rule" "egress_tcp_6379_to_6379_for_iam-vpc-IAM-Service_via_sg_1b25e98" {
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Service.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Redis.id}"
  to_port                   = 6379
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_9042_to_9042_for_iam-vpc-IAM-Service_via_sg_a69ce35" {
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Service.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Cassandra.id}"
  to_port                   = 9042
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-Cassandra" {
  description               = "Security Group for IAM Cassandra server"
  name                      = "IAM-Cassandra "
  tags {
    "Name" = "IAM-Cassandra"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Cassandra:
resource "aws_security_group_rule" "ingress_tcp_7000_to_7000_for_iam-vpc-IAM-Cassandra_via_self_ba6f3c3" {
  from_port                 = 7000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Cassandra.id}"
  self                      = true
  to_port                   = 7000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_9042_to_9042_for_iam-vpc-IAM-Cassandra_via_self_b84589a" {
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Cassandra.id}"
  self                      = true
  to_port                   = 9042
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_9042_to_9042_for_iam-vpc-IAM-Cassandra_via_sg_851c4b6" {
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Cassandra.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Service.id}"
  to_port                   = 9042
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-Cassandra:
resource "aws_security_group_rule" "egress_tcp_7000_to_7000_for_iam-vpc-IAM-Cassandra_via_self_7face6f" {
  from_port                 = 7000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Cassandra.id}"
  self                      = true
  to_port                   = 7000
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_9042_to_9042_for_iam-vpc-IAM-Cassandra_via_self_d83be9c" {
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Cassandra.id}"
  self                      = true
  to_port                   = 9042
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-Shearwater" {
  description               = "IAM Shearwater"
  name                      = "IAM-Shearwater"
  tags {
    "Name" = "IAM-Shearwater"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Shearwater:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_iam-vpc-IAM-Shearwater_via_cidr_06954e2" {
  cidr_blocks               = ["121.127.199.220/32", "58.111.154.115/32", "113.29.245.69/32", "115.70.19.185/32", "120.151.211.162/32", "123.243.208.184/32", "220.245.9.150/32", "27.33.217.14/32", "27.33.217.56/29", "52.62.196.66/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Shearwater.id}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_3389_to_3389_for_iam-vpc-IAM-Shearwater_via_cidr_f6049f4" {
  cidr_blocks               = ["121.127.199.220/32", "58.111.154.115/32", "113.29.245.69/32", "115.70.19.185/32", "120.151.211.162/32", "123.243.208.184/32", "220.245.9.150/32", "27.33.217.14/32", "27.33.217.56/29", "52.62.196.66/32"]
  from_port                 = 3389
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Shearwater.id}"
  to_port                   = 3389
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-Shearwater:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_iam-vpc-IAM-Shearwater_via_cidr_5c555da" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Shearwater.id}"
  to_port                   = 0
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-Management" {
  description               = "Security Group for managing IAM instances"
  name                      = "IAM-Management"
  tags {
    "Name" = "IAM-Management"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Management:
resource "aws_security_group_rule" "ingress_tcp_0_to_65535_for_iam-vpc-IAM-Management_via_sg_ea7b02f" {
  from_port                 = 0
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-nessus-sg}"
  to_port                   = 65535
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_iam-vpc-IAM-Management_via_sg_54a038a" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-deploy-sg}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_iam-vpc-IAM-Management_via_sg_0185bc2" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-bastion-sg}"
  to_port                   = 22
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_50000_to_50000_for_iam-vpc-IAM-Management_via_sg_248c804" {
  from_port                 = 50000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 50000
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_iam-vpc-IAM-Management_via_sg_cd4a656" {
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 5666
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_icmp_8_to_-1_for_iam-vpc-IAM-Management_via_sg_49e33c2" {
  from_port                 = 8
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = -1
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-Management:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_iam-vpc-IAM-Management_via_sg_133f850" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-repo-sg}"
  to_port                   = 80
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_1515_to_1515_for_iam-vpc-IAM-Management_via_sg_29331c6" {
  from_port                 = 1515
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-ossec-sg}"
  to_port                   = 1515
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_1514_to_1514_for_iam-vpc-IAM-Management_via_sg_536f549" {
  from_port                 = 1514
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-ossec-sg}"
  to_port                   = 1514
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_636_to_636_for_iam-vpc-IAM-Management_via_sg_488a846" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 636
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_udp_123_to_123_for_iam-vpc-IAM-Management_via_sg_87e0449" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-ntp-sg}"
  to_port                   = 123
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_iam-vpc-IAM-Management_via_cidr_77d5b9c" {
  from_port                 = 443
  prefix_list_ids           = ["${var.prefix-list-id}"]
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_2049_to_2049_for_iam-vpc-IAM-Management_via_sg_c7e0ad2" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 2049
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_iam-vpc-IAM-Management_via_sg_0db6ade" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-kibana-sg}"
  to_port                   = 9200
  type                      = "egress"
}

resource "aws_security_group_rule" "egress_tcp_5044_to_5044_for_iam-vpc-IAM-Management_via_sg_0db6ade" {
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Management.id}"
  source_security_group_id  = "${var.mgmt-kibana-sg}"
  to_port                   = 5044
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-NAT" {
  description               = "Security Group for IAM NAT server"
  name                      = "IAM-NAT"
  tags {
    "Name" = "IAM-NAT"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-NAT:
resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_iam-vpc-IAM-NAT_via_sg_66e5613" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-NAT.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Internet-Access.id}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-NAT:
resource "aws_security_group_rule" "egress_tcp_443_to_443_for_iam-vpc-IAM-NAT_via_cidr_a4777fb" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-NAT.id}"
  to_port                   = 443
  type                      = "egress"
}

resource "aws_security_group" "iam-vpc-IAM-Web" {
  description               = "Security Group for IAM Web server"
  name                      = "IAM-Web"
  tags {
    "Name" = "IAM-Web"
  }
  vpc_id = "${aws_vpc.IAM-vpc.id}"
}

# Incoming rules for iam-vpc-IAM-Web:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_iam-vpc-IAM-Web_via_sg_a2910e8" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Web.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-ELB-External.id}"
  to_port                   = 80
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_iam-vpc-IAM-Web_via_sg_05c9841" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Web.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-ELB-External.id}"
  to_port                   = 443
  type                      = "ingress"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_iam-vpc-IAM-Web_via_sg_72d16c2" {
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Web.id}"
  source_security_group_id  = "${var.mgmt-nagios-sg}"
  to_port                   = 443
  type                      = "ingress"
}

# Outgoing rules for iam-vpc-IAM-Web:
resource "aws_security_group_rule" "egress_tcp_50000_to_50000_for_iam-vpc-IAM-Web_via_sg_1eb9fdf" {
  from_port                 = 50000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.iam-vpc-IAM-Web.id}"
  source_security_group_id  = "${aws_security_group.iam-vpc-IAM-Service-ELB.id}"
  to_port                   = 50000
  type                      = "egress"
}
