locals {
  expected_len = length(var.Public_subnets_cidrs)
}
resource "aws_subnet" "public_subnets" {
  count             = length(var.Public_subnets_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = var.Public_subnets_cidrs[count.index]
  availability_zone = var.public_subnets_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-${var.environment}-public-${count.index + 1}"
  }
  }


