/////////////////////////////////
/////////////VARIABLES
////////////////////////////////

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {}
////////////////////////////////////
////////////PROVIDER
//////////////////////////////

provider "aws" {
    access_key = var.aws_access_key 
    secret_key = var.aws_secret_key
    region     = var.region
}


/////////////////////////////////////
////////////VPC MODULE
////////////////////////////////////


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Multi_EC2"
  cidr = "10.0.0.0/16"


  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true


 tags = {
    Terraform = "true"
    Environment = "Envronment - Testing"
  }
}