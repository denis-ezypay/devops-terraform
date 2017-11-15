resource "aws_internet_gateway" "IAM-InternetGateway" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"

    tags {
        "Name" = "${terraform.env}-IAM-InternetGateway"
    }
}
