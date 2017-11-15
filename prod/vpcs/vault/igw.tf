resource "aws_internet_gateway" "InternetGateway" {
    vpc_id = "${aws_vpc.vault-vpc.id}"

    tags {
        "Application" = "${terraform.env}-vault-vpc"
        "Name" = "${terraform.env}-InternetGateway"
        "Network" = "Public"
    }
}
