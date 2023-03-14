resource "aws_instance" "jenkins_master" {
  provider                    = aws.region-master
  ami                         = data.aws_ssm_parameter.master_ami.value
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.master_key.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.master_subnet_1.id
  vpc_security_group_ids = [
    aws_security_group.jenkins_master_sg.id,
  ]
  tags = {
    Name = "jenkins_master"
  }
  depends_on = [
    aws_route_table_association.master_subnet_1_association,
  ]
}

resource "aws_instance" "jenkins_worker" {
  provider                    = aws.region-worker
  ami                         = data.aws_ssm_parameter.worker_ami.value
  count                       = var.worker_count
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.worker_key.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.worker_subnet_1.id
  vpc_security_group_ids = [
    aws_security_group.jenkins_worker_sg.id,
  ]
  tags = {
    Name = "jenkins_worker_${count.index}"
  }
  depends_on = [
    aws_route_table_association.worker_subnet_1_association,
    aws_instance.jenkins_master,
  ]
}