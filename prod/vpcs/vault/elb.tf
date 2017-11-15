variable "account_id" {}

resource "aws_elb" "vault-external-ezypay" {
    name                        = "${terraform.env}-vault-external-ezypay"
    subnets                     = ["${data.aws_subnet_ids.public.ids}"]
    security_groups             = ["${aws_security_group.vault-vpc-Vault-ELB-External.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = false

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 443
        instance_protocol  = "https"
        lb_port            = 443
        lb_protocol        = "https"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    listener {
        instance_port      = 80
        instance_protocol  = "http"
        lb_port            = 80
        lb_protocol        = "http"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 10
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:443"
        timeout             = 5
    }

    tags {
    }
}

resource "aws_elb" "vault-internal-gateway" {
    name                        = "${terraform.env}-vault-internal-gateway"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.vault-vpc-Vault-Gateway-ELB.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = true

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 40000
        instance_protocol  = "https"
        lb_port            = 40000
        lb_protocol        = "https"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 10
        target              = "TCP:40000"
        timeout             = 5
    }

    tags {
    }
}

resource "aws_elb" "vault-internal-ui01" {
    name                        = "${terraform.env}-vault-internal-ui01"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.vault-vpc-Vault-UI-ELB.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = true

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 42000
        instance_protocol  = "tcp"
        lb_port            = 42000
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 10
        target              = "TCP:42000"
        timeout             = 5
    }

    tags {
    }
}

resource "aws_elb" "vault-internal-api01" {
    name                        = "${terraform.env}-vault-internal-api01"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.vault-vpc-Vault-API-ELB.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = true

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 41000
        instance_protocol  = "https"
        lb_port            = 41000
        lb_protocol        = "https"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 10
        target              = "TCP:41000"
        timeout             = 5
    }

    tags {
    }
}

resource "aws_elb" "vault-internal-engine" {
    name                        = "${terraform.env}-vault-internal-engine"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.vault-vpc-Vault-Engine-ELB.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = true

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 43000
        instance_protocol  = "https"
        lb_port            = 43000
        lb_protocol        = "https"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "HTTPS:43000/v1/sys/seal-status"
        timeout             = 5
    }

    tags {
    }
}

resource "aws_elb" "vault-internal-config" {
    name                        = "${terraform.env}-vault-internal-config"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.vault-vpc-Vault-Config-ELB.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = true

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 40001
        instance_protocol  = "https"
        lb_port            = 40001
        lb_protocol        = "https"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:40001"
        timeout             = 5
    }

    tags {
    }
}


