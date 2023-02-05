variable "vpc_id" {
  description = "vpc id"
  type = string
}

variable "subnet_id" {
  description = "subnet id for this resource"
}

variable "region" {
  description = "region to provision resources"
  type = string
  default = "us-east-1"
}

variable "stack_name" {
  default = "demo"
  description = "stack name for this project"
  type = string
}

variable "cidr_blocks" {
  description = "IP range to allow rdp connection"
  default = ["0.0.0.0/0"]
  type = list(string)
}

variable "instance_type" {
  description = "aws ec2 instance type"
  type = string
  default = "t3.large"
}

variable "attach_public_ip" {
  description = "choose to attach public ip or not"
  type = bool
  default = false
}

variable "tags" {
  description = "tags to associate to this resource"
  type = map(string)
}
variable "vms" {
  description = "vm names"
  type = map(object({
    Name = string
    ami = string
    instance_type = string
    add_user_data = bool
  }))
}
