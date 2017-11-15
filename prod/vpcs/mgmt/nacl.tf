resource "aws_network_acl" "mgmt-PrivateNetworkAcl" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"
    subnet_ids = ["${aws_subnet.subnet-mgmt-private.id}"]

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 100
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.1.10/32"
    }

    ingress {
        from_port  = 123
        to_port    = 123
        rule_no    = 110
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.50.0.0/16"
    }

    ingress {
        from_port  = 123
        to_port    = 123
        rule_no    = 120
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.51.0.0/16"
    }

    ingress {
        from_port  = 123
        to_port    = 123
        rule_no    = 121
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.0.0/16"
    }

    ingress {
        from_port  = 123
        to_port    = 123
        rule_no    = 122
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.53.0.0/16"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 130
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.0.0/16"
    }

    ingress {
        from_port  = 636
        to_port    = 636
        rule_no    = 140
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    ingress {
        from_port  = 636
        to_port    = 636
        rule_no    = 141
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
    }

    ingress {
        from_port  = 636
        to_port    = 636
        rule_no    = 150
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.0.0/16"
    }

    ingress {
        from_port  = 636
        to_port    = 636
        rule_no    = 151
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.53.0.0/16"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 160
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 170
        action     = "allow"
        protocol   = "17"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 180
        action     = "allow"
        protocol   = "1"
        icmp_type  = "0"
        icmp_code  = "0"
        cidr_block = "10.51.0.0/16"
    }

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 185
        action     = "allow"
        protocol   = "1"
        icmp_type  = "0"
        icmp_code  = "0"
        cidr_block = "10.52.0.0/16"
    }

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 187
        action     = "allow"
        protocol   = "1"
        icmp_type  = "0"
        icmp_code  = "0"
        cidr_block = "10.53.0.0/16"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 200
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 210
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 220
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.0.0/16"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 230
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.53.0.0/16"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
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
        rule_no    = 120
        action     = "allow"
        protocol   = "17"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 125
        action     = "allow"
        protocol   = "17"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 150
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 0
        to_port    = 65535
        rule_no    = 155
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 160
        action     = "allow"
        protocol   = "1"
        icmp_type  = "8"
        icmp_code  = "-1"
        cidr_block = "10.51.0.0/16"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 165
        action     = "allow"
        protocol   = "1"
        icmp_type  = "8"
        icmp_code  = "-1"
        cidr_block = "10.52.0.0/16"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 166
        action     = "allow"
        protocol   = "1"
        icmp_type  = "8"
        icmp_code  = "-1"
        cidr_block = "10.53.0.0/16"
    }

    egress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 170
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
    }

    egress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 180
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.0.0/16"
    }

    egress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 185
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.53.0.0/16"
    }

    egress {
        from_port  = 873
        to_port    = 873
        rule_no    = 190
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 195
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 200
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 210
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.0.0/16"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 215
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.53.0.0/16"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 220
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.50.0.0/16"
    }

    tags {
        "Name" = "${terraform.env}-mgmt-PrivateNetworkAcl"
    }
}


resource "aws_network_acl" "mgmt-PublicNetworkACL" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"
    subnet_ids = ["${aws_subnet.subnet-mgmt-public.id}"]

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
        rule_no    = 115
        action     = "allow"
        protocol   = "6"
        cidr_block = "103.205.28.155/32" # Jay
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 117
        action     = "allow"
        protocol   = "6"
        cidr_block = "13.54.14.102/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 118
        action     = "allow"
        protocol   = "6"
        cidr_block = "192.228.146.220/32"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 120
        action     = "allow"
        protocol   = "6"
        cidr_block = "113.29.245.69/32"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 130
        action     = "allow"
        protocol   = "6"
        cidr_block = "175.143.67.5/32"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 135
        action     = "allow"
        protocol   = "6"
        cidr_block = "103.205.28.155/32" # Jay
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 137
        action     = "allow"
        protocol   = "6"
        cidr_block = "13.54.14.102/32"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 138
        action     = "allow"
        protocol   = "6"
        cidr_block = "58.166.81.161/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 139
        action     = "allow"
        protocol   = "6"
        cidr_block = "58.166.81.161/32"
    }

    ingress {
        from_port  = 80
        to_port    = 80
        rule_no    = 140
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.0/24"
    }

    ingress {
        from_port  = 443
        to_port    = 443
        rule_no    = 150
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.0/24"
    }

    ingress {
        from_port  = 123
        to_port    = 123
        rule_no    = 160
        action     = "allow"
        protocol   = "17"
        cidr_block = "10.52.10.0/24"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 180
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 190
        action     = "allow"
        protocol   = "17"
        cidr_block = "0.0.0.0/0"
    }

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 200
        action     = "allow"
        protocol   = "1"
        icmp_type  = "8"
        icmp_code  = "-1"
        cidr_block = "10.52.10.40/32"
    }

    ingress {
        from_port  = 600
        to_port    = 1023
        rule_no    = 220
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.100/32"
    }

    ingress {
        from_port  = 873
        to_port    = 873
        rule_no    = 230
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.150/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 240
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.217/32"
    }

    ingress {
        from_port  = 22
        to_port    = 22
        rule_no    = 245
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.10.56/32"
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
        cidr_block = "0.0.0.0/0"
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
        from_port  = 873
        to_port    = 873
        rule_no    = 230
        action     = "allow"
        protocol   = "6"
        cidr_block = "0.0.0.0/0"
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

    egress {
        from_port  = 1024
        to_port    = 65535
        rule_no    = 410
        action     = "allow"
        protocol   = "17"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 500
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.51.0.0/16"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 510
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.52.0.0/16"
    }

    egress {
        from_port  = 22
        to_port    = 22
        rule_no    = 520
        action     = "allow"
        protocol   = "6"
        cidr_block = "10.53.0.0/16"
    }

    tags {
        "Name" = "${terraform.env}-mgmt-PublicNetworkACL"
    }
}
