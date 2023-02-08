subnet_id = "subnet-08b3cc4600c7c8874"
vpc_id = "vpc-06892c79ff2cd6a0e"
attach_public_ip = true
region = "us-west-2"
tags = {
  StackName = "hcx"
  ManagedBy = "Terraform"
  POC = "mcsa"
}
security_group_ingress = [
  {
    port        = 3389
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  },
  {
    port  = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections"
  }
]
vms = {
  vm1 = {
    Name = "hcx-vmc-test-03"
    ami =  "rhel7_7"
    instance_type = "t3.small"
    add_user_data = false
  }
}