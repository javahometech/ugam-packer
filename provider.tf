# Current Account
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
  alias  = "ugam"
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::041375994901:role/hari-cross-account-access"
    session_name = "cross-account-demo"
  }
}
# define resource for vpc
resource "aws_vpc" "main" {
#   provider         = aws.ugam
  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"
  tags = {
    "Name"     = "myvpc-manual"
    "Location" = "Mumbai"
  }
}