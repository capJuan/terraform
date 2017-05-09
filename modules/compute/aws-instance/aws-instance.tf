#--------------------------------------------------------------
# This module creates the aws instance
#--------------------------------------------------------------

variable "name"               { default = "juanAwsApp" }
variable "ami"                {}
variable "instance_type"      {}
variable "security_group_id"  {}
variable "subnet_ids"         {}
variable "app_key_name"       {}

resource "aws_instance" "ec2juan" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.app_key_name}"

  vpc_security_group_ids = [
    "${var.security_group_id}"
  ]

  tags {
    Name = "${var.name}-${element(split(",", var.subnet_ids), count.index)}"
  }

  subnet_id = "${element(split(",", var.subnet_ids), count.index)}"
  count     = "${length(split(",", var.subnet_ids))}"

  connection {
    user        = "ubuntu"
    private_key = "${file("awsAppKey.pem")}"
  }

  provisioner "file" {
    source      = "goApp.sh"
    destination = "/tmp/goApp.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/goApp.sh",
      "sudo /tmp/goApp.sh & "
    ]
  }

}