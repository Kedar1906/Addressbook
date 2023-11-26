provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "ec2" {
  ami                    = "ami-0287a05f0ef0e9d9a"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              =  aws_subnet.addbook-public-subnet-01.id
  key_name               = "ssh_key"
  instance_type          = "t2.micro"
  for_each               = toset(["jenkins-master", "jenkins-slave", "ansible"])
  tags = {
    name = "${each.key}"
  }
}

resource "aws_security_group" "sg" {
  name   = "sec_grp"
  vpc_id = aws_vpc.addbook-vpc.id

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    protocol    = "TCP"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "addbook-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    name = "add-vpc"
  }
}
resource "aws_subnet" "addbook-public-subnet-01" {
  vpc_id                  = aws_vpc.addbook-vpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"
  tags = {
    name = "addbook-public-subnet-01"
  }
}

resource "aws_subnet" "addbook-public-subnet-02" {
  vpc_id                  = aws_vpc.addbook-vpc.id
  cidr_block              = "10.1.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"
  tags = {
    name = "addbook-public-subnet-02"
  }
}

resource "aws_internet_gateway" "addbook-igw" {
  vpc_id = aws_vpc.addbook-vpc.id
  tags = {
    name = "addbook-igw"
  }
}

resource "aws_route_table" "addbook-route" {
  vpc_id = aws_vpc.addbook-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.addbook-igw.id
  }
}

resource "aws_route_table_association" "addbook-route-subenet01" {
  subnet_id      = aws_subnet.addbook-public-subnet-01.id
  route_table_id = aws_route_table.addbook-route.id
}

resource "aws_route_table_association" "addbook-route-subnet02" {
  route_table_id = aws_route_table.addbook-route.id
  subnet_id      = aws_subnet.addbook-public-subnet-02.id
}