output "jenkins_master_ip" {
  value = aws_instance.jenkins_master.public_ip
}

output "jenkins_worker_ip" {
  value = {
    for worker in aws_instance.jenkins_worker :
    worker.id => worker.public_ip
  }
}