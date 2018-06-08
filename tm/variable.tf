variable "private_key_path" {}

variable "aw_region" {
  default = "us-east-2"
}

variable "aw_access_key" {
  type = "string"
}

variable "aw_secret_key" {
  type = "string"
}

variable "vpc-id" {
  default = "vpc-8374f6eb"
}

variable "amiid" {
  default = "ami-6a003c0f"
}

variable "keyname" {
  default = "jenkins1"
}
