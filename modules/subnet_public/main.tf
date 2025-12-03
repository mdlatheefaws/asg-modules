resource "aws_subnet" "public1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.public_subnet1_az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-${var.environment}-public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = var.public_subnet2_az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-${var.environment}-public-2"
  }
}
