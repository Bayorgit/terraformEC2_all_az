# Terraform Output Values

# EC2 Instance Public IP
# output "instance_publicip" {
#   description = "EC2 Instance Public IP"
#   value = aws_instance.myec2vm.public_ip
# }

# EC2 Instance Public DNS
# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   value = aws_instance.myec2vm.public_dns
# }

#output map/list when using count=n in ec2-instance.tf
# Output - For loop with list
/*
output "for_output_list" {
  description = "For loop with list"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}*/

#Output - For loop with map
/*
output "for_output_map1" {
  description = "For loop with map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns} 
}*/

#Output - For loop with map advance
/*
output "for_output_map2" {
  description = "For loop with map advance"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}*/

# Output Legacy Splat Operator (Legacy) - Returns the list
/*
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}*/

#Output Latest Generalized Splat Operator - Returns the list
/*
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value = aws_instance.myec2vm[*].public_dns
}*/


# EC2 Instance Public IP with TOSET
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  #value = aws_instance.myec2vm.*.public_ip   # Legacy Splat
  #value = aws_instance.myec2vm[*].public_ip  # Latest Splat
  value = toset([
      for myec2vm in aws_instance.myec2vm : myec2vm.public_ip
    ])  
}

# EC2 Instance Public DNS with TOSET
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.myec2vm[*].public_dns  # Legacy Splat
  #value = aws_instance.myec2vm[*].public_dns  # Latest Splat
  value = toset([
      for myec2vm in aws_instance.myec2vm : myec2vm.public_dns
    ])    
}

# EC2 Instance Public DNS with MAPS
output "instance_publicdns2" {
  value = tomap({
    for s, myec2vm in aws_instance.myec2vm : s => myec2vm.public_dns
    # S intends to be a subnet ID
  })
}