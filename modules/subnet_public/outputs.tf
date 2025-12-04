output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}
# output "public_subnets_ids" {
#   value = aws_subnet.public_subnets[*].id
# }