provider "aws" {
  region = "us-east-1"
}

# 1. Criando a VPC Scorpion
resource "aws_vpc" "scorpion_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "scorpion-vpc"
    Projeto = "Scorpion"
  }
}

# 2. Criando Subnet Pública (Para o Load Balancer)
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.scorpion_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "scorpion-public-1"
    "kubernetes.io/role/elb" = "1" # Tag essencial para o EKS saber onde colocar o LB
  }
}

# 3. Criando Subnet Privada (Onde os Nodes do EKS vão morar - Mais Seguro!)
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.scorpion_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "scorpion-private-1"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

# 4. Internet Gateway para permitir saída de dados
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.scorpion_vpc.id

  tags = { Name = "scorpion-igw" }
}

# 5. Segunda Subnet Pública (Exigência do EKS para Alta Disponibilidade)
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.scorpion_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "scorpion-public-2"
    "kubernetes.io/role/elb" = "1"
  }
}

# 6. Tabela de Roteamento para as Subnets Públicas acessarem a Internet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.scorpion_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt.id
}
