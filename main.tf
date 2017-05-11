provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "juanAwsApp-key" {
  key_name   = "${var.name}-key"
  public_key = "${file(var.public_key)}"
}

module "network" {
  source = "modules/network"

  region   = "${var.region}"
  name     = "${var.name}"
  vpc_cidr = "${var.vpc_cidr}"
  azs      = "${var.azs}"
  subnets  = "${var.subnets}"
}

module "aws-instance" {
  source = "modules/compute"

  region            = "${var.region}"
  name              = "${var.name}"
  ami               = "${var.ami}"
  instance_type     = "${var.instance_type}"
  security_group_id = "${module.network.security_group_id}"
  subnet_ids        = "${var.subnets}"
  app_key_name      = "${aws_key_pair.juanAwsApp-key.key_name}"

  // vpc_id = "${module.network.vpc_id}"
}
