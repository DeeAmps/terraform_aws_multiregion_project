resource "aws_vpc" "vpc_master" {
  provider             = aws.region-master
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "master-vpc-jenkins"
  }
}

resource "aws_vpc" "vpc_worker" {
  provider             = aws.region-worker
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "worker-vpc-jenkins"
  }
}

resource "aws_vpc_peering_connection" "master_vpc_requester" {
  vpc_id      = aws_vpc.vpc_master.id
  peer_vpc_id = aws_vpc.vpc_worker.id
  provider    = aws.region-master
  peer_region = var.region_worker
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "vpc_connection_accepter" {
  provider                  = aws.region-worker
  vpc_peering_connection_id = aws_vpc_peering_connection.master_vpc_requester.id
  auto_accept               = true

}