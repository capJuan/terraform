#--------------------------------------------------------------
# This module creates all resources necessary for a VPC
#--------------------------------------------------------------
resource "aws_subnet" "subnet" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${element(split(",", var.cidrs), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  count             = "${length(split(",", var.cidrs))}"

  tags {
    Name = "${var.name}.${element(split(",", var.azs), count.index)}"
  }

  lifecycle {
    create_before_destroy = true
  }

  map_public_ip_on_launch = true
}
