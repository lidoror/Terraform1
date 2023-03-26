output "ec2_key_name" {
  value = data.aws_key_pair.web_server_key.key_name
}

output "ec2_key_id" {
  value = data.aws_key_pair.web_server_key.id
}

output "ec2_key_fingerprint" {
  value = data.aws_key_pair.web_server_key.fingerprint
}

output "jenkins_server_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "k0s_server_public_ip" {
  value = aws_instance.k0s_server.public_ip
}