# SSH Design via Bastion Host

This project uses a bastion host as a single SSH entry point.

## SSH Flow

Local Machine
   |
   | SSH (Public IP)
   v
Bastion Host
   |
   | SSH (Private IP)
   v
Jenkins / Ansible

## SSH Config Template (to be enabled after terraform apply)

Host bastion
  HostName <BASTION_PUBLIC_IP>
  User ec2-user
  IdentityFile ~/.ssh/deployer-one

Host jenkins
  HostName <JENKINS_PRIVATE_IP>
  User ec2-user
  IdentityFile ~/.ssh/deployer-one
  ProxyJump bastion

Host ansible
  HostName <ANSIBLE_PRIVATE_IP>
  User ec2-user
  IdentityFile ~/.ssh/deployer-one
  ProxyJump bastion
