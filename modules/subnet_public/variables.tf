variable "vpc_id" { 
    type = string
     }
variable "Public_subnets_cidrs" {
  type = list(string)
   }
variable "public_subnets_azs" {
  type = list(string)
   }
   
variable "project" { 
    type = string
     }
variable "environment" { 
    type = string
     }