variable "name_prefix" { 
    type = string
     
      }
variable "instance_name" {
     type = string
 
 }
variable "ami_id" { 
    type = string
     }
     
variable "instance_type" {
     type = string
 
      }
variable "key_name" {
     type = string
     
      }
variable "security_group_ids" {
     type = list(string)
      default = [] 
      }
variable "user_data_file" {
     type = string 
    
      }
variable "asg_name" {
     type = string 
     default = "autoscaling-project" 
     }
variable "max_size" {
     type = number
      
      }
variable "min_size" { 
    type = number
    
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
    
     }
variable "subnet_ids" {
     type = list(string)
      }
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

variable "target_group_arns" {
  type        = list(string)
  default     = []
  description = "List of ALB target group ARNs that the ASG should register instances into"
}
