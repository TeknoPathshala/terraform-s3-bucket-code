resource "aws_instance" "ec2_1" {
  ami           = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.selected.id
  key_name = var.my_key
  tags = {
    Name = "HelloWorld"
  }
}
