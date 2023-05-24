subnet_id        = "subnet-08b3cc4600c7c8874"
vpc_id           = "vpc-06892c79ff2cd6a0e"
attach_public_ip = true
region           = "us-west-2"
tags = {
  StackName = "hcx"
  ManagedBy = "Terraform"
  POC       = "mcsa"
}
security_group_ingress = [
  {
    port        = 3389
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  },
  {
    port        = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections"
  }
]
vms = {
  # vm1 = {
  #   use_custom_ami = false
  #   Name = "hcx-vmc-test-03"
  #   ami =  ""
  #   os = "rhel7_1"
  #   instance_type = "t3.small"
  #   add_user_data = false
  # },
  vm2 = {
    use_custom_ami = true
    Name           = "hcx-vmc-test-03"
    os             = "linux"
    ami            = "ami-087a8e5b8438d3481"
    instance_type  = "t3.small"
    add_user_data  = false
  },
}
