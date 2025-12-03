variable "vpc_id" { 
    type = string 
    }
variable "sg_name" {
     type = string
       }
variable "description" { 
    type = string
     
     }
variable "ssh_cidrs" {
     type = list(string)
      
      }
variable "http_cidrs" {
     type = list(string)
      
     }
variable "https_cidrs" {
     type = list(string)
      
      }
