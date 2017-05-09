variable "name"              { }
variable "region"            { }
variable "public_key"    { }

variable "vpc_cidr"        { }
variable "azs"             { }
variable "subnets"  { }

variable "ami" {}
variable "instance_type" {}


provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "juanAwsApp-key" {
  key_name   = "${var.name}-key"
  public_key = "${var.public_key}"
}

module "network" {
  source = "../../../modules/network"

  name            = "${var.name}"
  vpc_cidr        = "${var.vpc_cidr}"
  azs             = "${var.azs}"
  subnets  = "${var.subnets}"
}

module "aws-instance" {
  source = "../../../modules/compute/aws-instance"

  name = "${var.name}"
  ami  = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_group_id = "${module.network.security_group_id}"
  subnet_ids = "${module.network.subnets_id}"
  app_key_name = "${aws_key_pair.juanAwsApp-key.key_name}"
  // vpc_id = "${module.network.vpc_id}"
}
