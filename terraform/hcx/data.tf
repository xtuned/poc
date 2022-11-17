#grab the latest ami
data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2016-English-Full-Base"
}

data "aws_availability_zones" "this" {}
