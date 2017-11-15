resource "aws_network_acl" "cb-PrivateNetworkAcl" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    subnet_ids = ["${data.aws_subnet_ids.private.ids}"]

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.1.10/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 110
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.10/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 120
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.56/32"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 200
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.1.20/32"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 210
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.50/32"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 220
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.50/32"
    }

    ingress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 300
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.100/32"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 310
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 320
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.0/24"
    }

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 400
        action     = "allow"
        protocol   = "1"
        icmp_type  = "-1"
        icmp_code  = "-1"
        cidr_block = "10.50.0.0/16"
    }

    ingress {
        from_port  = 25
        to_port    = 25
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 510
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.1.10/32"
    }

    egress {
        from_port  = 80
        to_port    = 80
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 443
        to_port    = 443
        rule_no    = 110
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 123
        to_port    = 123
        rule_no    = 200
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.200/32"
    }

    egress {
        from_port  = 636
        to_port    = 636
        rule_no    = 210
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.100/32"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 300
        action     = "allow"
        protocol   = "1"
        icmp_type  = "-1"
        icmp_code  = "-1"
        cidr_block = "10.50.0.0/16"
    }

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 400
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 25
        to_port    = 25
        rule_no    = 600
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 465
        to_port    = 465
        rule_no    = 610
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    tags {
        "Network" = "Private"
        "Application" = "${terraform.env}-vpc"
        "Name" = "${terraform.env}-PrivateNetworkAcl"
    }

    provider = "aws.cloud-billing"
}

resource "aws_network_acl" "cb-PublicNetworkAcl" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    subnet_ids = ["${data.aws_subnet_ids.public.ids}"]

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "113.29.245.69/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 110
        action     = "allow"
        protocol   = "6"
        cidr_block = "175.143.67.5/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 120
        action     = "allow"
        protocol   = "6"
        cidr_block = "103.205.28.155/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 130
        action     = "allow"
        protocol   = "6"
        cidr_block = "211.24.127.161/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 135
        action     = "allow"
        protocol   = "6"
        cidr_block = "13.54.14.102/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 136
        action     = "allow"
        protocol   = "6"
        cidr_block = "58.166.81.161/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 138
        action     = "allow"
        protocol   = "6"
        cidr_block = "122.106.186.199/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 140
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 150
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.10/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 160
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.56/32"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 200
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 210
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 300
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.100/32"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 310
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 320
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.0/24"
    }

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 400
        action     = "allow"
        protocol   = "1"
        icmp_type  = "-1"
        icmp_code  = "-1"
        cidr_block = "10.50.0.0/16"
    }

    ingress {
        from_port  = 25
        to_port    = 25
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 465
        to_port    = 465
        rule_no    = 510
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    egress {
        from_port  = 80
        to_port    = 80
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 443
        to_port    = 443
        rule_no    = 110
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 120
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    egress {
        from_port  = 123
        to_port    = 123
        rule_no    = 200
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.200/32"
    }

    egress {
        from_port  = 636
        to_port    = 636
        rule_no    = 210
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.100/32"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 300
        action     = "allow"
        protocol   = "1"
        icmp_type  = "-1"
        icmp_code  = "-1"
        cidr_block = "10.50.0.0/16"
    }

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 400
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 25
        to_port    = 25
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 465
        to_port    = 465
        rule_no    = 510
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    tags {
        "Application" = "${terraform.env}-vpc"
        "Network" = "Public"
        "Name" = "${terraform.env}-PublicNetworkAcl"
    }

    provider = "aws.cloud-billing"
}
