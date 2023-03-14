resource "aws_subnet" "master_subnet_1" {
  vpc_id            = aws_vpc.vpc_master.id
  provider          = aws.region-master
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.master_azs.names[0]

  tags = {
    Name = "master_subnet_1"
  }
}

resource "aws_subnet" "master_subnet_2" {
  vpc_id            = aws_vpc.vpc_master.id
  provider          = aws.region-master
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.master_azs.names[1]

  tags = {
    Name = "master_subnet_2"
  }
}

resource "aws_subnet" "worker_subnet_1" {
  vpc_id            = aws_vpc.vpc_worker.id
  provider          = aws.region-worker
  cidr_block        = "192.168.1.0/24"
  availability_zone = data.aws_availability_zones.worker_azs.names[0]

  tags = {
    Name = "worker_subnet_1"
  }
}