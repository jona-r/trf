provider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "DemoInstance" {
  key_name   = "test" 
  public_key = file("~/.ssh/id_ed25519.pub") 
}

resource "aws_instance" "DemoInstance" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"
  key_name      = aws_key_pair.DemoInstance.key_name
  user_data     = file("/terraform/test/userdata.sh")  
  tags = {
    Name = "DemoInstance"
  }
}
