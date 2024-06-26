output "instance_Tag" {
  value = aws_instance.jenkins-server.tags_all
}
output "public_ip" {
  value = aws_instance.jenkins-server.public_ip
}
output "instance_availability_zone" {
  value = aws_instance.jenkins-server.availability_zone
}
output "intance_type" {
  value = aws_instance.jenkins-server.instance_type
}
output "security_group_name" {
  value = aws_security_group.security_groups.name
}