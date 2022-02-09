//////////////////////////////////////
//Instance Module ////////////////////
//////////////////////////////////////

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["Dev", "Prod", "QA"])

  name = "${each.key}-instance"


  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  key_name               = "terra_key"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.testing_sec_group.id]
  subnet_id              = module.vpc.public_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "Testing"
    }
  }