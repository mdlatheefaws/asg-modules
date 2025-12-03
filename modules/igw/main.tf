resource "aws_internet_gateway" "ladsoft-igw" {
  vpc_id = var.vpc_id
  tags = { Name = "${var.project}-${var.environment}-igw" }
}

resource "aws_route_table" "public1" {
  vpc_id = var.vpc_id
  tags = { Name = "${var.project}-${var.environment}-public-rt" }
}
resource "aws_route_table" "public2" {
  vpc_id = var.vpc_id
  tags = { Name = "${var.project}-${var.environment}-public-rt" }
}


resource "aws_route" "default_to_igw1" {
  route_table_id         = [aws_route_table.public1.id, 
                            aws_route_table.public2.id]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ladsoft-igw.id
}



resource "aws_route_table_association" "public_assoc1" {
  subnet_id      = [ var.public_subnet1_id, 
                    var.public_subnet2_id ]
  route_table_id = [aws_route_table.public1.id, aws_route_table.public2.id]
}

