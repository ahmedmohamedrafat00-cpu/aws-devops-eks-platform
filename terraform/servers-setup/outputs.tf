output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "jenkins_private_ip" {
  value = aws_instance.jenkins.private_ip
}

output "ansible_private_ip" {
  value = aws_instance.ansible.private_ip
}
