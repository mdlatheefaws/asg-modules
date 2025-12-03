variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

# variable "project" {
#   type    = string
#   default = "demo"
# }

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  type    = string
  
}
variable "public_subnet2_cidr" {
  type    = string
  
}


variable "public_subnet1_az" {
  type    = string
  default = "ap-south-1a"
}
variable "public_subnet2_az" {
  type    = string
  default = "ap-south-1b"
}

# variable "ami_id" {
#   type = string
# }

variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  #default = "ubuntu-ap-key"
}
variable "name_prefix" { 
    type = string
     default = "frontend"
      }
variable "instance_name" {
     type = string
 default = "Rhel-Proj1" 
 }
variable "ami_id" { 
   # type = string
   # default = "ami-087d1c9a513324697"
     }
variable "instance_type" {
     type = string
      default = "t3.micro" 
      }

# variable "security_group_ids" {
#      type = list(string)
#       default = [] 
#       }
variable "user_data_file" {
     type = string 
     default = "Frontend.sh"
      }
variable "asg_name" {
     type = string 
     default = "autoscaling-project" 
     }
variable "max_size" {
     type = number
      default = 3 
      }
variable "min_size" { 
    type = number
     default = 1
      }
variable "desired_capacity" { 
    type = number
     default = 1
      }
variable "force_delete" { 
    type = bool
     default = true 
     }
variable "health_check_type" { 
    type = string
     default = "EC2"
      }
variable "health_check_grace_period" { 
    type = string
     default = 60 
     }
# variable "subnet_ids" {
#      type = list(string)
#       }
variable "scale_out_adjustment" { 
    type = number
     default = 1
      }
variable "scale_in_adjustment" {
     type = number
      default = -1 
      }
variable "scale_out_cooldown" {
     type = number
      default = 60 
      }
variable "scale_in_cooldown" { 
  
    type = number
     default = 60
      }
variable "alarm_period" {
     type = number
      default = 60 
      }
variable "alarm_evaluation_periods" {
     type = number
      default = 1 
      }
variable "alarm_high_threshold" {
     type = number
      default = 50 
      }
variable "alarm_low_threshold" {
     type = number
      default = 20 
      }
variable "tags" {
     type = map(string)
      default = {}
       }
       variable "sg_name" {
     type = string
          default = "frontend-sg"
       }
variable "description" { 
    type = string
     default = "Allow SSH, HTTP, HTTPS" 
     }
variable "ssh_cidrs" {
     type = list(string)
      default = ["0.0.0.0/0"] 
      }
variable "http_cidrs" {
     type = list(string)
     default = ["0.0.0.0/0"] 
     }
variable "https_cidrs" {
     type = list(string)
      default = ["0.0.0.0/0"] 
      }

      ###alb
       variable "project" {
          type = string
          default = "ursaminor"
       }  