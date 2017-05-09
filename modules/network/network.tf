#--------------------------------------------------------------
# This module creates all networking resources
#--------------------------------------------------------------

variable "name"            { }
variable "vpc_cidr"        { }
variable "azs"             { }
//variable "region"          { }
//variable "private_subnets" { }
variable "subnets"  { }
//variable "ssl_cert"        { }
//variable "ssl_key"         { }
//variable "key_name"        { }
//variable "private_key"     { }
//variable "sub_domain"      { }
//variable "route_zone_id"   { }
//
//variable "bastion_instance_type" { }
//variable "openvpn_instance_type" { }
//variable "openvpn_ami"           { }
//variable "openvpn_user"          { }
//variable "openvpn_admin_user"    { }
//variable "openvpn_admin_pw"      { }
//variable "openvpn_cidr"          { }


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
  source = "subnets"

  name   = "${var.name}-subnet"
  vpc_id = "${module.vpc.vpc_id}"
  cidrs  = "${var.subnets}"
  azs    = "${var.azs}"
}

#--------------------------------------------------------------
# loading  security group module
#--------------------------------------------------------------
module "security_group" {
  source = "security_group"

  name = "${var.name}-security_group"
  vpc_id = "${module.vpc.vpc_id}"
}

# VPC
output "vpc_id"   { value = "${module.vpc.vpc_id}" }
output "vpc_cidr" { value = "${module.vpc.vpc_cidr}" }

# Subnets
output "subnets_id"  { value = "${module.subnets.subnets_id}" }

# Security Group
output "security_group_id" { value = "${module.security_group.security_group_id}"}