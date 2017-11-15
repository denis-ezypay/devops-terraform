resource "aws_security_group" "sg-service-instance-ports" {
  provider                  = "aws.cloud-billing"
  description               = "Security group to allow cross instance communication between services"
  name                      = "service-instance-ports"
  vpc_id = "${aws_vpc.cb-vpc.id}"
  provider = "aws.cloud-billing"
}

# Incoming rules for sg-service-instance-ports
resource "aws_security_group_rule" "sg-app-gateway-ingress-for-gateway-share1-admin" {
    from_port                = "30000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "30100"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-ingress-for-api1-and-api2" {
    from_port                = "31000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "31100"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-ingress-for-ui1" {
    from_port                = "32000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "32100"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-ingress-for-batch1" {
    from_port                = "33000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "33100"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-ingress-for-ui2" {
    from_port                = "34000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "34100"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
}

# Outgoing rules for sg-service-instance-ports
resource "aws_security_group_rule" "sg-app-gateway-egress-for-gateway-share1-admin" {
    from_port                = "30000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "30100"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-egress-for-api1-and-api2" {
    from_port                = "31000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "31100"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-egress-for-ui1" {
    from_port                = "32000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "32100"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-egress-for-batch1" {
    from_port                = "33000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "33100"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-egress-for-ui2" {
    from_port                = "34000"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-service-instance-ports.id}"
    source_security_group_id = "${aws_security_group.sg-service-instance-ports.id}"
    to_port                  = "34100"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group" "sg-app-gateway" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for App Gateway"
  name                      = "${terraform.env}-SG-AppGateway"
  vpc_id = "${aws_vpc.cb-vpc.id}"
  provider = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway" {
    cidr_blocks            = ["10.50.1.10/32"]
    from_port              = "22"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "22"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-1" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34001"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "34001"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-2" {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "5666"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "5666"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-3" {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "-1"
    protocol               = "icmp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "-1"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-4" {
    cidr_blocks            = ["0.0.0.0/0"]
    from_port              = "80"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "80"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-5" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "30000"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "30004"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-6" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "6379"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "6379"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-7" {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "5666"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "5666"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-8" {
    cidr_blocks            = ["0.0.0.0/0"]
    from_port              = "443"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "443"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-9" {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "-1"
    protocol               = "icmp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "-1"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-10" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34002"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "34004"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-11" {
    cidr_blocks            = ["10.50.10.100/32"]
    from_port              = "9200"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway.id}"
    to_port                = "9200"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group" "cb-UI" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for UI"
  name                      = "${terraform.env}-SG-UI"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-UI:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-UI_via_cidr_1083249" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-UI_via_cidr_70922d2" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_32001_to_32007_for_cb-UI_via_cidr_095ab83" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 32001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 32007
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-UI_via_cidr_170a0c9" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-UI:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-UI_via_cidr_24f07ca" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30001_to_30002_for_cb-UI_via_cidr_8998737" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 30002
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_cb-UI_via_cidr_941869f" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 5666
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-UI_via_cidr_58593d9" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-UI_via_cidr_ee8e822" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-UI_via_cidr_7fb93ab" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-UI.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Gateway" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Gateway"
  name                      = "${terraform.env}-SG-Gateway"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Gateway:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Gateway_via_cidr_0e2c855" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_30003_to_30003_for_cb-Gateway_via_cidr_0172b9e" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30003
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 30003
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-Gateway_via_cidr_b30f360" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-Gateway_via_cidr_201906d" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_30000_to_30000_for_cb-Gateway_via_cidr_e70463b" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 30000
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Gateway:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Gateway_via_cidr_548a52e" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_6379_to_6379_for_cb-Gateway_via_cidr_ef553b0" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 6379
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_33001_to_33005_for_cb-Gateway_via_cidr_0a7c53d" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 33001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 33005
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_cb-Gateway_via_cidr_9fdc957" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 5666
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Gateway_via_cidr_e1287d5" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30000_to_30003_for_cb-Gateway_via_cidr_b751365" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 30003
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Gateway_via_cidr_97d786e" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Gateway_via_cidr_e9a2874" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_31001_to_31013_for_cb-Gateway_via_cidr_e2ff541" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Gateway.id}"
  to_port                   = 31013
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Registry" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Registry"
  name                      = "${terraform.env}-SG-Registry"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Registry:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Registry_via_cidr_9a26a2b" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_30001_to_30002_for_cb-Registry_via_cidr_7b1d111" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = 30002
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Registry:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Registry_via_cidr_51b4142" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_cb-Registry_via_cidr_4a204b8" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = 5666
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Registry_via_cidr_b93b16e" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Registry_via_cidr_91b16be" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Registry_via_cidr_52125c5" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Registry.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-API02-elb" {
  provider                  = "aws.cloud-billing"
  description               = "securitygroup for api02 elb"
  name                      = "${terraform.env}-SG-API02-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-API02-elb:
resource "aws_security_group_rule" "ingress_tcp_31007_to_31007_for_cb-API02-elb_via_cidr_4c90b5a" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31007
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02-elb.id}"
  to_port                   = 31007
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_31008_to_31008_for_cb-API02-elb_via_cidr_8fb85f0" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31008
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02-elb.id}"
  to_port                   = 31008
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_31006_to_31006_for_cb-API02-elb_via_cidr_1261001" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31006
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02-elb.id}"
  to_port                   = 31006
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_31010_to_31010_for_cb-API02-elb_via_cidr_a7824a4" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31010
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02-elb.id}"
  to_port                   = 31010
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_31009_to_31009_for_cb-API02-elb_via_cidr_1555cb2" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31009
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02-elb.id}"
  to_port                   = 31009
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-API02-elb:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-API02-elb_via_cidr_dd1a91b" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-API02-elb.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-rabbitmq-elb" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for elb rabbitmq"
  name                      = "${terraform.env}-SG-rabbitmq-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-rabbitmq-elb:
resource "aws_security_group_rule" "ingress_tcp_5672_to_5672_for_cb-rabbitmq-elb_via_cidr_4c3ed0c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-rabbitmq-elb.id}"
  to_port                   = 5672
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_15672_to_15672_for_cb-rabbitmq-elb_via_cidr_f329b9f" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-rabbitmq-elb.id}"
  to_port                   = 15672
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-rabbitmq-elb:
resource "aws_security_group_rule" "egress_tcp_5672_to_5672_for_cb-rabbitmq-elb_via_cidr_79b64e6" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-rabbitmq-elb.id}"
  to_port                   = 5672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_cb-rabbitmq-elb_via_cidr_0bf2234" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-rabbitmq-elb.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-ui01-elb" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for elb ui"
  name                      = "${terraform.env}-SG-ui01-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-ui01-elb:
resource "aws_security_group_rule" "ingress_tcp_32001_to_32007_for_cb-ui01-elb_via_cidr_6b62e36" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 32001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-ui01-elb.id}"
  to_port                   = 32007
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-ui01-elb:
resource "aws_security_group_rule" "egress_tcp_32001_to_32007_for_cb-ui01-elb_via_cidr_ad4f387" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 32001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-ui01-elb.id}"
  to_port                   = 32007
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-nginx-elb" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for elb nginx"
  name                      = "${terraform.env}-SG-nginx-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-nginx-elb:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_cb-nginx-elb_via_cidr_bb19d03" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-nginx-elb.id}"
  to_port                   = 80
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_cb-nginx-elb_via_cidr_b5762c4" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-nginx-elb.id}"
  to_port                   = 443
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-nginx-elb:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-nginx-elb_via_cidr_39dc119" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-nginx-elb.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-nginx-elb_via_cidr_da6e59b" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-nginx-elb.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-gateway-elb" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for elb gateway"
  name                      = "${terraform.env}-SG-gateway-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-gateway-elb:
resource "aws_security_group_rule" "ingress_tcp_30003_to_30003_for_cb-gateway-elb_via_cidr_836a445" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30003
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-gateway-elb.id}"
  to_port                   = 30003
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_30000_to_30000_for_cb-gateway-elb_via_cidr_ca3212a" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-gateway-elb.id}"
  to_port                   = 30000
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-gateway-elb:
resource "aws_security_group_rule" "egress_tcp_30003_to_30003_for_cb-gateway-elb_via_cidr_147f0e9" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30003
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-gateway-elb.id}"
  to_port                   = 30003
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30000_to_30000_for_cb-gateway-elb_via_cidr_d28c089" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-gateway-elb.id}"
  to_port                   = 30000
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Postgres" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Postgres"
  name                      = "${terraform.env}-SG-Postgres"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Postgres:
resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_cb-Postgres_via_cidr_709889c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 5432
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_3000_to_3003_for_cb-Postgres_via_cidr_9b16398" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 3000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 3003
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Postgres_via_cidr_e19c0a6" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-Postgres_via_cidr_95cb8a2" {
  cidr_blocks               = ["10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5432_to_5432_for_cb-Postgres" {
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  source_security_group_id  = "${var.mgmt-vpn-sg}"
  to_port                   = 5432
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-Postgres_via_cidr_e2f0088" {
  cidr_blocks               = ["10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}


# Outgoing rules for staging-vpc-staging-SG-Postgres:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Postgres_via_cidr_1875968" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_cb-Postgres_via_cidr_c899a1a" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 5432
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Postgres_via_cidr_a76be07" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Postgres_via_cidr_da6ea92" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Postgres_via_cidr_9888d6a" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Postgres.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Cassandra" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Cassandra"
  name                      = "${terraform.env}-SG-Cassandra"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Cassandra:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Cassandra_via_cidr_dee3876" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-Cassandra_via_cidr_4b8a907" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_7000_to_7000_for_cb-Cassandra_via_cidr_4fac47e" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 7000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 7000
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-Cassandra_via_cidr_ae5ca36" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_15672_to_15672_for_cb-Cassandra_via_cidr_46220dc" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 15672
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_9042_to_9042_for_cb-Cassandra_via_cidr_e55cc34" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 9042
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Cassandra:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Cassandra_via_cidr_e2e37d2" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_cb-Cassandra_via_cidr_198c6df" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 5666
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_7000_to_7000_for_cb-Cassandra_via_cidr_be91b1d" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 7000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 7000
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Cassandra_via_cidr_e42c572" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Cassandra_via_cidr_7a00cdc" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Cassandra_via_cidr_57a70f7" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Cassandra.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Rabbit" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Rabbit"
  name                      = "${terraform.env}-SG-Rabbit"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Rabbit:
resource "aws_security_group_rule" "ingress_tcp_61613_to_61613_for_cb-Rabbit_via_cidr_4256ffe" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 61613
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 61613
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_45000_to_45000_for_cb-Rabbit_via_cidr_025ecfa" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 45000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 45000
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Rabbit_via_cidr_3aee6ed" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_4369_to_4369_for_cb-Rabbit_via_cidr_e6834e5" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 4369
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 4369
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5672_to_5672_for_cb-Rabbit_via_cidr_c632f46" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 5672
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-Rabbit_via_cidr_d5c3084" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-Rabbit_via_cidr_d308836" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_15672_to_15672_for_cb-Rabbit_via_cidr_cb55db8" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 15672
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_15672_to_15672_for_cb-Rabbit" {
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  source_security_group_id  = "${var.mgmt-vpn-sg}"
  to_port                   = 15672
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Rabbit:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Rabbit_via_cidr_8a2b12c" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_61613_to_61613_for_cb-Rabbit_via_cidr_e711dcc" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 61613
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 61613
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_45000_to_45000_for_cb-Rabbit_via_cidr_738efbd" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 45000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 45000
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_4369_to_4369_for_cb-Rabbit_via_cidr_026d5aa" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 4369
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 4369
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5672_to_5672_for_cb-Rabbit_via_cidr_ffae043" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 5672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_cb-Rabbit_via_cidr_b6fb300" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 5666
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Rabbit_via_cidr_0a0e221" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Rabbit_via_cidr_6721e5a" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_cb-Rabbit_via_cidr_215374c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Rabbit_via_cidr_0801068" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Rabbit.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Nagios" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Nagios"
  name                      = "${terraform.env}-SG-Nagios"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Nagios:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Nagios_via_cidr_388ceff" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5601_to_5601_for_cb-Nagios_via_cidr_b701c24" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5601
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 5601
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Nagios:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Nagios_via_cidr_f0a68b2" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_cb-Nagios_via_cidr_03abe1c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 5432
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_31001_to_31010_for_cb-Nagios_via_cidr_517383a" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 31010
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_33001_to_33005_for_cb-Nagios_via_cidr_4139abc" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 33001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 33005
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5666_to_5666_for_cb-Nagios_via_cidr_13a0018" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 5666
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_32001_to_32007_for_cb-Nagios_via_cidr_3c040d5" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 32001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 32007
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30000_to_30002_for_cb-Nagios_via_cidr_5f3a653" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 30002
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Nagios_via_cidr_2465429" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Nagios_via_cidr_278ccaf" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_cb-Nagios_via_cidr_9913f93" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nagios.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Kibana" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Kibana"
  name                      = "${terraform.env}-SG-Kibana"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Kibana:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Kibana_via_cidr_a53e934" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5601_to_5601_for_cb-Kibana_via_cidr_56fcfd0" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5601
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 5601
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_9200_to_9200_for_cb-Kibana_via_cidr_eac26d4" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 9200
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5044_to_5044_for_cb-Kibana_via_cidr_eac26d4" {
  source_security_group_id  = "${aws_security_group.cb-management.id}"
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 5044
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5601_to_5601_for_cb-Kibana_via_cidr_56fcfd1" {
  cidr_blocks               = ["10.52.1.50/32"]
  from_port                 = 5601
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 5601
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Kibana:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Kibana_via_cidr_7fb246f" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Kibana_via_cidr_1372161" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-API02" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for API02"
  name                      = "${terraform.env}-SG-API02"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-API02:
resource "aws_security_group_rule" "ingress_tcp_31006_to_31014_for_cb-API02_via_cidr_eee9123" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31006
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 31014
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-API02_via_cidr_4233ece" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-API02_via_cidr_066acc8" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-API02_via_cidr_90db04e" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-API02:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-API02_via_cidr_05252d1" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_31006_to_31014_for_cb-API02_via_cidr_17a0445" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31006
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 31014
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_31001_to_31005_for_cb-API02_via_cidr_b3b4fb8" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 31005
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_cb-API02_via_cidr_19e2325" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 5432
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30001_to_30002_for_cb-API02_via_cidr_4c63cd3" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 30002
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5672_to_5672_for_cb-API02_via_cidr_6b85eaa" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 5672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_7000_to_7000_for_cb-API02_via_cidr_4b49a9e" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 7000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 7000
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-API02_via_cidr_212d3d6" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_cb-API02_via_cidr_83f3797" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_61613_to_61613_for_cb-API02_via_cidr_b768d9c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 61613
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 61613
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_6379_to_6379_for_cb-API02_via_cidr_f2d538e" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 6379
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_25_to_25_for_cb-API02_via_cidr_50a5388" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 465
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 465
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_31012_to_31012_for_cb-API02_via_cidr_912c8b3" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31012
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 31012
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9300_to_9300_for_cb-API02_via_cidr_94274b4" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9300
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 9300
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-API02_via_cidr_6047944" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9042_to_9042_for_cb-API02_via_cidr_2094222" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API02.id}"
  to_port                   = 9042
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-API01" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for API01"
  name                      = "${terraform.env}-SG-API01"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-API01:
resource "aws_security_group_rule" "ingress_tcp_31001_to_31005_for_cb-API01_via_cidr_b4b1b38" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 31005
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-API01_via_cidr_e4944ac" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-API01_via_cidr_6ecb261" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-API01_via_cidr_6981ddf" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-API01:
resource "aws_security_group_rule" "egress_tcp_31006_to_31013_for_cb-API01_via_cidr_7c93ba4" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31006
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 31013
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-API01_via_cidr_7b9b01a" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_cb-API01_via_cidr_4668a95" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 5432
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_6379_to_6379_for_cb-API01_via_cidr_75d5e0c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 6379
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30001_to_30002_for_cb-API01_via_cidr_e941b69" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 30002
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5672_to_5672_for_cb-API01_via_cidr_de3ede2" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 5672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_33001_to_33005_for_cb-API01_via_cidr_3df6088" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 33001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 33005
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-API01_via_cidr_673b09d" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_cb-API01_via_cidr_cb1c0d8" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-API01_via_cidr_b3c3ddf" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9042_to_9042_for_cb-API01_via_cidr_3014ac9" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9042
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-API01.id}"
  to_port                   = 9042
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Batch" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Batch"
  name                      = "${terraform.env}-SG-Batch"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Batch:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Batch_via_cidr_3ab8b64" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_33001_to_33005_for_cb-Batch_via_cidr_8394e0e" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 33001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 33005
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-Batch_via_cidr_2a43bf5" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-Batch_via_cidr_1fe51ce" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Batch:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Batch_via_cidr_25fafbb" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_cb-Batch_via_cidr_67239ff" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 5432
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_6379_to_6379_for_cb-Batch_via_cidr_0a288b5" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 6379
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30001_to_30002_for_cb-Batch_via_cidr_a1917d1" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 30002
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5672_to_5672_for_cb-Batch_via_cidr_f111b7c" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 5672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_31001_to_31010_for_cb-Batch_via_cidr_10df7d7" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 31010
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Batch_via_cidr_323c851" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Batch_via_cidr_00f5930" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Batch_via_cidr_b173980" {
  cidr_blocks               = ["10.50.10.100/32"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_15672_to_15672_for_cb-Batch_via_cidr_b173981" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Batch.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-SG-api01-elb" {
  provider                  = "aws.cloud-billing"
  description               = "security group for api01 elb "
  name                      = "SG-api01-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-SG-api01-elb:
resource "aws_security_group_rule" "ingress_tcp_31001_to_31005_for_cb-SG-api01-elb_via_cidr_44db469" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 31001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-SG-api01-elb.id}"
  to_port                   = 31005
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-SG-api01-elb:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-SG-api01-elb_via_cidr_ef20b8d" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-SG-api01-elb.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-SG-gateway-elb" {
  provider                  = "aws.cloud-billing"
  description               = "elb security group"
  name                      = "SG-gateway-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-SG-gateway-elb:
resource "aws_security_group_rule" "ingress_tcp_30000_to_30000_for_cb-SG-gateway-elb_via_cidr_7e5c138" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-SG-gateway-elb.id}"
  to_port                   = 30000
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-SG-gateway-elb:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-SG-gateway-elb_via_cidr_3f1b439" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-SG-gateway-elb.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-postgREST" {
  provider                  = "aws.cloud-billing"
  description               = "for expose postgREST to regression test"
  name                      = "${terraform.env}-SG-postgREST"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-postgREST:
resource "aws_security_group_rule" "ingress_tcp_3000_to_3002_for_cb-postgREST_via_cidr_0f88d1b" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 3000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-postgREST.id}"
  to_port                   = 3002
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-postgREST_via_cidr_eec8243" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-postgREST.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-postgREST:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-postgREST_via_cidr_fa8b33e" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-postgREST.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-NAT" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for NAT"
  name                      = "${terraform.env}-SG-NAT"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-NAT:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_cb-NAT_via_cidr_2126abf" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 80
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-NAT_via_cidr_3d6dfbb" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_25_to_25_for_cb-NAT_via_cidr_ffc4e9b" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 25
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 25
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-NAT_via_cidr_f5c915a" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-NAT_via_cidr_75d71fd" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_cb-NAT_via_cidr_f0c659c" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 443
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-NAT:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-NAT_via_cidr_05febad" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_25_to_25_for_cb-NAT_via_cidr_214d65c" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 25
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 25
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-NAT_via_cidr_a89540f" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-NAT.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Nginx" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Nginx"
  name                      = "${terraform.env}-SG-Nginx"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Nginx:
resource "aws_security_group_rule" "cb-Nginx" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 80
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-1" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-2" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-3" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 443
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-4" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Nginx:
resource "aws_security_group_rule" "cb-Nginx-5" {
  # cidr_blocks               = ["0.0.0.0/0", "10.50.10.40/32"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  source_security_group_id  = "${var.mgmt-repo-sg}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-7" {
  cidr_blocks               = ["10.50.11.68/32"]
  from_port                 = 3000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 3002
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-8" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5601
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 5601
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-9" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 636
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-10" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 33100
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-11" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-12" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 15672
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 15672
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-13" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 2049
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-14" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "cb-Nginx-15" {
  from_port                 = 34001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Nginx.id}"
  source_security_group_id  = "${aws_security_group.sg-app-gateway-elb.id}"
  to_port                   = 34001
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Bastion" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Bastion"
  name                      = "${terraform.env}-SG-Bastion"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Bastion:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Bastion_via_cidr_5a37df4" {
  # 103.205.28.155/32 - Jay
  # 113.29.245.69/32  - Sydney Office
  # 175.143.67.5/32   - KL Office
  # 13.54.14.102/32   - Denis
  cidr_blocks               = ["103.205.28.155/32", "113.29.245.69/32", "175.143.67.5/32", "13.54.14.102/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Bastion:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Bastion_via_cidr_49b8c62" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5432_to_5432_for_cb-Bastion_via_cidr_5888863" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 5432
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 5432
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_22_to_22_for_cb-Bastion_via_cidr_9974e66" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 22
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Bastion_via_cidr_f2df4ed" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Rancher_via_cidr_f2df4ed" {
  from_port                 = 443
  protocol                  = "tcp"
  source_security_group_id  = "${aws_security_group.sg-rancher-elb.id}"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_30000_to_33100_for_cb-Bastion_via_cidr_11a0a79" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Bastion.id}"
  to_port                   = 33100
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-management" {
  provider                  = "aws.cloud-billing"
  description               = "Security Group for manging by mgmt vpc"
  name                      = "${terraform.env}-bill-management"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-bill-management:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-management_via_sg_7b9338b" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-bastion-sg}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-management_via_sg_2c851d6" {
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-deploy-sg}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-bill-management:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-management_via_sg_a608282" {
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-repo-sg}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_636_to_636_for_cb-management_via_sg_4f241fb" {
  from_port                 = 636
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 636
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_udp_123_to_123_for_cb-management_via_sg_f8a3e8e" {
  from_port                 = 123
  protocol                  = "udp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-ntp-sg}"
  to_port                   = 123
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-management_via_sg_b6b02ab" {
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-kibana-sg}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_2049_to_2049_for_cb-management_via_sg_20a36d1" {
  from_port                 = 2049
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${var.mgmt-ldap-sg}"
  to_port                   = 2049
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_5044_to_5044_for_cb-management_via_sg_20a36d2" {
  from_port                 = 5044
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-management.id}"
  source_security_group_id  = "${aws_security_group.cb-Kibana.id}"
  to_port                   = 5044
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP" {
  provider                  = "aws.cloud-billing"
  description               = "This security group was generated by AWS Marketplace and is based on recommended settings for CentOS 7 x86_64 - with Updates HVM version 1602 provided by Centos.org"
  name                      = "CentOS 7 (x86_64) - with Updates HVM-1602-AutogenByAWSMP-"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP_via_cidr_737942f" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP_via_cidr_ea232d2" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.vpc-CentOS-7--x86_64----with-Updates-HVM-1602-AutogenByAWSMP.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Redis" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Redis"
  name                      = "${terraform.env}-SG-Redis"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-Redis:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Redis_via_cidr_da96c33" {
  cidr_blocks               = ["10.50.1.10/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_6379_to_6379_for_cb-Redis_via_cidr_8f0fb04" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 6379
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = 6379
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_5666_to_5666_for_cb-Redis_via_cidr_2773b9e" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = 5666
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = 5666
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_icmp_-1_to_-1_for_cb-Redis_via_cidr_dcd67a3" {
  cidr_blocks               = ["10.50.1.40/32", "10.50.10.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = -1
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-Redis:
resource "aws_security_group_rule" "egress_tcp_80_to_80_for_cb-Redis_via_cidr_42fae92" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = 80
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_icmp_-1_to_-1_for_cb-Redis_via_cidr_f485e9a" {
  cidr_blocks               = ["10.50.1.40/32"]
  from_port                 = -1
  protocol                  = "icmp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = -1
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_443_to_443_for_cb-Redis_via_cidr_9fccc99" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = 443
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "egress_tcp_9200_to_9200_for_cb-Redis_via_cidr_6baed15" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 9200
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Redis.id}"
  to_port                   = 9200
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-Syd-Shearwater" {
  provider                  = "aws.cloud-billing"
  description               = "Syd Shearwater Security group"
  name                      = "Syd-Shearwater"
  tags {
    "Name" = "SYD-Shearwater"
  }
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-Syd-Shearwater:
resource "aws_security_group_rule" "ingress_tcp_22_to_22_for_cb-Syd-Shearwater_via_cidr_63d473b" {
  cidr_blocks               = ["113.29.245.69/32", "115.70.19.185/32", "120.151.211.162/32", "121.127.199.220/32", "123.243.208.184/32", "220.245.9.150/32", "27.33.217.14/32", "27.33.217.56/29", "52.62.196.66/32", "58.111.154.115/32"]
  from_port                 = 22
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Syd-Shearwater.id}"
  to_port                   = 22
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_3389_to_3389_for_cb-Syd-Shearwater_via_cidr_12457e5" {
  cidr_blocks               = ["113.29.245.69/32", "115.70.19.185/32", "120.151.211.162/32", "121.127.199.220/32", "123.243.208.184/32", "220.245.9.150/32", "27.33.217.14/32", "27.33.217.56/29", "52.62.196.66/32", "58.111.154.115/32"]
  from_port                 = 3389
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-Syd-Shearwater.id}"
  to_port                   = 3389
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-Syd-Shearwater:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-Syd-Shearwater_via_cidr_9e16e82" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-Syd-Shearwater.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-SG-external-elb" {
  provider                  = "aws.cloud-billing"
  description               = "quick-create-1 created on Tuesday, January 3, 2017 at 8:51:10 AM UTC+8"
  name                      = "SG-external-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-SG-external-elb:
resource "aws_security_group_rule" "ingress_tcp_80_to_80_for_cb-SG-external-elb_via_cidr_9e735a9" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 80
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-SG-external-elb.id}"
  to_port                   = 80
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_443_to_443_for_cb-SG-external-elb_via_cidr_38012d9" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 443
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-SG-external-elb.id}"
  to_port                   = 443
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-SG-external-elb:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-SG-external-elb_via_cidr_bc407da" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-SG-external-elb.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-config-elb" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for elb config"
  name                      = "${terraform.env}-SG-config-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-staging-SG-config-elb:
resource "aws_security_group_rule" "ingress_tcp_30001_to_30001_for_cb-config-elb_via_cidr_e4dc3d5" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 30001
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-config-elb.id}"
  to_port                   = 30001
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group_rule" "ingress_tcp_30002_to_30002_for_cb-config-elb_via_cidr_09c6ea3" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 30002
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-config-elb.id}"
  to_port                   = 30002
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-staging-SG-config-elb:
resource "aws_security_group_rule" "egress_-1_0_to_0_for_cb-config-elb_via_cidr_802e8d9" {
  cidr_blocks               = ["0.0.0.0/0"]
  from_port                 = 0
  protocol                  = "-1"
  security_group_id         = "${aws_security_group.cb-config-elb.id}"
  to_port                   = 0
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

resource "aws_security_group" "cb-SG-ui01-elb" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for elb gateway"
  name                      = "SG-ui01-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

# Incoming rules for staging-vpc-SG-ui01-elb:
resource "aws_security_group_rule" "ingress_tcp_30000_to_30000_for_cb-SG-ui01-elb_via_cidr_3fcacb6" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-SG-ui01-elb.id}"
  to_port                   = 30000
  type                      = "ingress"
  provider                  = "aws.cloud-billing"
}

