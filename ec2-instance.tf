# Resource: EC2 Instance


# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  #instance_type = var.instance_type
  instance_type = var.instance_type_list[1] #For list
  #instance_type = var.instance_type_map[prod] #For map
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  #create EC2 instance in all Availabilty Zones of a VPC
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key
  #count = 2 #specifying count=5 means 5 instances(resources) will be created
  tags = {
    
    #"Name" = "count-demo-${count.index}" #name that will appear on AWS Console
    "Name" = "for-each-demo-${each.key}" #name that will appear on AWS Console
  }
}
#count = 5
#count.index will be 0, 1, 2, 3, 4

#count = 2
#count.index will be 0, 1