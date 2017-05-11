#--------------------------------------------------------------
# This module creates the aws instance
#--------------------------------------------------------------
data "template_file" "ec2juan" {
  template = "${file("${path.module}/userdata/userdata.sh")}"

  vars = {
    GOAPP = "${file("${path.module}/userdata/goApp.go")}"
  }
}

resource "aws_instance" "ec2juan" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.app_key_name}"

  vpc_security_group_ids = [
    "${var.security_group_id}",
  ]

  tags {
    Name = "${var.name}-${element(split(",", var.subnet_ids), count.index)}"
  }

  subnet_id = "${element(split(",", var.subnet_ids), count.index)}"
  count     = "${length(split(",", var.subnet_ids))}"

  connection {
    user        = "ubuntu"
    private_key = "${file(var.public_key)}"
  }

  user_data = "${data.template_file.ec2juan.rendered}"
}
