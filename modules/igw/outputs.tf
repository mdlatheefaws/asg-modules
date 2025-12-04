output "igw_id" { value = aws_internet_gateway.ladsoft_vpc_igw.id }
  
output "public_route_table_id" { 
    value = aws_route_table.public_subnets.id
     }
output "public_route_table_association_ids" {
    description = "IDs of public route table associations"
    value       = values(aws_route_table_association.public_assoc)[*].id
}