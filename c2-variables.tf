# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
  default = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key1"
}

# AWS EC2 Instance_Type - List
variable "instance_type_list" {
  description = "EC2 instance_type_list"
  type = list (string)
  default = ["t3.micro", "t2.micro", "t3.large"] #that will be t3.micro=0,t2.micro=1,t3.large=2
  
}

# AWS EC@ Instance_Type - Map 
variable "instance_type_map" {
  description = "EC2 instance_type_map"
  type = map (string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t2.micro"
    "prod" = "t3.large"
  }
  
}
