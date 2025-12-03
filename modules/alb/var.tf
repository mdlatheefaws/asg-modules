variable "vpc_id" { type = string }
# expects list (we keep single-subnet list)
variable "public_subnet_ids" { type = list(string) }
variable "project" { type = string }
variable "environment" { type = string }

variable "http_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "target_port" {
  type    = number
  default = 80
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_interval" { 
    type = number
 default = 30 
 }
variable "health_check_timeout" {
     type = number
      default = 5 
      }
variable "healthy_threshold" { 
    type = number
     default = 2
      }
variable "unhealthy_threshold" {
     type = number
      default = 2 
      }
