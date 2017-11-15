resource "aws_internet_gateway" "mgmt-internetGateway" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"

    tags {
        "Name" = "${terraform.env}-mgmt-internetGateway"
    }
}
