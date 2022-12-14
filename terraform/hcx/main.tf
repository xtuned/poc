#generate rsa private key
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# create key
resource "aws_key_pair" "this" {
  key_name   = "ec2-ssh-key"
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.this.key_name}.pem"
  content  = tls_private_key.this.private_key_pem
}

#create windows SG
# Define the security group for the Windows server
resource "aws_security_group" "this" {
  name        = "${var.stack_name}-windows-rdp-sg"
  description = "allow rdp"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
    description = "Allow incoming RDP connections"
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
  ami = data.aws_ssm_parameter.ami.value
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  source_dest_check = false
  key_name = aws_key_pair.this.key_name
  associate_public_ip_address = var.attach_public_ip
  user_data = templatefile("${path.module}/install.ps",{})
  get_password_data = true

}