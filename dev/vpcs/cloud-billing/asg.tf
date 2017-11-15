####rancher userdata template

data "template_file" "rancher_user_data" {
  template = "${file("vpcs/cloud-billing/templates/rancher-userdata.tpl")}"
  vars {
    admin_user              = "${var.root_user}"
    environment_prefix      = "${terraform.env}"
    app_name                = "rancher"
    group_name              = "${var.group_name}"
    db_host                 = "${aws_db_instance.rancher_db.address}"
  }

  count                     = "${lookup(var.rancher_count, terraform.env)}"
}

####Rancher Launch Config
resource "aws_launch_configuration" "rancher_lc" {
  name_prefix               = "${terraform.env}-rancher-lc"
  image_id                  = "${lookup(var.docker_ami, terraform.env)}"
  instance_type             = "${var.rancher_instance_size}"
  security_groups           = [ "${aws_security_group.sg-rancher.id}", "${aws_security_group.cb-management.id}" ]
  key_name                  = "${lookup(var.key, terraform.env)}"
  iam_instance_profile      = "${var.default_instance_profile}"
  user_data                 = "${data.template_file.rancher_user_data.rendered}"
  provider                  = "aws.cloud-billing"

  count                     = "${lookup(var.rancher_count, terraform.env)}"

}

####Rancher Auto Scaling Group
resource "aws_autoscaling_group" "rancher_asg" {
  name                      = "${terraform.env}-rancher-asg"
  launch_configuration      = "${aws_launch_configuration.rancher_lc.name}"
  load_balancers            = [ "${aws_elb.cb-internal-rancher.name}" ]
  vpc_zone_identifier       = [ "${aws_subnet.subnet-cb-Subnet-Private-A1.id}", "${aws_subnet.subnet-cb-Subnet-Private-B1.id}" ]
  min_size                  = 1
  max_size                  = 1
  tags                      = [
    {
      key                   = "Name"
      value                 = "${terraform.env}-rancher"
      propagate_at_launch   = true
    },
    {
      key                   = "GroupName"
      value                 = "${var.group_name}"
      propagate_at_launch   = true
    },
  ]
  provider                  = "aws.cloud-billing"

  count                     = "${lookup(var.rancher_count, terraform.env)}"
}


####kubernetes userdata template
data "template_file" "kube_user_data" {
  template                  = "${file("vpcs/cloud-billing/templates/kube-userdata.tpl")}"
  vars {
    admin_user              = "${var.root_user}"
    environment_prefix      = "${terraform.env}"
    app_name                = "kubernetes"
    group_name              = "${var.group_name}"
    rancher_url             = "${lookup(var.rancher_url, terraform.env)}"
  }

  count                     = "${lookup(var.rancher_count, terraform.env)}"
}

####Kubernetes Launch Config
resource "aws_launch_configuration" "kube_lc" {
  name_prefix               = "${terraform.env}-kubernetes-lc"
  image_id                  = "${lookup(var.docker_ami, terraform.env)}"
  instance_type             = "${var.kubernetes_instance_size}"
  security_groups           = [ "${aws_security_group.sg-kube.id}", "${aws_security_group.cb-management.id}" ]
  key_name                  = "${lookup(var.key, terraform.env)}"
  iam_instance_profile      = "${var.default_instance_profile}"
  user_data                 = "${data.template_file.kube_user_data.rendered}"
  provider                  = "aws.cloud-billing"

  count                     = "${lookup(var.rancher_count, terraform.env)}"

}

####Kubernetes Auto Scaling Group
resource "aws_autoscaling_group" "kube_asg" {
  name                      = "${terraform.env}-kubernetes-asg"
  launch_configuration      = "${aws_launch_configuration.kube_lc.name}"
  load_balancers            = [ "${aws_elb.cb-internal-kube.name}" ]
  vpc_zone_identifier       = [ "${aws_subnet.subnet-cb-Subnet-Private-A1.id}", "${aws_subnet.subnet-cb-Subnet-Private-B1.id}" ]
  min_size                  = 3
  max_size                  = 3
  tags = [
    {
      key                   = "Name"
      value                 = "${terraform.env}-kubernetes"
      propagate_at_launch   = true
    },
    {
      key                   = "GroupName"
      value                 = "${var.group_name}"
      propagate_at_launch   = true
    },
  ]
  provider                  = "aws.cloud-billing"

  count                     = "${lookup(var.rancher_count, terraform.env)}"
}
