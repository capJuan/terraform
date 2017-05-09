#--------------------------------------------------------------
# ssh public key
#
#  please copy your public ssh key here from ~/.ssh/id_rsa.pub
#--------------------------------------------------------------
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEhT179T37V1IcbDB8iWIPfYbB1ljg5E20LY2EXujKWVIOQLpBgcqqEC9cZKTdhHg9wH65AfKPg17OLhGzIgc+p7sue7oqI7dnXtWlsy9VQ34VoK/IpvZGmQf4vG/80RBAi93IjcFVlHzjCcAVwvq3boEoCLeHoDA3tYToOlrjrpLYEehuyqNlTbMbDPbw1KfnRm3E6eDN6F4otP70JM+FwbrxazLfHV7eCXWBWRx01yoQcjttv/zSz4TnIPMriO8NsMglg9WLs6t1O0BywZU3r/sOTlBTLTzjmAmlQdJowivtzedYz3TSpqcW1wwYC862tbwB1yRYrE+YAjta2BQH juan.ortega-contreras@capgemini.com"


#--------------------------------------------------------------
# General
#--------------------------------------------------------------


name              = "juanAwsApp"
//artifact_type     = "amazon.image"
region            = "us-east-1"
//sub_domain        = "us-east-1.aws"
//atlas_environment = "aws-us-east-1-prod"
//atlas_aws_global  = "aws-global"
//atlas_token       = "REPLACE_IN_ATLAS"
//atlas_username    = "REPLACE_IN_ATLAS"
//site_public_key   = "REPLACE_IN_ATLAS"
//site_private_key  = "REPLACE_IN_ATLAS"
//site_ssl_cert     = "REPLACE_IN_ATLAS"
//site_ssl_key      = "REPLACE_IN_ATLAS"
//vault_ssl_cert    = "REPLACE_IN_ATLAS"
//vault_ssl_key     = "REPLACE_IN_ATLAS"
//vault_token       = "REPLACE_IN_ATLAS" # No need to update until Vault is configured

#--------------------------------------------------------------
# Network
#--------------------------------------------------------------

vpc_cidr        = "10.100.0.0/16"
azs             = "us-east-1a,us-east-1b" # AZs are region specific
//private_subnets = "10.139.1.0/24,10.139.2.0/24,10.139.3.0/24" # Creating one private subnet per AZ
subnets  = "10.100.10.0/24,10.100.20.0/24" # Creating one subnet per AZ
//
//# Bastion
//bastion_instance_type = "t2.micro"
//
//# NAT
//nat_instance_type = "t2.micro"
//
//# OpenVPN - https://docs.openvpn.net/how-to-tutorialsguides/virtual-platforms/amazon-ec2-appliance-ami-quick-start-guide/
//openvpn_instance_type = "t2.micro"
//openvpn_ami           = "ami-db5269b1"
//openvpn_user          = "openvpnas"
//openvpn_admin_user    = "vpnadmin"
//openvpn_admin_pw      = "sdEKxN2dwDK4FziU6QEKjUeegcC8ZfBYA3fzMgqXfocgQvWGRw"
//openvpn_cidr          = "172.27.139.0/24"
//

#--------------------------------------------------------------
# Compute
#--------------------------------------------------------------

ami                     = "ami-80861296"
instance_type           = "t2.micro"

//haproxy_node_count    = "1"
//haproxy_instance_type = "t2.micro"
//haproxy_artifact_name = "aws-us-east-1-ubuntu-haproxy"
//haproxy_artifacts     = "latest" # Comma separated list of artifact version numbers, list length must match node count
//
//nodejs_blue_node_count     = "2"
//nodejs_blue_instance_type  = "t2.micro"
//nodejs_blue_weight         = "100"
//nodejs_green_node_count    = "0"
//nodejs_green_instance_type = "t2.micro"
//nodejs_green_weight        = "0"
//nodejs_artifact_name       = "aws-us-east-1-ubuntu-nodejs"
//nodejs_artifacts           = "latest,latest" # Comma separated "blue,green" artifact version numbers, list length must be 2