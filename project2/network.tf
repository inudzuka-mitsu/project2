resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_data[0].cidr_block

  tags = {
    Name = var.vpc_data[0].name
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_data[0].cidr_block
  availability_zone = var.subnet_data[0].az
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_data[0].name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.public-rt.id
}