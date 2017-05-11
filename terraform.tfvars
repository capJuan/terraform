#--------------------------------------------------------------
# ssh public key
#
#  please copy your public ssh key here from ~/.ssh/id_rsa.pub # You don't need to do this, you can just use file interpolation
#--------------------------------------------------------------
public_key = "~/.ssh/id_rsa.pub"


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
