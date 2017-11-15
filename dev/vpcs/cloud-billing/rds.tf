

####Rancher RDS instance
resource "aws_db_instance" "rancher_db" {
  allocated_storage       = 50
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.6.37"
  instance_class          = "db.t2.medium"
  identifier              = "${terraform.env}-cb-rancher-db"
  name                    = "cattle"
  username                = "rancher_user"
  password                = "r#nch3rpassw0rd"
  db_subnet_group_name    = "${aws_db_subnet_group.rancher_subnet_group.id}"
  vpc_security_group_ids  = [ "${aws_security_group.sg-rancher-db.id}" ]
  parameter_group_name    = "default.mysql5.6"
  multi_az                = true
  provider                = "aws.cloud-billing"
  count                   = "${lookup(var.rancher_count, terraform.env)}"
}

resource "aws_db_subnet_group" "rancher_subnet_group" {
  name                    = "${terraform.env}-cb-rancher-db"
  subnet_ids              = [ "${aws_subnet.subnet-cb-Subnet-Private-A1.id}", "${aws_subnet.subnet-cb-Subnet-Private-B1.id}" ]
  tags {
    Name                  = "${terraform.env}-rancher"
  }

  provider                = "aws.cloud-billing"
  count                   = "${lookup(var.rancher_count, terraform.env)}"
}
