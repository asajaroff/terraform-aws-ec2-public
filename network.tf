resource "aws_internet_gateway" "default" {
	vpc_id = "${aws_vpc.default.id}"
}

resource "aws_subnet" "public-subnet-az1" {
	vpc_id = "${aws_vpc.default.id}"
	map_public_ip_on_launch = true
	cidr_block = "${var.public_subnet_cidr}"
	availability_zone = "us-east-1a"
	tags          = "${merge(map(
		"Name", "${local.name}-public-subnet",
		), local.common_tags)}"
	}

resource "aws_route_table" "public" {
	vpc_id = "${aws_vpc.default.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.default.id}"
	}
	tags          = "${merge(map(
	"Name", "${local.name}-public-rt",
	), local.common_tags)}"
}
resource "aws_route_table_association" "public" {
	subnet_id = "${aws_subnet.public-subnet-az1.id}"
	route_table_id = "${aws_route_table.public.id}"
}