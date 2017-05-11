output "subnets_id" {
  value = "${join(",", aws_subnet.subnet.*.id)}"
}
