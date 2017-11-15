resource "aws_internet_gateway" "cb-InternetGateway" {
    vpc_id = "${aws_vpc.cb-vpc.id}"

    tags {
        "Network" = "Public"
        "Name" = "${terraform.env}-cb-InternetGateway"
        "Application" = "${terraform.env}-vpc"
    }

    provider = "aws.cloud-billing"
}
