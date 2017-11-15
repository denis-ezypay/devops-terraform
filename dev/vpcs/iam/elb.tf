variable "account_id" {}



resource "aws_elb" "IAM-external-ezypay" {
    name                        = "${terraform.env}-IAM-external-ezypay"
    subnets                     = ["${data.aws_subnet_ids.public.ids}"]
    security_groups             = ["${aws_security_group.iam-vpc-IAM-ELB-External.id}"]
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
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:443"
        timeout             = 5
    }

    tags {
    }
}

resource "aws_elb" "IAM-internal-api01" {
    name                        = "${terraform.env}-IAM-internal-api01"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.iam-vpc-IAM-Service-ELB.id}"]
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
        instance_port      = 50000
        instance_protocol  = "tcp"
        lb_port            = 50000
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:50000"
        timeout             = 5
    }

    tags {
    }
}
