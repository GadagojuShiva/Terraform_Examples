resource "aws_instance" "ec2-aws_instance" {
  ami           = var.aws_ami_id
  subnet_id     = var.aws_subnet_id
  instance_type = var.aws_instance_type
}
