variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "subnet_id" {
  description = "subnet id for this resource"
}

variable "region" {
  description = "region to provision resources"
  type        = string
  default     = "us-east-1"
}

variable "stack_name" {
  default     = "demo"
  description = "stack name for this project"
  type        = string
}

variable "instance_type" {
  description = "aws ec2 instance type"
  type        = string
  default     = "t3.large"
}

variable "attach_public_ip" {
  description = "choose to attach public ip or not"
  type        = bool
  default     = false
}

variable "tags" {
  description = "tags to associate to this resource"
  type        = map(string)
}
variable "vms" {
  description = "vm names"
  type = map(object({
    use_custom_ami = bool
    Name           = string
    os             = string
    ami            = string
    instance_type  = string
    add_user_data  = bool
  }))
  default = null
}

variable "security_group_ingress" {
  description = "list of security group ports"
  type = list(object({
    port        = number
    cidr_blocks = list(string)
    description = string
  }))
}
