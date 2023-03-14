resource "aws_key_pair" "master_key" {
  provider   = aws.region-master
  key_name   = "master_key"
  public_key = file("./aws_key.pub")
}

resource "aws_key_pair" "worker_key" {
  provider   = aws.region-worker
  key_name   = "worker_key"
  public_key = file("./aws_key.pub")
}