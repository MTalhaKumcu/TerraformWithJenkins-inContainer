provider "aws" {
  region = var.region
}
resource "aws_instance" "jenkins-server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.security_groups.id]
  user_data       = templatefile("${path.module}/docker.sh", {})
  tags            = var.tags
  key_name        = var.key_name
  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}
data "aws_vpc" "default" {
  default = true
}
resource "aws_security_group" "security_groups" {
  name        = var.security_groups
  description = "security group"
  vpc_id      = data.aws_vpc.default.id
  tags        = var.tags
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "ingress" {
    for_each = var.ssh_port
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


