variable "region" {
  description = "Stockholm"
  default     = "eu-north-1"
  type        = string
}
variable "ami_id" {
  description = "amazon linux 2"
  type        = string

}
variable "instance_type" {
  description = "instance type"
  type        = string
}
variable "key_name" {
  description = "Key Name"
  type        = string
}
variable "subnet_id" {
  description = "subnet from default vpd"
  type        = string
}
variable "tags" {
  type = map(string)
  default = {
    "Name"        = "Jenkins-server"
    "Environment" = "Jenkins-dev"
  }
}
variable "security_groups" {
  description = "security groups"
  type        = string
}
variable "ports" {
  description = "list of ports open"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
variable "ssh_port" {
  description = "ssh port"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_blocks = list(string)
  }))
}
