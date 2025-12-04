resource "aws_internet_gateway" "ladsoft_vpc_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.project}-${var.environment}-igw"
  }
}

resource "aws_route_table" "public_subnets" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.project}-${var.environment}-public-rt"
  }
}

resource "aws_route" "default_to_igw" {
  route_table_id         = aws_route_table.public_subnets.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ladsoft_vpc_igw.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each = {
    subnet1 = var.public_subnet1_id
    subnet2 = var.public_subnet2_id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.public_subnets.id
}
