output "igw_id" { value = aws_internet_gateway.ladsoft-igw.id }
output "public_route_table_id" { value = [aws_route_table.public1.id, aws_route_table.public2.id] }
output "public_route_table_association_id" { value = [aws_route_table_association.public_assoc1.id, aws_route_table_association.public_assoc2.id] }