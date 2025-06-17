resource "aws_instance" "myserver" {
  ami           = "ami-020cba7c55df1f615"    # Replace with your instance's AMI
  instance_type = "t2.micro"                 # Replace with your instance's type
}

# import {
#   to = aws_instance.myserver
#   id = "i-00d6d02f60465886c"
# }
