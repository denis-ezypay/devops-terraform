variable "account_id" {}

resource "aws_elb" "cb-external-ezypay" {
    name                        = "${terraform.env}-external-ezypay"
    subnets                     = ["${aws_subnet.subnet-cb-Subnet-Public-A1.id}"]
    security_groups             = ["${aws_security_group.cb-SG-external-elb.id}"]
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

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-gateway" {
    name                        = "${terraform.env}-internal-gateway"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.cb-gateway-elb.id}"]
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
        instance_port      = 30000
        instance_protocol  = "tcp"
        lb_port            = 30000
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 30003
        instance_protocol  = "tcp"
        lb_port            = 30003
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:30000"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-api01" {
    name                        = "${terraform.env}-internal-api01"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.cb-SG-api01-elb.id}"]
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
        instance_port      = 31001
        instance_protocol  = "tcp"
        lb_port            = 31001
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31002
        instance_protocol  = "tcp"
        lb_port            = 31002
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31003
        instance_protocol  = "tcp"
        lb_port            = 31003
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31004
        instance_protocol  = "tcp"
        lb_port            = 31004
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31005
        instance_protocol  = "tcp"
        lb_port            = 31005
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:31001"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-rabbitmq" {
    name                        = "${terraform.env}-internal-rabbitmq"
    subnets                     = ["${data.aws_subnet_ids.private-2.ids}"]
    security_groups             = ["${aws_security_group.cb-rabbitmq-elb.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 60
    internal                    = true

    access_logs {
        bucket        = "${var.logging-bucket}"
        bucket_prefix = ""
        interval      = 60
    }

    listener {
        instance_port      = 5672
        instance_protocol  = "tcp"
        lb_port            = 5672
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 61613
        instance_protocol  = "tcp"
        lb_port            = 61613
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 15672
        instance_protocol  = "tcp"
        lb_port            = 15672
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:5672"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-admin" {
    name                        = "${terraform.env}-internal-admin"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.sg-admin-elb.id}"]
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
        instance_port      = 30003
        instance_protocol  = "tcp"
        lb_port            = 30003
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 30003
        instance_protocol  = "http"
        lb_port            = 443
        lb_protocol        = "https"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:30003"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-app-gateway" {
    name                        = "${terraform.env}-internal-app-gateway"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.sg-app-gateway-elb.id}"]
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
        instance_port      = 34001
        instance_protocol  = "tcp"
        lb_port            = 34001
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }


    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:34001"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-ui02" {
    name                        = "${terraform.env}-internal-ui02"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.sg-ui-services-elb.id}"]
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
        instance_port      = 34002
        instance_protocol  = "tcp"
        lb_port            = 34002
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 34003
        instance_protocol  = "tcp"
        lb_port            = 34003
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }


    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:34002"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-ui01" {
    name                        = "${terraform.env}-internal-ui01"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.cb-ui01-elb.id}"]
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
        instance_port      = 32001
        instance_protocol  = "tcp"
        lb_port            = 32001
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 32004
        instance_protocol  = "tcp"
        lb_port            = 32004
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 32007
        instance_protocol  = "tcp"
        lb_port            = 32007
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:32004"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-config" {
    name                        = "${terraform.env}-internal-config"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.cb-config-elb.id}"]
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
        instance_port      = 30001
        instance_protocol  = "tcp"
        lb_port            = 30001
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 30002
        instance_protocol  = "tcp"
        lb_port            = 30002
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 10
        target              = "TCP:30002"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-api02" {
    name                        = "${terraform.env}-internal-api02"
    subnets                     = ["${data.aws_subnet_ids.private-1.ids}"]
    security_groups             = ["${aws_security_group.cb-API02-elb.id}"]
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
        instance_port      = 31007
        instance_protocol  = "tcp"
        lb_port            = 31007
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31008
        instance_protocol  = "tcp"
        lb_port            = 31008
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31009
        instance_protocol  = "tcp"
        lb_port            = 31009
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31010
        instance_protocol  = "tcp"
        lb_port            = 31010
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 31006
        instance_protocol  = "tcp"
        lb_port            = 31006
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        interval            = 30
        target              = "TCP:31007"
        timeout             = 5
    }

    tags {
    }

    provider = "aws.cloud-billing"
}

resource "aws_elb" "cb-internal-rancher" {
    name                        = "${terraform.env}-internal-rancher"
    subnets                     = ["${aws_subnet.subnet-cb-Subnet-Private-B1.id}", "${aws_subnet.subnet-cb-Subnet-Private-A1.id}" ]
    security_groups             = ["${aws_security_group.sg-rancher-elb.id}"]
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
        instance_port      = 8080
        instance_protocol  = "tcp"
        lb_port            = 8080
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    listener {
        instance_port      = 8080
        instance_protocol  = "tcp"
        lb_port            = 443
        lb_protocol        = "ssl"
        ssl_certificate_id = "arn:aws:iam::${var.account_id}:server-certificate/${lookup(var.ssl-certificate-names, terraform.env)}"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 30
        target              = "HTTP:8080/ping"
        timeout             = 5
    }

    tags {
    }

    provider                    = "aws.cloud-billing"
    count                       = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_proxy_protocol_policy" "rancher-websockets" {
  load_balancer               = "${aws_elb.cb-internal-rancher.name}"
  instance_ports              = ["8080"]

  count                       = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_elb" "cb-internal-kube" {
    name                        = "${terraform.env}-internal-kube"
    subnets                     = ["${aws_subnet.subnet-cb-Subnet-Private-B1.id}", "${aws_subnet.subnet-cb-Subnet-Private-A1.id}" ]
    security_groups             = ["${aws_security_group.sg-kube-elb.id}"]
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
        instance_port      = 443
        instance_protocol  = "tcp"
        lb_port            = 443
        lb_protocol        = "tcp"
        ssl_certificate_id = ""
    }

    tags {
    }

    provider                    = "aws.cloud-billing"
    count                       = "${lookup(var.rancher_count, terraform.env)}"
}
