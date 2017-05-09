#--------------------------------------------------------------
# This module creates the security group
#--------------------------------------------------------------

variable "name"            { }
variable "vpc_id" {}

resource "aws_security_group" "web" {
  name = "${var.name}"
  description = "${var.name} firewall for the web server."
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8484
    to_port = 8484
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "security_group_id"   { value = "${aws_security_group.web.id}" }