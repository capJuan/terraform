# VPC
output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}

# Subnets
output "subnets_id" {
  value = "${module.subnets.subnets_id}"
}

# Security Group
output "security_group_id" {
  value = "${module.security_group.security_group_id}"
}
