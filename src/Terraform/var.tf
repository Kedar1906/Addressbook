variable "region" {
  default = "ap-south-1"
}

variable "zone" {
  default = "ap-south-1a"
}
variable "ami" {
  type = map(any)
  default = {
    ap-south-1 = "ami-01216e7612243e0ef"
  }
}
variable "vpc" {
  default = "vpc-0eafd5f63fb46f05d"
}
variable "pub_key" {
  default = "mykey.pub"
}
variable "private_key" {
  default = "mykey"
}