# Outgoing rules for staging-vpc-SG-ui01-elb:
resource "aws_security_group_rule" "egress_tcp_30000_to_30000_for_cb-SG-ui01-elb_via_cidr_236afed" {
  cidr_blocks               = ["10.50.0.0/16"]
  from_port                 = 30000
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.cb-SG-ui01-elb.id}"
  to_port                   = 30000
  type                      = "egress"
  provider                  = "aws.cloud-billing"
}

# These were added with the incorrect names in production, to avoid a recreate we're manually remapping them
resource "aws_security_group" "sg-ui-services" {
  provider                  = "aws.cloud-billing"
  description               = "${terraform.env == "sydney" ? "staging-SG-UI Services" : "Security group for UI Services"}"
  name                      = "${terraform.env}-SG-UI Services"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

resource "aws_security_group_rule" "sg-ui-services" {
    cidr_blocks             = ["0.0.0.0/0"]
    from_port               = "80"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "80"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-1" {
    cidr_blocks             = ["10.50.0.0/16"]
    from_port               = "6379"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "6379"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-2" {
    cidr_blocks             = ["10.50.10.40/32"]
    from_port               = "5666"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "5666"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-3" {
    cidr_blocks             = ["10.50.0.0/16"]
    from_port               = "30000"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "30002"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-4" {
    cidr_blocks             = ["0.0.0.0/0"]
    from_port               = "443"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "443"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-5" {
    cidr_blocks             = ["10.50.10.40/32"]
    from_port               = "-1"
    protocol                = "icmp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "-1"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-6" {
    cidr_blocks             = ["10.50.10.100/32"]
    from_port               = "9200"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "9200"
    type                    = "egress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-7" {
    cidr_blocks             = ["10.50.1.10/32"]
    from_port               = "22"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "22"
    type                    = "ingress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-8" {
    cidr_blocks             = ["10.50.0.0/16"]
    from_port               = "34003"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "34003"
    type                    = "ingress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-9" {
    cidr_blocks             = ["10.50.10.40/32"]
    from_port               = "5666"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "5666"
    type                    = "ingress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-10" {
    cidr_blocks             = ["10.50.10.40/32"]
    from_port               = "-1"
    protocol                = "icmp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "-1"
    type                    = "ingress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-11" {
    cidr_blocks             = ["10.50.0.0/16"]
    from_port               = "34002"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "34002"
    type                    = "ingress"
    provider                = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-12" {
    cidr_blocks             = ["10.50.0.0/16"]
    from_port               = "34004"
    protocol                = "tcp"
    security_group_id       = "${aws_security_group.sg-ui-services.id}"
    to_port                 = "34004"
    type                    = "ingress"
    provider                = "aws.cloud-billing"
}

# These were added with the incorrect names in production, to avoid a recreate we're manually remapping them
resource "aws_security_group" "sg-ui-services-elb" {
  provider                  = "aws.cloud-billing"
  description               = "${terraform.env == "sydney" ? "staging-SG-UI Services-elb" : "Security group for UI Services ELB"}"
  name                      = "${terraform.env}-SG-UI Services-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

resource "aws_security_group_rule" "sg-ui-services-elb" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34003"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-ui-services-elb.id}"
    to_port                = "34003"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-elb-1" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34002"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-ui-services-elb.id}"
    to_port                = "34002"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-ui-services-elb-2" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34004"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-ui-services-elb.id}"
    to_port                = "34004"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

# These were added with the incorrect names in production, to avoid a recreate we're manually remapping them
resource "aws_security_group" "sg-app-gateway-elb" {
  provider                  = "aws.cloud-billing"
  description               = "${terraform.env == "sydney" ? "staging-SG-AppGateway-elb" : "Security group for App Gateway ELB"}"
  name                      = "${terraform.env}-SG-AppGateway-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

resource "aws_security_group_rule" "sg-app-gateway-elb" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34001"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway-elb.id}"
    to_port                = "34001"
    type                   = "ingress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-app-gateway-elb-1" {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "34001"
    protocol               = "tcp"
    security_group_id      = "${aws_security_group.sg-app-gateway-elb.id}"
    to_port                = "34001"
    type                   = "egress"
    provider               = "aws.cloud-billing"
}

resource "aws_security_group" "sg-admin" {
  provider                  = "aws.cloud-billing"
  description               = "Security group for Spring Boot Admin"
  name                      = "${terraform.env}-SG-Admin"
  vpc_id = "${aws_vpc.cb-vpc.id}"

  ingress {
    cidr_blocks            = ["10.50.1.10/32"]
    from_port              = "22"
    protocol               = "tcp"
    to_port                = "22"
  }

  ingress {
    security_groups        = ["${aws_security_group.sg-admin-elb.id}"]
    from_port              = "30003"
    protocol               = "tcp"
    to_port                = "30003"
  }

  ingress {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "5666"
    protocol               = "tcp"
    to_port                = "5666"
  }

  ingress {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "-1"
    protocol               = "icmp"
    to_port                = "-1"
  }

  egress {
    cidr_blocks            = ["0.0.0.0/0"]
    from_port              = "443"
    protocol               = "tcp"
    to_port                = "443"
  }

  egress {
    security_groups        = ["${aws_security_group.cb-config-elb.id}"]
    from_port              = "30001"
    protocol               = "tcp"
    to_port                = "30002"
  }
}

resource "aws_security_group" "sg-admin-elb" {
  provider                  = "aws.cloud-billing"
  description               = "${terraform.env == "sydney" || terraform.env == "staging" ? "Security group for elb admin" : "Security group for Spring Boot Admin"}"
  name                      = "${terraform.env}-SG-admin-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

resource "aws_security_group_rule" "sg-admin-elb" {
    from_port                = "443"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-admin-elb.id}"
    source_security_group_id = "${var.mgmt-vpn-sg}"
    to_port                  = "443"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group_rule" "sg-admin-elb-1" {
    from_port                = "30003"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-admin-elb.id}"
    source_security_group_id = "${aws_security_group.sg-admin.id}"
    to_port                  = "30003"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
}

resource "aws_security_group" "sg-rancher" {
  provider                  = "aws.cloud-billing"
  count                     = "${lookup(var.rancher_count, terraform.env)}"
  description               = "Security group for Rancher"
  name                      = "${terraform.env}-SG-Rancher"
  vpc_id                    = "${aws_vpc.cb-vpc.id}"

  ingress {
    cidr_blocks            = ["10.50.1.10/32"]
    from_port              = "22"
    protocol               = "tcp"
    to_port                = "22"
  }

  ingress {
    security_groups        = ["${aws_security_group.sg-rancher-elb.id}"]
    from_port              = "8080"
    protocol               = "tcp"
    to_port                = "8080"
  }

  ingress {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "5666"
    protocol               = "tcp"
    to_port                = "5666"
  }

  ingress {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "-1"
    protocol               = "icmp"
    to_port                = "-1"
  }

  egress {
    cidr_blocks            = ["0.0.0.0/0"]
    from_port              = "0"
    protocol               = "-1"
    to_port                = "0"
  }
}

resource "aws_security_group" "sg-rancher-elb" {
  provider                  = "aws.cloud-billing"
  count                     = "${lookup(var.rancher_count, terraform.env)}"
  description               = "Security group for Rancher"
  name                      = "${terraform.env}-sg-rancher-elb"
  vpc_id                    = "${aws_vpc.cb-vpc.id}"
}

resource "aws_security_group_rule" "sg-rancher-elb" {
    from_port                = "443"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-rancher-elb.id}"
    source_security_group_id = "${var.mgmt-vpn-sg}"
    to_port                  = "443"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
    count                    = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_security_group_rule" "sg-rancher-elb-1" {
    from_port                = "443"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-rancher-elb.id}"
    cidr_blocks              = ["10.50.0.0/16"]
    to_port                  = "443"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
    count                    = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_security_group_rule" "sg-rancher-elb-2" {
    from_port                = "8080"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-rancher-elb.id}"
    source_security_group_id = "${aws_security_group.sg-rancher.id}"
    to_port                  = "8080"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
    count                    = "${lookup(var.rancher_count, terraform.env)}"
}


resource "aws_security_group" "sg-kube" {
  provider                  = "aws.cloud-billing"
  count                     = "${lookup(var.rancher_count, terraform.env)}"
  description               = "Security group for Kubernetes"
  name                      = "${terraform.env}-SG-Kubernetes"
  vpc_id = "${aws_vpc.cb-vpc.id}"

  ingress {
    cidr_blocks            = ["10.50.1.10/32"]
    from_port              = "22"
    protocol               = "tcp"
    to_port                = "22"
  }

  ingress {
    self                   = true
    from_port              = "0"
    protocol               = "-1"
    to_port                = "0"
  }

  ingress {
    security_groups        = ["${aws_security_group.sg-kube-elb.id}"]
    from_port              = "443"
    protocol               = "tcp"
    to_port                = "443"
  }

  ingress {
    security_groups        = ["${aws_security_group.sg-kube-elb.id}"]
    from_port              = "30000"
    protocol               = "tcp"
    to_port                = "32767"
  }

  ingress {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "5666"
    protocol               = "tcp"
    to_port                = "5666"
  }

  ingress {
    cidr_blocks            = ["10.50.10.40/32"]
    from_port              = "-1"
    protocol               = "icmp"
    to_port                = "-1"
  }

  ingress {
    cidr_blocks            = ["10.50.0.0/16"]
    from_port              = "10250"
    protocol               = "tcp"
    to_port                = "10255"
  }

  egress {
    cidr_blocks            = ["0.0.0.0/0"]
    from_port              = "0"
    protocol               = "-1"
    to_port                = "0"
  }
}

resource "aws_security_group" "sg-kube-elb" {
  provider                  = "aws.cloud-billing"
  count                     = "${lookup(var.rancher_count, terraform.env)}"
  description               = "Security group for Kubernetes"
  name                      = "${terraform.env}-sg-kubernetes-elb"
  vpc_id = "${aws_vpc.cb-vpc.id}"
}

resource "aws_security_group_rule" "sg-kube-elb" {
    from_port                = "443"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-kube-elb.id}"
    cidr_blocks              = ["10.50.0.0/16"]
    to_port                  = "443"
    type                     = "ingress"
    provider                 = "aws.cloud-billing"
    count                    = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_security_group_rule" "sg-kube-elb-1" {
    from_port                = "443"
    protocol                 = "tcp"
    security_group_id        = "${aws_security_group.sg-kube-elb.id}"
    source_security_group_id = "${aws_security_group.sg-kube.id}"
    to_port                  = "443"
    type                     = "egress"
    provider                 = "aws.cloud-billing"
    count                    = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_security_group" "sg-rancher-db" {
  provider                  = "aws.cloud-billing"
  count                     = "${lookup(var.rancher_count, terraform.env)}"
  description               = "Security group for rancher db"
  name                      = "${terraform.env}-sg-rancher-db"
  vpc_id                    = "${aws_vpc.cb-vpc.id}"

  ingress {
    security_groups        = ["${aws_security_group.sg-rancher.id}"]
    from_port              = "3306"
    protocol               = "tcp"
    to_port                = "3306"
  }
}
