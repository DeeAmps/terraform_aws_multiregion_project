resource "aws_internet_gateway" "master_igw" {
  vpc_id   = aws_vpc.vpc_master.id
  provider = aws.region-master
  tags = {
    Name = "master_igw"
  }
}

resource "aws_internet_gateway" "worker_igw" {
  vpc_id   = aws_vpc.vpc_worker.id
  provider = aws.region-worker

  tags = {
    Name = "worker_igw"
  }
}