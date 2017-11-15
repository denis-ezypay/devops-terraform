resource "aws_network_acl" "Vault-PrivateNetworkAcl" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    subnet_ids = ["${data.aws_subnet_ids.private.ids}"]

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.10/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 110
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.217/32"
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
        icmp_type  = "8"
        icmp_code  = "-1"
        cidr_block = "10.52.10.40/32"
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
        from_port  = 1514
        to_port    = 1514
        rule_no    = 220
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.190/32"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 300
        action     = "allow"
        protocol   = "1"
        icmp_type  = "0"
        icmp_code  = "-1"
        cidr_block = "10.52.10.40/32"
    }

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 400
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    # Secure FTP - If production use external, otherwise use internal AWS instance
    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "${terraform.env == "sydney" ? "113.29.245.91/32" : "10.52.10.50/32"}"
    }

    tags {
        "Name" = "${terraform.env}-Vault-PrivateNetworkAcl"
        "Network" = "Private"
        "Application" = "${terraform.env}-vault-vpc"
    }
}

resource "aws_network_acl" "Vault-PublicNetworkAcl" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    subnet_ids = ["${data.aws_subnet_ids.public.ids}"]

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.10/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 110
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.217/32"
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
        icmp_type  = "8"
        icmp_code  = "-1"
        cidr_block = "10.52.10.0/24"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.10.63/32"
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
        from_port  = 1514
        to_port    = 1514
        rule_no    = 220
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.190/32"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 300
        action     = "allow"
        protocol   = "1"
        icmp_type  = "0"
        icmp_code  = "-1"
        cidr_block = "10.52.10.40/32"
    }

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 400
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    tags {
        "Name" = "${terraform.env}-Vault-PublicNetworkAcl"
        "Network" = "Public"
        "Application" = "${terraform.env}-vault-vpc"
    }
}

# Secure FTP for production only (staging uses internal private instance)
resource "aws_network_acl_rule" "Vault-PublicNetworkAcl-500" {
    network_acl_id = "${aws_network_acl.Vault-PublicNetworkAcl.id}"
    egress         = true
    from_port      = 22
    to_port        = 22
    rule_number    = 500
    rule_action    = "allow"
    protocol       = "tcp"
    cidr_block     = "113.29.245.91/32"
    count          = "${terraform.env == "sydney" ? 1 : 0}"
}
