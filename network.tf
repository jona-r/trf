resource "aws_subnet" "subnet" {
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  vpc_id = aws_vpc.demovpc.id
}

resource "aws_route_table" "demoroute" {
  vpc_id = aws_vpc.demovpc.id
}

resource "aws_vpc" "demovpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_route" "demoroute" {
  route_table_id         = aws_route_table.demoroute.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demoig.id
}

resource "aws_internet_gateway" "demoig" {
  vpc_id = aws_vpc.demovpc.id
}

