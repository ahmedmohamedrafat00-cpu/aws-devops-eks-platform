resource "aws_instance" "ansible" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_2.id
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "${local.name_prefix}-ansible"
    Role = "ansible"
  }
}
