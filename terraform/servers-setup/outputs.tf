output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "jenkins_private_ip" {
  value = aws_instance.jenkins.private_ip
}

output "ansible_private_ip" {
  value = aws_instance.ansible.private_ip
}
output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}
