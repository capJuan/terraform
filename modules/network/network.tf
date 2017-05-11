#--------------------------------------------------------------
# This module creates all networking resources
#--------------------------------------------------------------

#--------------------------------------------------------------
# Loading vpc module
#--------------------------------------------------------------
module "vpc" {
  source = "./vpc"

  name = "${var.name}-vpc"
  cidr = "${var.vpc_cidr}"
}

#--------------------------------------------------------------
# loading  subnets module
#--------------------------------------------------------------
module "subnets" {
  source = "./subnets"

  name   = "${var.name}-subnet"
  vpc_id = "${module.vpc.vpc_id}"
  cidrs  = "${var.subnets}"
  azs    = "${var.azs}"
}

#--------------------------------------------------------------
# loading  security group module
#--------------------------------------------------------------
module "security_group" {
  source = "./security_group"

  region = "${var.region}"
  name   = "${var.name}-security_group"
  vpc_id = "${module.vpc.vpc_id}"
}
