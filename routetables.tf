resource "aws_route_table" "region-master-public-rt" {
  vpc_id   = aws_vpc.vpc_master.id
  provider = aws.region-master

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.master_igw.id
  }

  route {
    cidr_block                = "192.168.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.master_vpc_requester.id
  }

  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "region-master-public-rt"
  }
}

resource "aws_route_table" "region-worker-public-rt" {
  vpc_id   = aws_vpc.vpc_worker.id
  provider = aws.region-worker

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.worker_igw.id
  }

  route {
    cidr_block                = "10.0.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.master_vpc_requester.id
  }

  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "region-worker-public-rt"
  }
}

resource "aws_route_table_association" "master_subnet_1_association" {
  provider       = aws.region-master
  subnet_id      = aws_subnet.master_subnet_1.id
  route_table_id = aws_route_table.region-master-public-rt.id
}

resource "aws_route_table_association" "master_subnet_2_association" {
  provider       = aws.region-master
  subnet_id      = aws_subnet.master_subnet_2.id
  route_table_id = aws_route_table.region-master-public-rt.id
}

resource "aws_route_table_association" "worker_subnet_1_association" {
  provider       = aws.region-worker
  subnet_id      = aws_subnet.worker_subnet_1.id
  route_table_id = aws_route_table.region-worker-public-rt.id
}