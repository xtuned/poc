subnet_id = "subnet-08b3cc4600c7c8874"
vpc_id = "vpc-06892c79ff2cd6a0e"
attach_public_ip = true
region = "us-west-2"
tags = {
  StackName = "hcx"
  ManagedBy = "Terraform"
  POC = "dvincent"
}
vms = {
  vm1 = {
    Name = "hcx-vmc-test-01"
  }
  vm2 = {
    Name = "hcx-vmc-test-02"
  }
}