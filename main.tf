#resource "aws_instance" "web" {
 # ami           = "ami-0cea098ed2ac54925"
  #instance_type = "t2.micro"

  #tags = {
   # Name = "HelloWorld"
  #}
#}

provider "aws" {
  region = "us-west-2"

}

################vpc block###############
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}


#############Internet gateway###############

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "igw"
  }
}

#######Subnet###################
resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet"
  }
}

############Route Table##############
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.myvpc.id

  route = []
  tags = {
    Name = "example"
  }
}

#######Route###############
resource "aws_route" "route" {
  route_table_id            = "aws_route_table.example.id"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.rt]
}

