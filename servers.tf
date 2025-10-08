data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
  name   = "name"
  values = ["ubuntu/images/*"]
}


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


resource "aws_security_group" "server" {

  name   = "server_primer"
  vpc_id = aws_vpc.primer.id
  ingress {
    description = "SSH conexion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "permitir trafico de salida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = var.tipo_de_instancia
  subnet_id                   = aws_subnet.primer_1.id
  associate_public_ip_address = var.include_ipv4
  vpc_security_group_ids      = [aws_security_group.server.id]
  tags = {
    name = "web-1"
  }
}

output "dir_red" {
 value = aws_instance.web.private_ip
}