data "aws_availability_zones" "master_azs" {
  provider = aws.region-master
  state    = "available"
}

data "aws_availability_zones" "worker_azs" {
  provider = aws.region-worker
  state    = "available"
}

data "aws_ssm_parameter" "master_ami" {
  provider = aws.region-master
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_ssm_parameter" "worker_ami" {
  provider = aws.region-worker
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}