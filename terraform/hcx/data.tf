#grab the latest ami
data "aws_ssm_parameter" "windows" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2016-English-Full-Base"
}
data "aws_ssm_parameter" "ubuntu_18_04" {
  name = "/aws/service/canonical/ubuntu/server/18.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}
data "aws_ssm_parameter" "ubuntu_20_04" {
  name = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}
data "aws_availability_zones" "this" {}

#define user data
data "template_cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false
  part {
    content = <<EOF
#cloud-config
---
users:
  - name: "${local.ssh_user}"
    gecos: "${local.ssh_user}"
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: wheel
    shell: /bin/bash
    ssh_authorized_keys:
    - "${tls_private_key.this.public_key_openssh}"
EOF
  }

  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/install.sh")
  }
}

output "user_data" {
  value = data.template_cloudinit_config.user_data.rendered
}
