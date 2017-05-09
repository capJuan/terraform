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
region            = "us-east-1"


#--------------------------------------------------------------
# Network
#--------------------------------------------------------------

vpc_cidr        = "10.100.0.0/16"
azs             = "us-east-1a,us-east-1b" # AZs are region specific
//private_subnets = "10.139.1.0/24,10.139.2.0/24,10.139.3.0/24" # Creating one private subnet per AZ
subnets  = "10.100.10.0/24,10.100.20.0/24" # Creating one subnet per AZ
//


#--------------------------------------------------------------
# Compute
#--------------------------------------------------------------

ami                     = "ami-80861296"
instance_type           = "t2.micro"

