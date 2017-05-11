output "instance_ips" {
  value = "${join(",", aws_instance.ec2juan.*.public_ip)}"
}
