resource "aws_vpc" "primer" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "primer_1" {
  vpc_id            = aws_vpc.primer.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    name = "subnet-1 de primer"
  }

}


resource "aws_subnet" "primer_2" {
  vpc_id            = aws_vpc.primer.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"
  tags = {
    name = "subnet-2 de primer"
  }

}


resource "aws_subnet" "primer_3" {
  vpc_id            = aws_vpc.primer.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = "us-east-1c"
  tags = {
    name = "subnet-3 de primer"
  }

}


resource "aws_vpc" "primer_dr" {
  provider   = aws.europa
  cidr_block = "172.16.0.0/16"
  tags = {
    name = "desastres"
  }
}


output "id_vpc" {

  value = aws_vpc.primer.cidr_block

}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.primer.id
  tags = {
    name = "primer_gateway"
  }


}

resource "aws_route_table" "primer_rt" {
  vpc_id = aws_vpc.primer.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

  }
}

resource "aws_route_table_association" "primer_sub1" {
  subnet_id      = aws_subnet.primer_1.id
  route_table_id = aws_route_table.primer_rt.id
}
resource "aws_route_table_association" "primer_sub2" {
  subnet_id      = aws_subnet.primer_2.id
  route_table_id = aws_route_table.primer_rt.id
}
resource "aws_route_table_association" "primer_sub3" {
  subnet_id      = aws_subnet.primer_3.id
  route_table_id = aws_route_table.primer_rt.id
}


