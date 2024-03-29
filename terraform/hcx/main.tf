locals {
  ssh_user = "vmware-user"
  os = {
    ubuntu_18_04 = data.aws_ssm_parameter.ubuntu_18_04.value
    ubuntu_20_04 = data.aws_ssm_parameter.ubuntu_20_04.value
    Windows      = data.aws_ssm_parameter.windows.value
  }
}
#generate rsa private key
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# create key
resource "aws_key_pair" "this" {
  key_name   = "${var.stack_name}-${terraform.workspace}-ec2-ssh-key"
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.this.key_name}.pem"
  content  = tls_private_key.this.private_key_pem
}

#create windows SG
# Define the security group for the Windows server
resource "aws_security_group" "this" {

  name        = "${var.stack_name}-${terraform.workspace}-sg"
  description = "allow rdp"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.security_group_ingress
    iterator = item
    content {
      from_port   = item.value.port
      protocol    = "tcp"
      cidr_blocks = item.value.cidr_blocks
      to_port     = item.value.port
      description = item.value.description
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#lunch the ec2
resource "aws_instance" "this" {
  for_each                    = var.vms
  ami                         = each.value.use_custom_ami ? each.value.ami : lookup(local.os, each.value.os)
  instance_type               = each.value.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  source_dest_check           = false
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = var.attach_public_ip
  # user_data                   = each.value.os_type == "Windows" ? templatefile("${path.module}/install.ps", { computer_name = each.value.Name }) : templatefile("${path.module}/install.sh", { computer_name = each.value.Name })
  user_data         = each.value.os_type == "Windows" ? templatefile("${path.module}/install.ps", { computer_name = each.value.Name }) : templatefile("${path.module}/install.sh", { computer_name = each.value.Name })
  get_password_data = each.value.os == "Windows" ? true : false
  tags = {
    Name = each.value.Name
  }
}
